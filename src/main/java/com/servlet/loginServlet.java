package com.servlet;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

 
@WebServlet("/login")
public class loginServlet extends HttpServlet {
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
		try {
			String email=req.getParameter("em");
			String password =req.getParameter("ps");
			User u=new User();
			HttpSession session =req.getSession();
//			if email is ashwanimaurya957@gmail.com then it is a admin email id other wise go to the else part and exectue it 
			if("ashwanimaurya957@gmail.com".equals(email)&& "12345".equals(password)) {
				session.setAttribute("userobj",u);
			u.setRole("admin");	
			resp.sendRedirect("admin.jsp");
			}
			else {
		 UserDAO dao=new UserDAO(DBConnection.getConn());
		 User user	=dao.login(email,password);
//		 if user is not equal to null then we redirect to the home page 
		 if(user!=null) { 
			 session.setAttribute("userobj", user);
			 resp.sendRedirect("home.jsp"); 
		 }
		 else {
			 session.setAttribute("succMsg", "Invalid Email & Password ");
			 resp.sendRedirect("login.jsp");
			 
		 }
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
