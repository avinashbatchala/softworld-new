# Deployment Guide for softworldtechnologies.com

This guide explains how to update and redeploy the Vue.js app hosted on an EC2 instance and maintain HTTPS using Let's Encrypt.

---

## Pull Latest Changes from GitHub

SSH into your EC2 instance:

```bash
ssh -i your-key.pem ubuntu@your-ec2-ip
````

Navigate to your project folder:

```bash      q
cd /home/ubuntu/softworld-new
```

Pull the latest changes from the main branch:

```bash
git pull origin main
```

---

## Remove Existing `dist/` Folder

Before building a fresh version of the app, remove the old build:

```bash
sudo rm -rf dist
```

---

## Install Dependencies & Rebuild App

Reinstall project dependencies:

```bash
npm install
```

Build the Vue app for production:

```bash
npm run build
```

---

## Copy New Build to Nginx Web Directory

Clear the old deployed files:

```bash
sudo rm -rf /var/www/vue-app/*
```

Copy the new `dist/` content:

```bash
sudo cp -r dist/* /var/www/vue-app/
```

Fix permissions:

```bash
sudo chown -R www-data:www-data /var/www/vue-app
```

---

## Restart Nginx

Test Nginx configuration:

```bash
sudo nginx -t
```

Reload Nginx:

```bash
sudo systemctl reload nginx
```

The new version should now be live at `https://softworldtechnologies.com`

---

## 🔒 SSL/HTTPS Setup

### First Time SSL Setup

If you haven't set up SSL yet or need to create a new certificate:

#### Quick Setup (Recommended)

```bash
# On your EC2 instance, run the automated SSL setup script:
cd /home/ubuntu/softworld-new
sudo ./setup-ssl.sh
```

The script will:
- Install Certbot and required plugins
- Obtain SSL certificates from Let's Encrypt
- Configure Nginx for HTTPS
- Set up automatic certificate renewal
- Redirect HTTP to HTTPS

#### Before Running the Script

Make sure:
- Your domain DNS points to your EC2 IP address
- Ports 80 and 443 are open in EC2 Security Group
- Nginx is installed and running

#### Manual Setup
| Vue.js repo       | `/home/ubuntu/softworld-new`              |
See **[SSL-SETUP-GUIDE.md](SSL-SETUP-GUIDE.md)** for detailed manual setup instructions and troubleshooting.
| SSL Setup Script  | `/home/ubuntu/softworld-new/setup-ssl.sh` |
| SSL cert location | `/etc/letsencrypt/live/softworldtechnologies.com/` |
| Nginx config      | `/etc/nginx/sites-available/vue-app`      |
| Nginx error logs  | `sudo tail -n 50 /var/log/nginx/vue-app-error.log` |
| Vue app error log | `/var/log/nginx/vue-app-error.log`        |
| Vue app access log| `/var/log/nginx/vue-app-access.log`       |
## Renew HTTPS Certificate

Let's Encrypt SSL certs auto-renew, but here's how to manually check or renew.

### Check Certificate Status:

```bash
sudo certbot certificates
```

### Dry Run (test renewal):

```bash
sudo certbot renew --dry-run
```

### Manual Renewal (if needed):

```bash
sudo certbot renew
```

### 🔍 Check Expiry Date:

```bash
sudo openssl x509 -enddate -noout -in /etc/letsencrypt/live/softworldtechnologies.com/fullchain.pem
```

### Force Renewal (if certificate needs immediate renewal):

```bash
sudo certbot renew --force-renewal
sudo systemctl reload nginx
```

---

## 🗂️ Useful Paths & Notes

| Description       | Path or Command                            |
|-------------------|--------------------------------------------|
| Vue.js repo       | `/home/ubuntu/Softworld`                  |
| Public files      | `/var/www/vue-app`                         |
| SSL cert location | `/etc/letsencrypt/live/softworldtechnologies.com/`    |
| Nginx config      | `/etc/nginx/sites-enabled/default`         |
| Nginx error logs  | `sudo tail -n 50 /var/log/nginx/error.log` |

---

## Tips

* Always confirm the `dist/` directory was successfully generated after each build.
* Check browser console for missing files after deployment — it often reveals path or config errors.
* You can automate this entire process with a deployment script (ask if you want one!).

---
