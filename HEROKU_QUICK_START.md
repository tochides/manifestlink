# 🚀 Heroku Quick Start Guide for ManifestLink

## Prerequisites
- ✅ Heroku CLI installed
- ✅ Heroku account created
- ✅ Your project files ready

---

## Step 1: Create Heroku Account
1. Go to [heroku.com](https://heroku.com)
2. Click "Sign up for free"
3. Enter your email and create password
4. Verify your email address

---

## Step 2: Login to Heroku CLI

**Open a NEW command prompt** (important - restart after installing Heroku CLI)

```bash
# Navigate to your project
cd C:\xampp\htdocs\manifestlink

# Login to Heroku
heroku login
```

This will open a browser window for you to login.

---

## Step 3: Create Heroku App

```bash
# Create new Heroku app
heroku create manifestlink-app

# Add PostgreSQL database (free tier)
heroku addons:create heroku-postgresql:hobby-dev
```

---

## Step 4: Initialize Git (if needed)

```bash
# Initialize git repository
git init

# Add all files
git add .

# Make first commit
git commit -m "Initial ManifestLink deployment"
```

---

## Step 5: Deploy to Heroku

```bash
# Add Heroku remote
heroku git:remote -a manifestlink-app

# Deploy to Heroku
git push heroku main
```

---

## Step 6: Configure Environment Variables

```bash
# Set database configuration
heroku config:set APP_ENV=production
heroku config:set APP_DEBUG=false
```

---

## Step 7: Import Database

```bash
# Get database URL
heroku config:get DATABASE_URL

# Import database structure (if using PostgreSQL)
heroku run php -r "
\$url = getenv('DATABASE_URL');
\$db = parse_url(\$url);
\$host = \$db['host'];
\$port = \$db['port'];
\$user = \$db['user'];
\$pass = \$db['pass'];
\$dbname = ltrim(\$db['path'], '/');

echo \"Host: \$host\n\";
echo \"Port: \$port\n\";
echo \"User: \$user\n\";
echo \"Database: \$dbname\n\";
"
```

---

## Step 8: Test Your App

```bash
# Open your app in browser
heroku open

# Check app logs
heroku logs --tail
```

---

## Step 9: Update Frontend

Update your `config.js` file:

```javascript
const config = {
    production: {
        apiBaseUrl: 'https://manifestlink-app.herokuapp.com',
        // ... rest of config
    }
};
```

---

## Troubleshooting

### If Heroku CLI not found:
1. **Restart command prompt** completely
2. **Check PATH** - Heroku should be in your PATH
3. **Reinstall** if needed

### If deployment fails:
```bash
# Check logs
heroku logs --tail

# Check app status
heroku ps

# Scale web dynos
heroku ps:scale web=1
```

### If database issues:
```bash
# Check database connection
heroku run php -r "echo 'Testing database connection...';"

# Reset database (if needed)
heroku pg:reset DATABASE_URL
```

---

## Success Checklist

- [ ] Heroku account created
- [ ] Heroku CLI installed and working
- [ ] App created on Heroku
- [ ] Database added
- [ ] Code deployed successfully
- [ ] App accessible via browser
- [ ] Database imported
- [ ] Frontend updated with backend URL

---

## Your URLs After Deployment

- **Frontend:** https://manifestlink.web.app
- **Backend:** https://manifestlink-app.herokuapp.com
- **Admin:** https://manifestlink-app.herokuapp.com/admin/

---

## Next Steps

1. **Test all functionality**
2. **Set up custom domain** (optional)
3. **Monitor performance**
4. **Set up automated deployments**

---

## Need Help?

If you encounter any issues:
1. Check the logs: `heroku logs --tail`
2. Verify environment variables: `heroku config`
3. Test database connection: `heroku run php your-test-script.php`
