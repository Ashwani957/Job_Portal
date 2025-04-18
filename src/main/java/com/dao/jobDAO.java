 package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class jobDAO {

	private Connection con;

	public jobDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJobs(Jobs j) {
		boolean f = false;
		try {
			String query = "Insert into jobs (title, description , category,status, locations) values (?,?,?,?,?) ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String query = "select * from jobs order by id desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();
//				Here we get the error below line uncomment it 
		 
				 j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	Get jobs by Id 
	
	 
	// get jobs by id 
	
	
	public Jobs getAllJobById(int id ) {
		 
		Jobs j = null;
		try {
			String query = "select * from jobs where id =?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();
//				Here we get the error below line uncomment it 
//				It represent the first value 
				 j.setId(rs.getInt(1));
//				 It represent the second value
				 
				j.setTitle(rs.getString(2));
//				It reprsesnt the third value 
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  j;
	}
//update jobs 
	public boolean updateJobs(Jobs j) {
		boolean f = false;
		try {
		 
			String query = "UPDATE jobs SET title=?, description=?, category=?, status=?, locations=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteJobsById(int id) {
		
		boolean f= false ; 
		try {
			String query = "delete from jobs where id =?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true; 
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	
//	 getallJobs  which is active  for user so that it can apply 
	
	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String query = "select * from jobs where status=? order by id desc";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();
//				Here we get the error below line uncomment it 
		 
				 j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
//	getjob by id 
	
	public Jobs getjobById(int id) {
		
		Jobs j=null;
		try {
			
			String query="select * from jobs where	id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return j ; 
	}

	
	//Get a job according to the  jobs location and categoires 
	public List<Jobs> getJobsORLocationAndCate(String category,String locations){
		List<Jobs> list =new ArrayList<>();
		Jobs j = null ;
		try {
			String query="select * from jobs where category=? or locations=? order by id desc";
			PreparedStatement ps=con.prepareStatement(query);
//			Here we set the value of the category and locations
			ps.setString(1,category);
			ps.setString(2,locations);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return list ; 
	}
	
	
	// When we provide both the category and location Here 
	
	public List <Jobs> getJobsAndLocationAndCate(String  category, String location){
		List<Jobs> list =new ArrayList<Jobs>();
		Jobs j = null; 
		
		try {
			String query="select * from jobs where category=? and locations=? order by id desc";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,category);
			ps.setString(2,location);
			
			
//			Know from Here every data will be fetch from the database and store in rs reference 
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
//				from inside this while loop we take the data from the rs and set it into j wala object reference 
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);
			}	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list ; 
	}
	
	
	

} // ✅ This is the only closing brace needed. Delete any after this.
