-- React Login Registration MySQL Database Setup
-- Run this script to set up the database and tables

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS auth_db;

-- Use the database
USE auth_db;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create index on email for faster lookups
CREATE INDEX idx_users_email ON users(email);

-- Create index on username for faster lookups
CREATE INDEX idx_users_username ON users(username);

-- Insert sample data (optional - remove if not needed)
-- Note: These passwords are hashed versions of 'password123'
-- INSERT INTO users (username, email, password) VALUES 
-- ('john_doe', 'john@example.com', '$2a$10$example_hashed_password_here'),
-- ('jane_smith', 'jane@example.com', '$2a$10$example_hashed_password_here');

-- Display table structure
DESCRIBE users;

-- Show all tables in the database
SHOW TABLES;