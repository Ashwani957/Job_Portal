package com.entity;

public class User {

	private int id; 
	private String name; 
	private String email; 
	private String password;
	private String qulaification ; 
	private String role ;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public User(  String name, String email, String password, String qulaification, String role) {
		super();
	 
		this.name = name;
		this.email = email;
		this.password = password;
		this.qulaification = qulaification;
		this.role = role;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQulaification() {
		return qulaification;
	}
	public void setQulaification(String qulaification) {
		this.qulaification = qulaification;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	} 
	
	
}
