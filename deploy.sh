#!/bin/bash

# Deployment script for softworld Services Vue app
# Run this after cloning the repository

# Set variables
APP_DIR=$(pwd)
NODE_VERSION="22.x"

echo "Starting deployment process..."

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Node.js 22.x
echo "Installing Node.js ${NODE_VERSION}..."
curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION} | sudo -E bash -
sudo apt install -y nodejs

# Verify versions
echo "Verifying Node.js and npm versions..."
node -v
npm -v

# Install dependencies
echo "Installing project dependencies..."
npm install

# Fix permissions before build
echo "Fixing permissions for build process..."
sudo chmod 755 /home/ubuntu
sudo chown -R ubuntu:ubuntu ${APP_DIR}
sudo chmod -R 755 ${APP_DIR}

# Clean and build Vue app
echo "Cleaning previous build and building Vue application..."
rm -rf dist
npm run build

# Install and configure Nginx
echo "Installing and configuring Nginx..."
sudo apt install -y nginx

echo "Creating Nginx site configuration..."
sudo tee /etc/nginx/sites-available/vue-app > /dev/null << EOF
server {
    listen 80;
    server_name softworldusa.com www.softworldusa.com;

    root ${APP_DIR}/dist;
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

# Enable the site
echo "Enabling the site in Nginx..."
sudo ln -sf /etc/nginx/sites-available/vue-app /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# Set proper permissions for Nginx
echo "Setting proper permissions for Nginx..."
sudo chmod 755 /home/ubuntu
sudo chmod -R 755 ${APP_DIR}
sudo chown -R ubuntu:ubuntu ${APP_DIR}

# Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

# Restart Nginx
echo "Restarting Nginx..."
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Deployment completed successfully!"
echo "Your Vue app should now be accessible via your EC2 instance's public IP address."
echo "You can test it locally with: curl localhost"