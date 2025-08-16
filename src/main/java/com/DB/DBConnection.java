package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;

	public static Connection getConn() {

		try {
			if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String host = System.getenv("DOCKER_ENVIRONMENT") != null ? "db" : "localhost";
				String dbName = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "job_portal";
				String dbUser = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
				String dbPassword = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "root123!";
				String dbPort = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "3306";
				
				String url = String.format("jdbc:mysql://%s:%s/%s", host, dbPort, dbName);
				conn = DriverManager.getConnection(url, dbUser, dbPassword);
				System.out.println("Connection establish successfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;

	}

}