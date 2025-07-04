#!/bin/bash

# React Login Registration MySQL - Setup Script
# This script automates the setup process for the application

echo "🚀 Setting up React Login Registration MySQL Application..."
echo "============================================================"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"

# Install root dependencies
echo "📦 Installing root dependencies..."
npm install

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm install
cd ..

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd frontend
npm install
cd ..

# Copy environment file
echo "📝 Setting up environment configuration..."
if [ ! -f backend/.env ]; then
    cp backend/.env.example backend/.env
    echo "✅ Created backend/.env file from .env.example"
    echo "⚠️  Please edit backend/.env with your MySQL credentials"
else
    echo "✅ backend/.env file already exists"
fi

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Make sure MySQL is running on your system"
echo "2. Create a database called 'auth_db' or update DB_NAME in backend/.env"
echo "3. Update MySQL credentials in backend/.env file"
echo "4. Run 'npm run dev' to start both frontend and backend"
echo ""
echo "Available commands:"
echo "  npm run dev        - Start both frontend and backend"
echo "  npm run server     - Start only backend"
echo "  npm run client     - Start only frontend"
echo ""
echo "Application URLs:"
echo "  Frontend: http://localhost:3000"
echo "  Backend:  http://localhost:5000"
echo ""
echo "Happy coding! 🚀"