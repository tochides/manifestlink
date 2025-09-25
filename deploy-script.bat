@echo off
echo ========================================
echo ManifestLink Deployment Script
echo ========================================
echo.

echo Choose your deployment platform:
echo 1. Heroku (Recommended for beginners)
echo 2. Railway
echo 3. Exit
echo.

set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" goto heroku
if "%choice%"=="2" goto railway
if "%choice%"=="3" goto exit
goto invalid

:heroku
echo.
echo ========================================
echo Heroku Deployment Setup
echo ========================================
echo.
echo Step 1: Install Heroku CLI
echo - Go to: https://devcenter.heroku.com/articles/heroku-cli
echo - Download and install Heroku CLI
echo - Restart your command prompt
echo.
echo Step 2: Login to Heroku
echo - Run: heroku login
echo - Follow the browser login process
echo.
echo Step 3: Create Heroku App
echo - Run: heroku create manifestlink-app
echo - Run: heroku addons:create heroku-postgresql:hobby-dev
echo.
echo Step 4: Deploy
echo - Run: heroku git:remote -a manifestlink-app
echo - Run: git push heroku main
echo.
echo For detailed instructions, see: heroku-deploy.md
goto end

:railway
echo.
echo ========================================
echo Railway Deployment Setup
echo ========================================
echo.
echo Step 1: Create Railway Account
echo - Go to: https://railway.app
echo - Sign up with your email
echo.
echo Step 2: Create New Project
echo - Click "New Project"
echo - Choose "Empty Project"
echo - Upload your project files
echo.
echo Step 3: Add MySQL Database
echo - Click "Add Service"
echo - Select "Database" -> "MySQL"
echo.
echo Step 4: Configure Environment Variables
echo - Set DB_HOST, DB_USER, DB_PASSWORD, etc.
echo.
echo For detailed instructions, see: railway-deploy.md
goto end

:invalid
echo.
echo Invalid choice. Please try again.
goto start

:exit
echo.
echo Goodbye!
goto end

:end
echo.
echo ========================================
echo Deployment files created:
echo - heroku-deploy.md (Heroku instructions)
echo - railway-deploy.md (Railway instructions)
echo - FULL_DEPLOYMENT_GUIDE.md (Complete guide)
echo - connect-production.php (Production database config)
echo - Procfile (Heroku configuration)
echo - app.json (Heroku app configuration)
echo ========================================
echo.
pause
