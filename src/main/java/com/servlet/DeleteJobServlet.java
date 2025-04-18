package com.servlet;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.jobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			
			jobDAO dao=new jobDAO(DBConnection.getConn());
			boolean f=dao.deleteJobsById(id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg","Job  Delete Successfully");
				resp.sendRedirect("view_jobs.jsp");
			}
			else {
				session.setAttribute("succMsg","Something wrong on server");
				resp.sendRedirect("view_jobs.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
