# 🚀 Complete ManifestLink Deployment Guide

## Overview
This guide will help you deploy your complete ManifestLink system with both frontend and backend functionality.

## Architecture
- **Frontend:** Firebase Hosting (Static files)
- **Backend:** Railway (PHP API)
- **Database:** Railway MySQL
- **File Storage:** Firebase Storage (QR codes)

---

## Phase 1: Backend Deployment (Railway)

### Step 1: Create Railway Account
1. Go to [Railway.app](https://railway.app)
2. Sign up with your email
3. Verify your email address

### Step 2: Create New Project
1. Click "New Project"
2. Choose "Deploy from GitHub repo" (we'll set this up)
3. Or choose "Empty Project" for manual deployment

### Step 3: Deploy PHP Backend
Since Git isn't working yet, we'll use Railway's manual deployment:

1. **Create a ZIP file** of your project
2. **Upload to Railway** via their dashboard
3. **Configure environment variables**

### Step 4: Add MySQL Database
1. In Railway project, click "Add Service"
2. Select "Database" → "MySQL"
3. Railway will automatically create a MySQL instance

---

## Phase 2: Database Setup

### Step 1: Import Database Structure
1. **Get MySQL connection details** from Railway
2. **Use phpMyAdmin** or MySQL Workbench to connect
3. **Import your SQL files:**
   - `manifestlink.sql`
   - `manifest_table.sql`
   - `otp_table.sql`

### Step 2: Update Database Configuration
Update your `connect.php` file with Railway database details:

```php
<?php
// Railway Database Configuration
$servername = "containers-us-west-xxx.railway.app";
$username = "root";
$password = "your-railway-password";
$dbname = "railway";
$db_port = 3306;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $db_port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
```

---

## Phase 3: Frontend Updates

### Step 1: Update API Endpoints
Update your `config.js` file:

```javascript
const config = {
    production: {
        apiBaseUrl: 'https://your-railway-app.railway.app',
        database: {
            host: 'your-railway-db-host',
            port: 3306,
            name: 'railway'
        }
    }
};
```

### Step 2: Update Registration Links
Change registration links from demo to real backend:

```html
<!-- Change from: -->
<a href="register-demo.html">Register Now</a>

<!-- To: -->
<a href="https://your-railway-app.railway.app/register.php">Register Now</a>
```

---

## Phase 4: File Storage Setup

### Step 1: Firebase Storage
1. Go to Firebase Console
2. Enable "Storage" service
3. Get storage configuration

### Step 2: Update QR Code Storage
Modify your QR code generation to use Firebase Storage instead of local files.

---

## Alternative: Simplified Deployment

If the above seems complex, here's a simpler approach:

### Option 1: Use Heroku (Easier)
1. **Create Heroku account**
2. **Use Heroku CLI** to deploy
3. **Add Heroku Postgres** for database
4. **Deploy everything together**

### Option 2: Use Vercel + PlanetScale
1. **Frontend:** Vercel (easy deployment)
2. **Backend:** Vercel Functions (PHP)
3. **Database:** PlanetScale (free MySQL)

### Option 3: Use DigitalOcean App Platform
1. **Single platform** for everything
2. **Easy PHP deployment**
3. **Built-in database**
4. **Simple configuration**

---

## Recommended Approach for Beginners

### Step 1: Start with Heroku
1. **Easier than Railway** for beginners
2. **Better documentation**
3. **Simple deployment process**

### Step 2: Use Heroku Postgres
1. **Free tier available**
2. **Easy to set up**
3. **Good for learning**

### Step 3: Deploy Frontend to Vercel
1. **Drag and drop** deployment
2. **No command line needed**
3. **Free hosting**

---

## Quick Start Commands

### For Heroku Deployment:
```bash
# Install Heroku CLI
# Create Heroku app
heroku create manifestlink-app

# Add PostgreSQL database
heroku addons:create heroku-postgresql:hobby-dev

# Deploy
git push heroku main
```

### For Railway Deployment:
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Deploy
railway deploy
```

---

## Cost Estimate

### Free Tier (Development):
- **Firebase Hosting:** Free
- **Railway:** Free (500 hours/month)
- **Railway MySQL:** Free (1GB)

### Production Tier:
- **Firebase Hosting:** Free (generous limits)
- **Railway:** $5/month
- **Railway MySQL:** $5/month
- **Total:** ~$10/month

---

## Next Steps

1. **Choose deployment platform** (Railway, Heroku, or DigitalOcean)
2. **Set up backend deployment**
3. **Configure database**
4. **Update frontend configuration**
5. **Test complete system**

Which platform would you like to use? I recommend starting with **Heroku** as it's the most beginner-friendly.
