#!/bin/bash

# SSL Certificate Setup Script for softworldusa.com
# This script installs Certbot and configures SSL/HTTPS for Nginx

set -e  # Exit on any error

echo "========================================"
echo "SSL Certificate Setup for softworldusa.com"
echo "========================================"

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

# Variables
DOMAIN="softworldusa.com"
WWW_DOMAIN="www.softworldusa.com"
EMAIL="info@softworldusa.com"  # Change this to your admin email
APP_DIR="/home/ubuntu/softworld-new"

echo ""
echo "Step 1: Installing Certbot and Nginx plugin..."
echo "--------------------------------------"
sudo apt update
sudo apt install -y certbot python3-certbot-nginx

echo ""
echo "Step 2: Checking Nginx configuration..."
echo "--------------------------------------"
sudo nginx -t

echo ""
echo "Step 3: Ensuring Nginx is running..."
echo "--------------------------------------"
sudo systemctl start nginx
sudo systemctl status nginx --no-pager

echo ""
echo "Step 4: Obtaining SSL certificate from Let's Encrypt..."
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
echo "Step 5: Verifying SSL certificate..."
echo "--------------------------------------"
sudo certbot certificates

echo ""
echo "Step 6: Testing automatic renewal..."
echo "--------------------------------------"
sudo certbot renew --dry-run

echo ""
echo "Step 7: Setting up automatic renewal cron job..."
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
echo "Step 8: Reloading Nginx with new SSL configuration..."
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

