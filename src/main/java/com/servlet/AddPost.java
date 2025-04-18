package com.servlet;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.jobDAO;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/addJob")
public class AddPost extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title=req.getParameter("title");
			String location =req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
//			Here we store all the data 
			Jobs j =new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setDescription(desc);
			j.setStatus(status);
			
			
			HttpSession session =req.getSession();
			 jobDAO dao=new jobDAO(DBConnection.getConn());
//			 Here we add all the data from in dao 
			 
		boolean f=	 dao.addJobs(j);
			 
			
		if(f) {
			session.setAttribute("succMsg","Job Post Successfully");
			resp.sendRedirect("add_job.jsp");
		}
		else {
			session.setAttribute("succMsg","Something went wrong on server");
			resp.sendRedirect("add_job.jsp");
			
		}
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
