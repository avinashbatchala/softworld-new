#!/bin/bash

# SSL Certificate Setup Script for softworldtechnologies.com
# This script installs Certbot and configures SSL/HTTPS for Nginx

set -e  # Exit on any error

echo "========================================"
echo "SSL Certificate Setup for softworldtechnologies.com"
echo "========================================"

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

# Variables
DOMAIN="softworldtechnologies.com"
WWW_DOMAIN="www.softworldtechnologies.com"
EMAIL="info@softworldusa.com"  # Change this to your admin email
APP_DIR="/home/ubuntu/softworld-new"

echo ""
echo "Step 1: Installing Certbot and Nginx plugin..."
echo "--------------------------------------"
sudo apt update
sudo apt install -y certbot python3-certbot-nginx

echo ""
echo "Step 2: Backing up current Nginx configuration..."
echo "--------------------------------------"
sudo cp /etc/nginx/sites-available/vue-app /etc/nginx/sites-available/vue-app.backup.$(date +%Y%m%d_%H%M%S)

echo ""
echo "Step 3: Creating temporary HTTP-only Nginx configuration..."
echo "--------------------------------------"
# Create a simple HTTP-only config for Certbot verification
sudo tee /etc/nginx/sites-available/vue-app > /dev/null << 'EOF'
server {
    listen 80;
    server_name softworldtechnologies.com www.softworldtechnologies.com;

    root /home/ubuntu/softworld-new/dist;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # Location for Certbot verification
    location ~ /.well-known/acme-challenge/ {
        allow all;
        root /var/lib/letsencrypt/;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files $uri =404;
    }

    error_log /var/log/nginx/vue-app-error.log;
    access_log /var/log/nginx/vue-app-access.log;
}
EOF

echo ""
echo "Step 4: Creating Certbot webroot directory..."
echo "--------------------------------------"
sudo mkdir -p /var/lib/letsencrypt
sudo chown -R www-data:www-data /var/lib/letsencrypt

echo ""
echo "Step 5: Testing Nginx configuration..."
echo "--------------------------------------"
sudo nginx -t

echo ""
echo "Step 6: Restarting Nginx with HTTP-only configuration..."
echo "--------------------------------------"
sudo systemctl restart nginx
sudo systemctl status nginx --no-pager

echo ""
echo "Step 7: Waiting for Nginx to be fully ready..."
echo "--------------------------------------"
sleep 3

echo ""
echo "Step 8: Obtaining SSL certificate from Let's Encrypt..."
echo "--------------------------------------"
echo "Domain: $DOMAIN and $WWW_DOMAIN"
echo "Email: $EMAIL"
echo ""

# Obtain certificate and auto-configure Nginx
sudo certbot --nginx \
    -d $DOMAIN \
    -d $WWW_DOMAIN \
    --non-interactive \
    --agree-tos \
    --email $EMAIL \
    --redirect

echo ""
echo "Step 9: Verifying SSL certificate..."
echo "--------------------------------------"
sudo certbot certificates

echo ""
echo "Step 10: Testing automatic renewal..."
echo "--------------------------------------"
sudo certbot renew --dry-run

echo ""
echo "Step 11: Setting up automatic renewal cron job..."
echo "--------------------------------------"
# Check if cron job already exists
if ! sudo crontab -l 2>/dev/null | grep -q "certbot renew"; then
    # Add cron job to renew certificate twice daily
    (sudo crontab -l 2>/dev/null; echo "0 0,12 * * * certbot renew --quiet --post-hook 'systemctl reload nginx'") | sudo crontab -
    echo "✓ Cron job added for automatic renewal"
else
    echo "✓ Cron job already exists"
fi

echo ""
echo "Step 12: Reloading Nginx with new SSL configuration..."
echo "--------------------------------------"
sudo systemctl reload nginx

echo ""
echo "========================================"
echo "✓ SSL Setup Complete!"
echo "========================================"
echo ""
echo "Your site is now accessible via HTTPS:"
echo "  https://$DOMAIN"
echo "  https://$WWW_DOMAIN"
echo ""
echo "Certificate details:"
sudo openssl x509 -enddate -noout -in /etc/letsencrypt/live/$DOMAIN/fullchain.pem
echo ""
echo "Auto-renewal is configured and will run twice daily."
echo "Certificates will be automatically renewed 30 days before expiry."
echo ""
echo "To manually check renewal status, run:"
echo "  sudo certbot renew --dry-run"
echo ""
echo "To view certificate information:"
echo "  sudo certbot certificates"
echo ""

