# 🔒 SSL/HTTPS Setup Guide for softworldusa.com

This guide walks you through setting up SSL certificates using Let's Encrypt and enabling HTTPS on your EC2 instance.

---

## Prerequisites

Before setting up SSL, ensure:

✅ Your domain (`softworldusa.com`) DNS is pointing to your EC2 instance IP  
✅ Port 80 (HTTP) and Port 443 (HTTPS) are open in your EC2 Security Group  
✅ Nginx is installed and running  
✅ You have SSH access to your EC2 instance  

---

## 🚀 Quick Setup (Automated)

### Option 1: Use the Setup Script

1. **SSH into your EC2 instance:**
   ```bash
   ssh -i your-key.pem ubuntu@your-ec2-ip
   ```

2. **Navigate to your project directory:**
   ```bash
   cd /home/ubuntu/softworld-new
   ```

3. **Pull the latest changes (includes setup-ssl.sh):**
   ```bash
   git pull origin main
   ```

4. **Make the script executable:**
   ```bash
   chmod +x setup-ssl.sh
   ```

5. **Edit the email address in the script (optional but recommended):**
   ```bash
   nano setup-ssl.sh
   # Change EMAIL="info@softworldusa.com" to your actual email
   ```

6. **Run the SSL setup script:**
   ```bash
   sudo ./setup-ssl.sh
   ```

The script will:
- Install Certbot and Nginx plugin
- Obtain SSL certificates for `softworldusa.com` and `www.softworldusa.com`
- Automatically configure Nginx for HTTPS
- Set up automatic certificate renewal
- Redirect all HTTP traffic to HTTPS

---

## 🛠️ Manual Setup (Step by Step)

If you prefer to set up SSL manually, follow these steps:

### Step 1: Install Certbot

```bash
sudo apt update
sudo apt install -y certbot python3-certbot-nginx
```

### Step 2: Verify Nginx Configuration

Make sure your Nginx is properly configured and running:

```bash
sudo nginx -t
sudo systemctl status nginx
```

### Step 3: Obtain SSL Certificate

Replace `your-email@example.com` with your actual email:

```bash
sudo certbot --nginx \
    -d softworldusa.com \
    -d www.softworldusa.com \
    --email your-email@example.com \
    --agree-tos \
    --redirect
```

This command will:
- Obtain certificates from Let's Encrypt
- Automatically update your Nginx configuration
- Set up automatic HTTP to HTTPS redirect

### Step 4: Verify Certificate

```bash
sudo certbot certificates
```

You should see certificate details including expiry date.

### Step 5: Test Automatic Renewal

```bash
sudo certbot renew --dry-run
```

If successful, your certificates will auto-renew before expiry.

### Step 6: Set Up Auto-Renewal Cron Job

```bash
sudo crontab -e
```

Add this line to renew certificates twice daily:

```
0 0,12 * * * certbot renew --quiet --post-hook 'systemctl reload nginx'
```

---

## 🔍 Verify HTTPS is Working

1. **Open your browser and visit:**
   - https://softworldusa.com
   - https://www.softworldusa.com

2. **Check for the padlock icon** in the address bar

3. **Test HTTP to HTTPS redirect:**
   ```bash
   curl -I http://softworldusa.com
   ```
   Should show a 301/302 redirect to HTTPS

4. **Test SSL certificate details:**
   ```bash
   curl -vI https://softworldusa.com
   ```

---

## 📋 Certificate Management

### Check Certificate Expiry Date

```bash
sudo openssl x509 -enddate -noout -in /etc/letsencrypt/live/softworldusa.com/fullchain.pem
```

### View All Certificates

```bash
sudo certbot certificates
```

### Manual Certificate Renewal

```bash
sudo certbot renew
sudo systemctl reload nginx
```

### Test Renewal (Dry Run)

```bash
sudo certbot renew --dry-run
```

### Force Certificate Renewal

```bash
sudo certbot renew --force-renewal
sudo systemctl reload nginx
```

---

## 🔧 Troubleshooting

### Issue: Certificate Request Fails

**Problem:** Domain verification fails

**Solution:**
1. Verify DNS is pointing to your EC2 IP:
   ```bash
   nslookup softworldusa.com
   dig softworldusa.com
   ```

2. Check ports 80 and 443 are open:
   ```bash
   sudo netstat -tulpn | grep -E '(:80|:443)'
   ```

3. Verify Security Group allows inbound traffic on ports 80 and 443

### Issue: "Too Many Failed Authorizations"

**Problem:** Hit Let's Encrypt rate limits

**Solution:**
- Wait 1 hour and try again
- Use `--dry-run` flag to test without hitting limits
- Check you're not requesting certificates too frequently

### Issue: Nginx Fails to Start After SSL

**Problem:** Nginx configuration syntax error

**Solution:**
```bash
sudo nginx -t
# Fix any reported errors
sudo systemctl restart nginx
```

### Issue: Mixed Content Warnings

**Problem:** Some resources loading over HTTP instead of HTTPS

**Solution:**
1. Check browser console for mixed content warnings
2. Update hardcoded HTTP URLs to HTTPS in your app
3. Rebuild and redeploy:
   ```bash
   npm run build
   sudo cp -r dist/* /var/www/vue-app/
   sudo systemctl reload nginx
   ```

---

## 📁 Important File Locations

| Item | Location |
|------|----------|
| SSL Certificates | `/etc/letsencrypt/live/softworldusa.com/` |
| Certificate Private Key | `/etc/letsencrypt/live/softworldusa.com/privkey.pem` |
| Full Chain Certificate | `/etc/letsencrypt/live/softworldusa.com/fullchain.pem` |
| Certbot Config | `/etc/letsencrypt/` |
| Nginx Config | `/etc/nginx/sites-available/vue-app` |
| Renewal Configs | `/etc/letsencrypt/renewal/` |

---

## 🔄 Certificate Renewal Process

Let's Encrypt certificates are valid for **90 days**. Certbot automatically renews them when they have 30 days or less remaining.

### Automatic Renewal

The cron job runs twice daily and checks if renewal is needed:
```bash
0 0,12 * * * certbot renew --quiet --post-hook 'systemctl reload nginx'
```

### Check Renewal Status

```bash
sudo systemctl status certbot.timer
```

Or check the log:
```bash
sudo journalctl -u certbot.renew
```

---

## 🛡️ Security Best Practices

### 1. Keep Certbot Updated

```bash
sudo apt update
sudo apt upgrade certbot python3-certbot-nginx
```

### 2. Enable HSTS (HTTP Strict Transport Security)

Add to your Nginx config inside the `server` block:

```nginx
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
```

### 3. Use Strong SSL Configuration

Certbot automatically uses secure defaults, but you can enhance security:

```nginx
ssl_protocols TLSv1.2 TLSv1.3;
ssl_prefer_server_ciphers on;
ssl_ciphers 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384';
```

### 4. Regular Security Audits

Test your SSL configuration:
- Visit: https://www.ssllabs.com/ssltest/analyze.html?d=softworldusa.com

---

## 🆘 Getting Help

If you encounter issues:

1. Check Certbot logs:
   ```bash
   sudo tail -f /var/log/letsencrypt/letsencrypt.log
   ```

2. Check Nginx error logs:
   ```bash
   sudo tail -f /var/log/nginx/error.log
   ```

3. Test Nginx configuration:
   ```bash
   sudo nginx -t
   ```

4. Verify Certbot installation:
   ```bash
   certbot --version
   ```

---

## 📚 Additional Resources

- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Certbot Documentation](https://certbot.eff.org/docs/)
- [Nginx SSL Module](https://nginx.org/en/docs/http/ngx_http_ssl_module.html)

---

## ✅ Post-Setup Checklist

After setting up SSL, verify:

- [ ] Site loads via HTTPS (https://softworldusa.com)
- [ ] HTTP redirects to HTTPS
- [ ] No mixed content warnings in browser console
- [ ] Certificate is valid and trusted (green padlock)
- [ ] Certificate expiry date is ~90 days from now
- [ ] Automatic renewal is configured (cron job exists)
- [ ] Dry run renewal test passes
- [ ] Both www and non-www versions work
- [ ] All pages and assets load correctly over HTTPS
- [ ] Security Group allows ports 80 and 443

---

**Need help?** Contact your system administrator or refer to the troubleshooting section above.

