-- Create database if not exists
CREATE DATABASE IF NOT EXISTS job_portal;
USE job_portal;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    qualification VARCHAR(100),
    role VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a test user (optional)
INSERT INTO users (name, email, password, qualification, role) VALUES
('Test User', 'test@example.com', 'password123', 'Bachelor', 'user');

-- Create jobs table
CREATE TABLE IF NOT EXISTS jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    status VARCHAR(50),
    location VARCHAR(255),
    pdate VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample jobs (optional)
INSERT INTO jobs (title, description, category, status, location, pdate) VALUES
('Software Engineer', 'We are looking for a skilled software engineer...', 'IT', 'Active', 'New York', '2025-08-16'),
('Data Analyst', 'Looking for an experienced data analyst...', 'Analytics', 'Active', 'Remote', '2025-08-16');