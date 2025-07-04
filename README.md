# React Login and Registration App with MySQL

A full-stack web application built with React.js frontend and Node.js backend, featuring user authentication using MySQL database.

## Features

- 🔐 User Registration and Login
- 🛡️ JWT Token Authentication
- 🔒 Password Hashing with bcrypt
- 🎨 Modern and Responsive UI
- 🚪 Protected Routes
- 📱 Mobile-Friendly Design
- 🗄️ MySQL Database Integration

## Tech Stack

### Frontend
- React.js 18
- React Router DOM
- Axios for API calls
- CSS3 with modern styling

### Backend
- Node.js
- Express.js
- MySQL2
- JWT (JSON Web Tokens)
- bcryptjs for password hashing
- CORS enabled

## Prerequisites

Before running this application, make sure you have the following installed:

- Node.js (v14 or higher)
- MySQL Server
- npm or yarn package manager

## Installation & Setup

### 1. Clone the repository
```bash
git clone <repository-url>
cd react-login-registration-mysql
```

### 2. Install dependencies
```bash
# Install root dependencies
npm install

# Install backend dependencies
cd backend
npm install

# Install frontend dependencies
cd ../frontend
npm install
```

### 3. Database Setup

1. Create a MySQL database:
```sql
CREATE DATABASE auth_db;
```

2. The application will automatically create the users table when you start the backend server.

### 4. Environment Configuration

1. Copy the environment example file:
```bash
cd backend
cp .env.example .env
```

2. Edit the `.env` file with your MySQL credentials:
```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=auth_db
JWT_SECRET=your-super-secret-jwt-key
```

### 5. Running the Application

#### Option 1: Run both frontend and backend simultaneously
```bash
# From the root directory
npm run dev
```

#### Option 2: Run frontend and backend separately

**Backend:**
```bash
cd backend
npm run dev
```

**Frontend:**
```bash
cd frontend
npm start
```

The application will be available at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

## API Endpoints

### Authentication
- `POST /api/register` - Register a new user
- `POST /api/login` - Login user
- `GET /api/profile` - Get user profile (protected)
- `GET /api/health` - Health check

### Request/Response Examples

#### Registration
```json
POST /api/register
{
  "username": "johndoe",
  "email": "john@example.com",
  "password": "password123"
}
```

#### Login
```json
POST /api/login
{
  "email": "john@example.com",
  "password": "password123"
}
```

## Project Structure

```
react-login-registration-mysql/
├── backend/
│   ├── server.js          # Express server
│   ├── package.json       # Backend dependencies
│   ├── .env.example       # Environment variables template
│   └── .env               # Environment variables (create this)
├── frontend/
│   ├── public/
│   │   └── index.html     # HTML template
│   ├── src/
│   │   ├── components/    # React components
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── Dashboard.js
│   │   │   ├── PrivateRoute.js
│   │   │   ├── Auth.css
│   │   │   └── Dashboard.css
│   │   ├── context/       # React context
│   │   │   └── AuthContext.js
│   │   ├── App.js         # Main App component
│   │   ├── App.css        # App styles
│   │   ├── index.js       # React entry point
│   │   └── index.css      # Global styles
│   └── package.json       # Frontend dependencies
├── package.json           # Root package.json
└── README.md              # This file
```

## Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Usage

1. **Registration**: Navigate to `/register` to create a new account
2. **Login**: Navigate to `/login` to sign in with existing credentials
3. **Dashboard**: After successful login, users are redirected to the dashboard
4. **Logout**: Click the logout button to end the session

## Security Features

- Passwords are hashed using bcrypt before storing in database
- JWT tokens for stateless authentication
- Protected routes require valid authentication
- Input validation and sanitization
- CORS configuration for cross-origin requests

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Support

If you encounter any issues or have questions, please create an issue in the repository.