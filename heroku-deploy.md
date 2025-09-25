# Heroku Deployment Guide for ManifestLink

## Why Heroku?
- ✅ **Beginner-friendly** - Easy setup process
- ✅ **Good documentation** - Lots of tutorials available
- ✅ **Free tier** - Perfect for testing
- ✅ **Automatic deployments** - Easy updates

## Step 1: Create Heroku Account
1. Go to [Heroku.com](https://heroku.com)
2. Sign up with your email
3. Verify your email address

## Step 2: Install Heroku CLI
1. **Download** from [devcenter.heroku.com/articles/heroku-cli](https://devcenter.heroku.com/articles/heroku-cli)
2. **Install** with default settings
3. **Restart** your command prompt

## Step 3: Create Heroku App
```bash
# Login to Heroku
heroku login

# Create new app
heroku create manifestlink-app

# Add PostgreSQL database
heroku addons:create heroku-postgresql:hobby-dev
```

## Step 4: Prepare Your Project

### Create .gitignore file:
```
vendor/
node_modules/
*.log
.env
.DS_Store
Thumbs.db
```

### Update composer.json:
```json
{
    "require": {
        "php": "^8.0",
        "ext-mysqli": "*",
        "ext-gd": "*",
        "phpmailer/phpmailer": "^6.8"
    }
}
```

## Step 5: Deploy to Heroku

### Option A: Using Git (Recommended)
```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit"

# Add Heroku remote
heroku git:remote -a manifestlink-app

# Deploy
git push heroku main
```

### Option B: Using Heroku CLI (No Git)
```bash
# Deploy directly
heroku deploy --app manifestlink-app
```

## Step 6: Configure Environment Variables

In Heroku dashboard or using CLI:

```bash
# Set database configuration
heroku config:set DB_HOST=your-db-host
heroku config:set DB_NAME=your-db-name
heroku config:set DB_USER=your-db-user
heroku config:set DB_PASSWORD=your-db-password
```

## Step 7: Import Database

1. **Get database URL**:
   ```bash
   heroku config:get DATABASE_URL
   ```

2. **Import your database structure**:
   ```bash
   # Using psql (if you have PostgreSQL client)
   psql $DATABASE_URL < manifestlink.sql
   ```

## Step 8: Test Your App

1. **Visit your Heroku app**:
   ```bash
   heroku open
   ```

2. **Check logs**:
   ```bash
   heroku logs --tail
   ```

## Step 9: Update Frontend

Update your Firebase frontend to use Heroku backend:

```javascript
const config = {
    production: {
        apiBaseUrl: 'https://manifestlink-app.herokuapp.com',
        // ... rest of config
    }
};
```

## Troubleshooting

### Common Issues:
1. **Build failed**: Check composer.json and Procfile
2. **Database connection**: Verify environment variables
3. **File permissions**: Check if PHP can write files

### Useful Commands:
```bash
# View logs
heroku logs --tail

# Run commands on Heroku
heroku run php your-script.php

# Scale your app
heroku ps:scale web=1

# Check app status
heroku ps
```

## Cost
- **Free tier**: 550-1000 hours/month
- **Paid tier**: $7/month for unlimited usage

## Next Steps
1. **Test all functionality**
2. **Set up custom domain** (optional)
3. **Monitor performance**
4. **Set up automated deployments**
