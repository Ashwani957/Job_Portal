# Job Portal Application

A comprehensive job portal web application that connects job seekers with employers. This platform allows users to browse job listings, apply for positions, and manage their professional profiles, while employers can post job openings and review applications.

## 📋 Table of Contents

- [Job Portal Application](#job-portal-application)
  - [📋 Table of Contents](#-table-of-contents)
  - [📝 Overview](#-overview)
  - [✨ Features](#-features)
    - [For Job Seekers](#for-job-seekers)
    - [For Employers/Admins](#for-employersadmins)
  - [🛠️ Tech Stack](#️-tech-stack)
    - [Frontend](#frontend)
    - [Backend](#backend)
    - [Database](#database)
    - [Build Tools](#build-tools)
  - [🏗️ Architecture](#️-architecture)
  - [🖥️ Frontend](#️-frontend)
  - [⚙️ Backend](#️-backend)
  - [🗄️ Database](#️-database)
  - [🚀 Getting Started](#-getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
      - [Windows](#windows)
      - [Linux/macOS](#linuxmacos)
    - [Running the Application](#running-the-application)
      - [Using Cargo with Maven](#using-cargo-with-maven)
      - [Alternative Method: Manual Deployment](#alternative-method-manual-deployment)
      - [Database Connection](#database-connection)
  - [🔄 DevOps Practices/Deployment](#-devops-practicesdeployment)
    - [Continuous Integration](#continuous-integration)
    - [Deployment Options](#deployment-options)
    - [Sample Docker Deployment](#sample-docker-deployment)
  - [🔍 Troubleshooting](#-troubleshooting)
    - [JSTL Issues](#jstl-issues)
    - [Common Errors](#common-errors)
      - [HTTP Status 500 - Internal Server Error](#http-status-500---internal-server-error)
  - [📸 Screenshots](#-screenshots)
  - [📄 License](#-license)
  - [Star 🤩](#star-)

## 📝 Overview

The Job Portal is a dynamic web application designed to streamline the job search and recruitment process. It provides a user-friendly interface for job seekers to explore opportunities and for employers to find qualified candidates.

## ✨ Features

### For Job Seekers

- User registration and profile management
- Browse and search job listings with advanced filters
- Apply for jobs with resume/CV upload
- Track application status
- Save favorite job listings

### For Employers/Admins

- Post and manage job listings
- Review and manage applications
- Update job status (active/inactive)
- Edit job details and requirements

## 🛠️ Tech Stack

### Frontend

- HTML5, CSS3
- Bootstrap 5 for responsive design
- JSP (JavaServer Pages) for server-side rendering
- JSTL (JSP Standard Tag Library) for dynamic content
- Font Awesome for icons
- AOS (Animate On Scroll) library for animations

### Backend

- Java EE (Enterprise Edition)
- Servlets for handling HTTP requests
- Jakarta EE 9+ for modern Java web development
- JDBC for database connectivity

### Database

- MySQL for data persistence

### Build Tools

- Maven for dependency management and build automation

## 🏗️ Architecture

The application follows a Model-View-Controller (MVC) architecture:

- **Model**: Represented by entity classes (`User.java`, `Jobs.java`, etc.) and DAO (Data Access Object) classes for database operations
- **View**: JSP pages for the user interface
- **Controller**: Servlet classes that handle HTTP requests and responses

## 🖥️ Frontend

The frontend is built using JSP pages with Bootstrap for responsive design. Key design principles include:

- Mobile-first approach for responsive layouts
- Modern UI with card-based design
- Interactive elements with smooth animations
- Form validation for user input
- Consistent styling throughout the application

## ⚙️ Backend

The backend is implemented using Java servlets that handle various application functions:

- Authentication and authorization
- Job listing management
- Application processing
- File uploads (resumes/CVs)
- Database operations

## 🗄️ Database

The application uses a MySQL database with the following main tables:

- `users`: Stores user account information
- `jobs`: Contains job listing details
- `job_applications`: Tracks job applications
- `user_profiles`: Stores detailed user profile information

## 🚀 Getting Started

### Prerequisites

To run this application locally, you need:

- JDK 11 or higher
- Apache Tomcat 10.0 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher

### Installation

#### Windows

1. **Clone the repository**

   ```
   git clone https://github.com/yourusername/job-portal.git
   cd job-portal
   ```

2. **Set up the database**

   ```
   mysql -u root -p
   ```

   ```sql
   CREATE DATABASE job_portal;
   USE job_portal;
   ```

   Execute the SQL script in `src/main/resources/database.sql` to create tables.

3. **Configure database connection**
   Update the database connection parameters in `src/main/java/com/DB/DBConnection.java` if needed.

4. **Build the project**
   ```
   mvn clean package
   ```

#### Linux/macOS

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/job-portal.git
   cd job-portal
   ```

2. **Set up the database**

   ```bash
   mysql -u root -p
   ```

   ```sql
   CREATE DATABASE job_portal;
   USE job_portal;
   ```

   Execute the SQL script in `src/main/resources/database.sql` to create tables.

3. **Configure database connection**
   Update the database connection parameters in `src/main/java/com/DB/DBConnection.java` if needed.

4. **Build the project**
   ```bash
   mvn clean package
   ```

### Running the Application

#### Using Cargo with Maven

1. **Run with Cargo Maven plugin**
   ```
   mvn clean install
   mvn cargo:run
   ```
   This will start the application on `http://localhost:8080/Job_Portal`

#### Alternative Method: Manual Deployment

1. **Build the application**

   ```
   mvn clean package
   ```

2. **Deploy WAR file to Tomcat**
   Copy the generated `target/Job_Portal.war` file to Tomcat's `webapps` directory.

3. **Start Tomcat**

   **Windows:**

   ```
   cd path\to\tomcat\bin
   startup.bat
   ```

   **Linux/macOS:**

   ```bash
   cd /path/to/tomcat/bin
   ./startup.sh
   ```

4. **Access the application**
   Open your browser and go to `http://localhost:8080/Job_Portal`

#### Database Connection

Ensure MySQL is running:

**Windows:**

```
net start mysql
```

**Linux/macOS:**

```bash
sudo systemctl start mysql
```

## 🔄 DevOps Practices/Deployment

### Continuous Integration

The project can be integrated with CI/CD tools like:

- Jenkins
- GitHub Actions
- GitLab CI

### Deployment Options

- **Traditional Deployment**: Deploy WAR file to Tomcat server
- **Docker Deployment**: Containerize the application using Docker
- **Cloud Deployment**: Deploy to cloud platforms like AWS, Azure, or Google Cloud

### Sample Docker Deployment

1. **Build Docker image**

   ```
   docker build -t job-portal .
   ```

2. **Run Docker container**
   ```
   docker run -p 8080:8080 job-portal
   ```

## 🔍 Troubleshooting

### JSTL Issues

If you encounter an error like "Unable to find taglib [c] for URI: [jakarta.tags.core]", you can resolve it by running the provided fix script:

**Windows:**

```
.\fix-taglibs.ps1
```

**Linux/macOS:**

```bash
chmod +x fix-taglibs.sh
./fix-taglibs.sh
```

This script changes the JSTL taglib URI from `jakarta.tags.core` to `http://java.sun.com/jsp/jstl/core`, which is compatible with the Jakarta EE 9+ libraries when using Tomcat 10.

### Common Errors

#### HTTP Status 500 - Internal Server Error

If you're seeing HTTP Status 500 errors with a message about JSTL tags, make sure your pom.xml contains the correct JSTL dependencies:

```xml
<dependency>
  <groupId>jakarta.servlet.jsp.jstl</groupId>
  <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
  <version>2.0.0</version>
</dependency>
<dependency>
  <groupId>org.glassfish.web</groupId>
  <artifactId>jakarta.servlet.jsp.jstl</artifactId>
  <version>2.0.0</version>
</dependency>
```

## 📸 Screenshots

_Coming soon_

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Star 🤩

If you like the project you can star the project.

---

Made with ❤️ by Ashwani Maurya

