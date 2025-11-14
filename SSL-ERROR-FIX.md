# 🔧 SSL Certificate Error Fix Guide

## Problem
Certbot is failing with 502 errors when trying to verify your domains because:
- Nginx is configured to listen on port 443 (HTTPS)
- But there are no valid SSL certificates yet
- Certbot can't complete the verification over HTTPS

## Solution

You have **two options** to fix this:

---

## Option 1: Automated Fix (Recommended) ⚡

### On your EC2 instance:

```bash
cd /home/ubuntu/softworld-new
git pull origin main
chmod +x fix-ssl-error.sh
sudo ./fix-ssl-error.sh
```

This script will:
1. Stop Nginx temporarily
2. Clean up any failed certificate attempts
3. Create a clean HTTP-only configuration
4. Obtain fresh SSL certificates
5. Configure HTTPS automatically

---

## Option 2: Manual Fix 🛠️

If you prefer to fix this manually, follow these steps:

### Step 1: Stop Nginx
```bash
sudo systemctl stop nginx
```

### Step 2: Clean up failed certificate attempts (if any)
```bash
# Backup and remove any partial certificate files
sudo mv /etc/letsencrypt/live/softworldtechnologies.com /etc/letsencrypt/live/softworldtechnologies.com.backup.$(date +%Y%m%d) 2>/dev/null || true
sudo mv /etc/letsencrypt/renewal/softworldtechnologies.com.conf /etc/letsencrypt/renewal/softworldtechnologies.com.conf.backup.$(date +%Y%m%d) 2>/dev/null || true
```

### Step 3: Backup current Nginx config
```bash
sudo cp /etc/nginx/sites-available/vue-app /etc/nginx/sites-available/vue-app.backup.$(date +%Y%m%d)
```

### Step 4: Create HTTP-only Nginx configuration

```bash
sudo tee /etc/nginx/sites-available/vue-app > /dev/null << 'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name softworldtechnologies.com www.softworldtechnologies.com;

    root /home/ubuntu/softworld-new/dist;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
        add_header Cache-Control "no-cache, no-store, must-revalidate";
    }

    location = /index.html {
        add_header Cache-Control "no-cache, no-store, must-revalidate";
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
```

### Step 5: Test and start Nginx
```bash
sudo nginx -t
sudo systemctl start nginx
```

### Step 6: Verify HTTP works
```bash
curl -I http://softworldtechnologies.com
```

Should return `200 OK` or redirect.

### Step 7: Run Certbot with HTTP challenge
```bash
sudo certbot --nginx \
    -d softworldtechnologies.com \
    -d www.softworldtechnologies.com \
    --non-interactive \
    --agree-tos \
    --email info@softworldusa.com \
    --redirect \
    --preferred-challenges http
```

### Step 8: Verify certificate
```bash
sudo certbot certificates
```

### Step 9: Test HTTPS
```bash
curl -I https://softworldtechnologies.com
```

### Step 10: Set up auto-renewal
```bash
# Test renewal
sudo certbot renew --dry-run

# Add cron job
(sudo crontab -l 2>/dev/null; echo "0 0,12 * * * certbot renew --quiet --post-hook 'systemctl reload nginx'") | sudo crontab -
```

---

## Verification Checklist

After running either option, verify:

- [ ] HTTP works: `curl -I http://softworldtechnologies.com`
- [ ] HTTPS works: `curl -I https://softworldtechnologies.com`
- [ ] Certificate is valid: `sudo certbot certificates`
- [ ] Auto-renewal works: `sudo certbot renew --dry-run`
- [ ] Browser shows green padlock
- [ ] HTTP redirects to HTTPS

---

## Common Issues & Solutions

### Issue 1: DNS not pointing to server
```bash
# Check DNS
nslookup softworldtechnologies.com

# Should return your EC2 IP address
```

**Fix**: Update your DNS A records to point to your EC2 instance IP.

### Issue 2: Ports 80 or 443 blocked
```bash
# Check if ports are listening
sudo netstat -tulpn | grep -E '(:80|:443)'
```

**Fix**: Open ports 80 and 443 in your EC2 Security Group inbound rules.

### Issue 3: File permissions
```bash
# Fix permissions
sudo chmod 755 /home/ubuntu
sudo chmod -R 755 /home/ubuntu/softworld-new
sudo chown -R ubuntu:ubuntu /home/ubuntu/softworld-new
```

### Issue 4: Nginx config syntax error
```bash
# Test config
sudo nginx -t

# If errors, check the syntax carefully
# Make sure $ signs are escaped as \$ in heredoc
```

---

## Rate Limits

Let's Encrypt has rate limits:
- 5 failed validations per hour per account
- 50 certificates per domain per week

If you hit a rate limit:
1. Wait 1 hour before trying again
2. Use `--dry-run` flag to test without hitting limits
3. Make sure DNS and ports are correct before retrying

---

## Troubleshooting Commands

```bash
# View Certbot logs
sudo tail -100 /var/log/letsencrypt/letsencrypt.log

# View Nginx error logs  
sudo tail -100 /var/log/nginx/vue-app-error.log

# Check Nginx status
sudo systemctl status nginx

# Restart Nginx
sudo systemctl restart nginx

# Check which ports are open
sudo ss -tlnp | grep -E ':(80|443)'

# Test HTTP locally
curl -I http://localhost

# Test domain resolution
dig softworldtechnologies.com +short
```

---

## Need Help?

If you're still having issues:

1. **Check the Certbot log**:
   ```bash
   sudo cat /var/log/letsencrypt/letsencrypt.log
   ```

2. **Verify your setup**:
   - DNS points to EC2 IP: `nslookup softworldtechnologies.com`
   - Ports 80 & 443 open in Security Group
   - Nginx is running: `sudo systemctl status nginx`
   - Can reach site via HTTP: `curl -I http://softworldtechnologies.com`

3. **Contact support** with:
   - The full error message
   - Output of `sudo nginx -t`
   - Output of `nslookup softworldtechnologies.com`
   - Your EC2 instance IP address

---

**After fixing, commit the new scripts to your repo:**

```bash
git add fix-ssl-error.sh setup-ssl.sh
git commit -m "Fix SSL certificate setup issues"
git push origin main
```

