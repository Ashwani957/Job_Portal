# --- Stage 1: Build the application using Maven ---
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Create builder user with a proper home directory
RUN useradd -m -r -s /bin/bash builder

WORKDIR /app

# Ensure proper permissions for builder's directories
RUN chown -R builder:builder /app /home/builder

# Copy project files with correct ownership
COPY --chown=builder:builder . .

# Switch to non-root user
USER builder

# Build the application without using BuildKit mounts for compatibility
RUN mvn clean package

# --- Stage 2: Deploy to Tomcat ---
FROM tomcat:10.1-jdk17

# Remove default web applications (optional, for a clean deployment)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file to Tomcat's webapps directory as ROOT.war
# This assumes that Maven creates a WAR file named "Job_Portal.war" as defined by your <finalName>
COPY --from=build /app/target/Job_Portal.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
