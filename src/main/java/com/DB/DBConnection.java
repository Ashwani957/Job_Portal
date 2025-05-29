package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;

	private static String getEnvOrDefault(String key, String defaultValue) {
		String value = System.getenv(key);
		return value != null ? value : defaultValue;
	}

	public static Connection getConn() {
		try {
			if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				// Get database configuration from environment variables
				String host = System.getenv("DOCKER_ENVIRONMENT") != null ? "db" : "localhost";
				String port = getEnvOrDefault("DB_PORT", "3306");
				String database = getEnvOrDefault("DB_NAME", "job_portal");
				String user = getEnvOrDefault("DB_USER", "root");
				String password = getEnvOrDefault("DB_PASSWORD", "");

				String url = String.format("jdbc:mysql://%s:%s/%s", host, port, database);
				conn = DriverManager.getConnection(url, user, password);
				System.out.println("Connection established successfully to database: " + database);
			}
		} catch (Exception e) {
			System.err.println("Database connection error: " + e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}

}
