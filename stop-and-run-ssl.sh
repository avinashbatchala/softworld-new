#!/bin/bash

# stop-and-fix-ssl.sh - Force HTTP-only SSL verification

set -e

echo "🔧 Stopping Nginx and fixing SSL issue..."

# Stop Nginx
sudo systemctl stop nginx

# Remove any failed certificate attempts
sudo rm -rf /etc/letsencrypt/live/softworldtechnologies.com
sudo rm -rf /etc/letsencrypt/archive/softworldtechnologies.com
sudo rm -rf /etc/letsencrypt/renewal/softworldtechnologies.com.conf

# Create minimal HTTP-only config
sudo tee /etc/nginx/sites-available/vue-app > /dev/null <<'EOF'
server {
    listen 80;
    server_name softworldtechnologies.com www.softworldtechnologies.com;

    root /var/www/vue-app;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOF

# Enable the config
sudo ln -sf /etc/nginx/sites-available/vue-app /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# Test and start Nginx
sudo nginx -t
sudo systemctl start nginx

echo "✅ Nginx running on HTTP only"
echo "🔐 Now obtaining SSL certificate with HTTP-01 challenge..."

# Use certbot with explicit HTTP-01 challenge and standalone mode temporarily
sudo systemctl stop nginx
sudo certbot certonly \
    --standalone \
    --preferred-challenges http \
    -d softworldtechnologies.com \
    -d www.softworldtechnologies.com \
    --non-interactive \
    --agree-tos \
    --email admin@softworldtechnologies.com \
    --http-01-port 80

echo "✅ Certificate obtained!"
echo "🔧 Configuring Nginx with SSL..."

# Now create full SSL config
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

# Restart Nginx with SSL
sudo nginx -t
sudo systemctl start nginx
sudo systemctl enable nginx

echo "✅ HTTPS enabled!"
echo "🔄 Setting up auto-renewal..."

# Setup auto-renewal with standalone mode
(sudo crontab -l 2>/dev/null; echo "0 3 * * * certbot renew --pre-hook 'systemctl stop nginx' --post-hook 'systemctl start nginx' --quiet") | sudo crontab -

echo ""
echo "✅ SSL setup complete!"
echo "🌐 Your site: https://softworldtechnologies.com"
