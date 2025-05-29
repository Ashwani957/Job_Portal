# Job Portal Application

A comprehensive job portal web application that connects job seekers with employers. This platform allows users to browse job listings, apply for positions, and manage their professional profiles, while employers can post job openings and review applications.

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Project Structure](#-project-structure)
- [Installation and Setup](#-installation-and-setup)
- [Running the Application](#-running-the-application)
- [Docker Deployment](#-docker-deployment)
- [UI Components](#-ui-components)
- [Database Schema](#-database-schema)
- [Common Issues and Troubleshooting](#-common-issues-and-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

## 📝 Overview

The Job Portal application is a Java-based web application that provides a platform for job seekers to find employment opportunities and for employers to post job listings. The application follows the MVC (Model-View-Controller) architecture pattern and is built using Jakarta EE technologies.

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

## 🛠️ Technology Stack

### Frontend

- **JSP (JavaServer Pages)**: For dynamic content generation
- **JSTL (JSP Standard Tag Library)**: For conditional rendering and iteration
- **HTML/CSS**: For structure and styling
- **Bootstrap 4.6**: For responsive design and UI components
- **Font Awesome**: For icons
- **AOS (Animate On Scroll)**: For scroll animations

### Backend

- **Java**: Core programming language
- **Jakarta EE 9+**: Java Enterprise Edition framework
- **Servlets**: For handling HTTP requests and responses
- **JDBC**: For database connectivity

### Database

- **MySQL 8.0+**: Relational database for data storage

### Build Tools

- **Maven**: For dependency management and build automation

## 🗂️ Project Structure

```
job-portal/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com/
│   │   │   │   ├── DB/
│   │   │   │   │   └── DBConnection.java     # Database connection utility
│   │   │   │   ├── dao/
│   │   │   │   │   ├── jobDAO.java           # Data access for jobs
│   │   │   │   │   └── ...                   # Other DAO classes
│   │   │   │   ├── entity/
│   │   │   │   │   ├── Jobs.java             # Job entity
│   │   │   │   │   └── ...                   # Other entity classes
│   │   │   │   └── servlet/
│   │   │   │       ├── LoginServlet.java     # Authentication servlet
│   │   │   │       └── ...                   # Other controller servlets
│   │   ├── resources/
│   │   │   └── database.sql                  # Database initialization script
│   │   └── webapp/
│   │       ├── all_component/
│   │       │   ├── all_css.jsp               # Common CSS includes
│   │       │   ├── Footer.jsp                # Footer component
│   │       │   ├── navbar.jsp                # Navigation bar component
│   │       │   └── style.css                 # Custom styles
│   │       ├── img/                          # Image assets
│   │       ├── WEB-INF/
│   │       │   └── web.xml                   # Deployment descriptor
│   │       ├── home.jsp                      # Home page
│   │       ├── login.jsp                     # Login page
│   │       ├── Signup.jsp                    # Registration page
│   │       └── ...                           # Other JSP pages
│   └── test/                                 # Test classes
├── .classpath                                # Eclipse classpath configuration
├── .project                                  # Eclipse project configuration
├── fix-taglibs.ps1                           # Script for fixing JSTL issues (Windows)
├── fix-taglibs.sh                            # Script for fixing JSTL issues (Linux/macOS)
├── pom.xml                                   # Maven project configuration
└── README.md                                 # Project documentation
```

## 🔧 Installation and Setup

### Prerequisites

Before you begin, ensure you have the following installed:

- JDK 11 or higher
- Apache Tomcat 10.0 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher
- Git (optional, for cloning the repository)

### Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/job-portal.git
   cd job-portal
   ```

2. **Set up the database**

   Start your MySQL server and create a new database:

   ```bash
   mysql -u root -p
   ```

   In the MySQL shell:

   ```sql
   CREATE DATABASE job_portal;
   USE job_portal;
   SOURCE src/main/resources/database.sql;  # Run the DB initialization script
   ```

3. **Configure database connection**

   Update the database connection parameters in `src/main/java/com/DB/DBConnection.java` if needed:

   ```java
   // Example configuration
   private static final String URL = "jdbc:mysql://localhost:3306/job_portal";
   private static final String USER = "root";
   private static final String PASSWORD = "yourpassword";
   ```

4. **Fix JSTL issues (if needed)**

   If you encounter issues with JSTL tags, run the provided script:

   For Windows:

   ```
   .\fix-taglibs.ps1
   ```

   For Linux/macOS:

   ```bash
   chmod +x fix-taglibs.sh
   ./fix-taglibs.sh
   ```

5. **Build the project**
   ```bash
   mvn clean package
   ```

## 🚀 Running the Application

### Using Maven with Cargo

The simplest way to run the application is using the Cargo Maven plugin:

```bash
mvn clean install
mvn cargo:run
```

This will start the application on `http://localhost:8080/Job_Portal`

### Manual Deployment to Tomcat

1. Build the application:

   ```bash
   mvn clean package
   ```

2. Copy the WAR file to Tomcat's webapps directory:

   ```bash
   cp target/Job_Portal.war /path/to/tomcat/webapps/
   ```

3. Start Tomcat:

   For Windows:

   ```
   cd /path/to/tomcat/bin
   startup.bat
   ```

   For Linux/macOS:

   ```bash
   cd /path/to/tomcat/bin
   ./startup.sh
   ```

4. Access the application at `http://localhost:8080/Job_Portal`

## 🐳 Docker Deployment

### Prerequisites for Docker Setup

- Docker installed on your system
- Docker Compose installed
- Git (for cloning the repository)

### Environment Setup

1. **Configure Environment Variables**

   ```bash
   # Copy the example environment file
   cp .env.example .env

   # Edit the .env file with your preferred settings
   nano .env
   or
   vim .env
   or
   Directoly via VSCode
   ```

   The `.env` file contains important configuration for both the application and database:

   - Database credentials
   - Application ports
   - Java runtime options
   - Database connection details

2. **Important Environment Variables**
   ```plaintext
   MYSQL_ROOT_PASSWORD  # Root password for MySQL
   MYSQL_DATABASE       # Database name (default: job_portal)
   MYSQL_USER          # Application database user
   MYSQL_PASSWORD      # Application database password
   SERVER_PORT         # Port to access the application (default: 8080)
   ```

### Building and Running with Docker Compose

1. **Start the Application**

   ```bash
   # Build and start all services
   docker-compose up -d --build

   # Check the logs
   docker-compose logs -f
   ```

2. **Access the Application**

   - Web Interface: `http://localhost:8080`
   - Database: `localhost:3306`

3. **Stop the Application**
   ```bash
   docker-compose down    # Stops containers, removes containers and networks
   docker-compose down -v # Also removes volumes (will delete database data)
   ```

## 🎨 UI Components

The application uses several shared UI components for consistency:

### Navbar (`navbar.jsp`)

- Responsive navigation bar that changes based on user role
- Dynamic links for administrators and job seekers
- User profile modal for logged-in users

### Footer (`Footer.jsp`)

- Contains links to important sections
- Social media links
- Contact information

### CSS Styles (`style.css`)

- Custom styling for the entire application
- Color variables for consistent theming
- Responsive design adjustments

## 🗄️ Database Schema

The application uses a MySQL database with the following main tables:

- **users**: Stores user account information

  - `id` (Primary Key)
  - `name`
  - `email`
  - `password`
  - `qualification`
  - `role` (admin/user)

- **jobs**: Contains job listing details

  - `id` (Primary Key)
  - `title`
  - `description`
  - `category`
  - `status` (Active/Inactive)
  - `location`
  - `company`
  - `pdate` (posting date)

- **job_applications**: Tracks job applications
  - `id` (Primary Key)
  - `job_id` (Foreign Key to jobs)
  - `user_id` (Foreign Key to users)
  - `status`
  - `application_date`

## 🔍 Common Issues and Troubleshooting

### JSTL Tag Library Issues

If you encounter an error like "Unable to find taglib [c] for URI: [jakarta.tags.core]":

1. Run the fix script provided in the repository
2. Check your pom.xml for the correct JSTL dependencies:

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

### Database Connection Issues

If you're experiencing database connectivity problems:

1. Verify MySQL is running:

   ```bash
   # Windows
   net start mysql

   # Linux/macOS
   sudo systemctl status mysql
   ```

2. Check the connection parameters in `DBConnection.java`
3. Ensure your database user has the correct permissions

### HTTP Status 500 Errors

For internal server errors:

1. Check Tomcat logs in `/path/to/tomcat/logs/catalina.out`
2. Verify the JDBC driver is correctly included in your dependencies
3. Ensure all required libraries are in the classpath

## 🤝 Contributing

Contributions are welcome! Here's how to contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some feature'`)
5. Push to the branch (`git push origin feature/your-feature`)
6. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by Ashwani Maurya

If you like the project, please give it a ⭐️!
