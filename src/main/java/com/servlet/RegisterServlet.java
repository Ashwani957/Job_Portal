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

@WebServlet("/user_register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		
		try {
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email =req.getParameter("email");
			String ps=req.getParameter("ps");
			UserDAO dao=new UserDAO(DBConnection.getConn());
			
//			From Here we set the value of the user DAO
			User u =new User(name, email, ps, qua,"User");
			
			boolean f =dao.addUser(u);
			HttpSession session =req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Registration Successfully");
				resp.sendRedirect("Signup.jsp");
				
			}
			
			else {
				session.setAttribute("succMsg", "Something wrong on server");
				resp.sendRedirect("Signup.jsp");
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}	
