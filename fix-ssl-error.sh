#!/bin/bash

# Quick Fix Script for SSL Certificate Error
# This script removes any existing HTTPS configuration and obtains a fresh SSL certificate

set -e  # Exit on any error

echo "========================================"
echo "SSL Certificate Error Fix"
echo "========================================"

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

# Variables
DOMAIN="softworldtechnologies.com"
WWW_DOMAIN="www.softworldtechnologies.com"
EMAIL="info@softworldusa.com"
APP_DIR="/home/ubuntu/softworld-new"

echo ""
echo "Step 1: Stopping Nginx temporarily..."
echo "--------------------------------------"
sudo systemctl stop nginx

echo ""
echo "Step 2: Cleaning up any partial/failed certificate attempts..."
echo "--------------------------------------"
if [ -d "/etc/letsencrypt/live/$DOMAIN" ]; then
    echo "Found existing certificate directory, backing it up..."
    sudo mv /etc/letsencrypt/live/$DOMAIN /etc/letsencrypt/live/$DOMAIN.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true
fi
if [ -d "/etc/letsencrypt/renewal/$DOMAIN.conf" ]; then
    sudo mv /etc/letsencrypt/renewal/$DOMAIN.conf /etc/letsencrypt/renewal/$DOMAIN.conf.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true
fi

echo ""
echo "Step 3: Backing up current Nginx configuration..."
echo "--------------------------------------"
sudo cp /etc/nginx/sites-available/vue-app /etc/nginx/sites-available/vue-app.backup.$(date +%Y%m%d_%H%M%S)

echo ""
echo "Step 4: Creating clean HTTP-only Nginx configuration..."
echo "--------------------------------------"
sudo tee /etc/nginx/sites-available/vue-app > /dev/null << EOF
server {
    listen 80;
    listen [::]:80;
    server_name $DOMAIN $WWW_DOMAIN;

    root $APP_DIR/dist;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
        add_header Cache-Control "no-cache, no-store, must-revalidate";
    }

    location = /index.html {
        add_header Cache-Control "no-cache, no-store, must-revalidate";
    }

    # Serve static assets with proper MIME types
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files \$uri =404;
    }

    error_log /var/log/nginx/vue-app-error.log;
    access_log /var/log/nginx/vue-app-access.log;
}
EOF

echo ""
echo "Step 5: Setting proper permissions..."
echo "--------------------------------------"
sudo chmod 755 /home/ubuntu
sudo chmod -R 755 $APP_DIR
sudo chown -R ubuntu:ubuntu $APP_DIR

echo ""
echo "Step 6: Testing Nginx configuration..."
echo "--------------------------------------"
sudo nginx -t

echo ""
echo "Step 7: Starting Nginx with HTTP-only configuration..."
echo "--------------------------------------"
sudo systemctl start nginx
sudo systemctl status nginx --no-pager

echo ""
echo "Step 8: Verifying HTTP access works..."
echo "--------------------------------------"
sleep 2
curl -I http://localhost || echo "Warning: localhost check failed, but continuing..."

echo ""
echo "Step 9: Running Certbot to obtain SSL certificate..."
echo "--------------------------------------"
echo "This will use HTTP-01 challenge (port 80 only)"
echo ""

# Use certbot with nginx plugin to obtain certificate and auto-configure
sudo certbot --nginx \
    -d $DOMAIN \
    -d $WWW_DOMAIN \
    --non-interactive \
    --agree-tos \
    --email $EMAIL \
    --redirect \
    --preferred-challenges http

echo ""
echo "Step 10: Verifying certificate was issued..."
echo "--------------------------------------"
sudo certbot certificates

echo ""
echo "Step 11: Testing automatic renewal..."
echo "--------------------------------------"
sudo certbot renew --dry-run

echo ""
echo "Step 12: Setting up automatic renewal cron job..."
echo "--------------------------------------"
if ! sudo crontab -l 2>/dev/null | grep -q "certbot renew"; then
    (sudo crontab -l 2>/dev/null; echo "0 0,12 * * * certbot renew --quiet --post-hook 'systemctl reload nginx'") | sudo crontab -
    echo "✓ Cron job added for automatic renewal"
else
    echo "✓ Cron job already exists"
fi

echo ""
echo "Step 13: Final Nginx reload..."
echo "--------------------------------------"
sudo systemctl reload nginx

echo ""
echo "========================================"
echo "✓ SSL Certificate Fix Complete!"
echo "========================================"
echo ""
echo "Your site should now be accessible via HTTPS:"
echo "  https://$DOMAIN"
echo "  https://$WWW_DOMAIN"
echo ""
echo "Testing HTTPS connection..."
curl -I https://$DOMAIN 2>&1 | head -5 || echo "Please test manually in your browser"
echo ""
echo "Certificate details:"
sudo openssl x509 -enddate -noout -in /etc/letsencrypt/live/$DOMAIN/fullchain.pem 2>/dev/null || echo "Certificate file check - please verify in browser"
echo ""

