#!/bin/bash
# stop-and-fix-ssl.sh - Force HTTP-only SSL verification

set -e

echo "🔧 Fixing SSL certificate issue..."

# Stop Nginx completely
sudo systemctl stop nginx

# Clean up any failed certificate attempts
sudo rm -rf /etc/letsencrypt/live/softworldtechnologies.com
sudo rm -rf /etc/letsencrypt/archive/softworldtechnologies.com
sudo rm -rf /etc/letsencrypt/renewal/softworldtechnologies.com.conf

echo "✅ Cleaned up failed attempts"
echo "🔐 Obtaining SSL certificate using standalone mode..."

# Use standalone mode (Certbot runs its own web server on port 80)
sudo certbot certonly \
    --standalone \
    --preferred-challenges http \
    -d softworldtechnologies.com \
    -d www.softworldtechnologies.com \
    --non-interactive \
    --agree-tos \
    --email admin@softworldtechnologies.com

echo "✅ Certificate obtained successfully!"
echo "🔧 Configuring Nginx..."

# Create Nginx config with SSL
sudo tee /etc/nginx/sites-available/vue-app > /dev/null <<'EOF'
server {
    listen 80;
    server_name softworldtechnologies.com www.softworldtechnologies.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name softworldtechnologies.com www.softworldtechnologies.com;

    ssl_certificate /etc/letsencrypt/live/softworldtechnologies.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/softworldtechnologies.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    root /var/www/vue-app;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOF

# Enable config
sudo ln -sf /etc/nginx/sites-available/vue-app /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# Test and start Nginx
sudo nginx -t
sudo systemctl start nginx
sudo systemctl enable nginx

echo "✅ Nginx configured with HTTPS!"
echo "🔄 Setting up auto-renewal..."

# Configure auto-renewal to use standalone mode
(sudo crontab -l 2>/dev/null | grep -v certbot; echo "0 3 * * * certbot renew --pre-hook 'systemctl stop nginx' --post-hook 'systemctl start nginx' --quiet") | sudo crontab -

echo ""
echo "✅ SSL setup complete!"
echo "🌐 Your site is now live at: https://softworldtechnologies.com"
echo ""
echo "📋 To verify:"
echo "   curl -I https://softworldtechnologies.com"
