package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

	private Connection con; 
	
	public UserDAO(Connection con) {
		super();
		this.con=con; 
	}
	
	 
	public boolean addUser(User u) {
		boolean f = false ; 
		
		try {
			String query="insert into users (name,qualification , email , password, role) values (?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQulaification());
			ps.setString(3,u.getEmail());
			ps.setString(4,u.getPassword());
			ps.setString(5,"user");
			
		int i = ps.executeUpdate();
		
		if(i==1) {
			f=true; 
			
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f ; 
	}
	
//	User login 
	
	public User login(String em , String psw) {
		User u = null; 
		
		try {

			String query="select * from users where email=? and password=?";
			PreparedStatement ps1=con.prepareStatement(query);
			ps1.setString(1, em);
			ps1.setString(2,psw);
			
			ResultSet rs=ps1.executeQuery();
			while(rs.next()) {
				 u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQulaification(rs.getString(5));
			u.setRole(rs.getString(6));
			}
			 
			
		}
		catch(Exception e ) {
			
		}
		
		return u ; 
	}
	
	
	public boolean udpateUser(User u ) {
		boolean f= false ; 
		
		try {
			String sql="update users set name=?,qualification=?,email=?,password=? where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2,u.getQulaification());
			ps.setString(3,u.getEmail());
			ps.setString(4,u.getPassword());
			ps.setInt(5,u.getId());
			
			int i =ps.executeUpdate();
			if(i==1) {
				f=true; 
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f; 
	}
	
	
}
