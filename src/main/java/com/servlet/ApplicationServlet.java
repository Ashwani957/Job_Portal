package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import com.DB.DBConnection;
import com.entity.User;

@WebServlet("/submit_application")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,   // 5 MB
    maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class ApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads/resumes";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");
        
        if (user == null) {
            session.setAttribute("succMsg", "Please login to apply for jobs");
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // Ensure upload directory exists
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            // Extract form data
            int jobId = Integer.parseInt(request.getParameter("job_id"));
            int userId = user.getId();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String coverLetter = request.getParameter("coverLetter");
            String experience = request.getParameter("experience");
            String education = request.getParameter("education");
            String skills = request.getParameter("skills");
            String linkedIn = request.getParameter("linkedIn");
            String portfolio = request.getParameter("portfolio");
            String additionalInfo = request.getParameter("additionalInfo");
            
            // Handle resume file upload
            Part resumePart = request.getPart("resume");
            String resumeFileName = "";
            
            if (resumePart != null && resumePart.getSize() > 0) {
                // Generate unique filename to prevent overwrites
                String originalFileName = Paths.get(resumePart.getSubmittedFileName()).getFileName().toString();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
                
                resumeFileName = uniqueFileName;
                
                // Save file to upload directory
                try (InputStream inputStream = resumePart.getInputStream()) {
                    Files.copy(inputStream, Paths.get(uploadPath + File.separator + uniqueFileName), 
                            StandardCopyOption.REPLACE_EXISTING);
                }
            }
            
            // Store application in database
            Connection conn = DBConnection.getConn();
            String sql = "INSERT INTO job_applications (job_id, user_id, first_name, last_name, " +
                    "email, phone, address, city, state, zip, resume_path, cover_letter, " +
                    "experience, education, skills, linkedin, portfolio, additional_info, status, " +
                    "application_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, jobId);
            ps.setInt(2, userId);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.setString(8, city);
            ps.setString(9, state);
            ps.setString(10, zip);
            ps.setString(11, resumeFileName);
            ps.setString(12, coverLetter);
            ps.setString(13, experience);
            ps.setString(14, education);
            ps.setString(15, skills);
            ps.setString(16, linkedIn);
            ps.setString(17, portfolio);
            ps.setString(18, additionalInfo);
            ps.setString(19, "Pending"); // Default status
            
            int result = ps.executeUpdate();
            
            if (result > 0) {
                session.setAttribute("succMsg", "Application submitted successfully! We will contact you soon.");
                response.sendRedirect("home.jsp");
            } else {
                session.setAttribute("succMsg", "Something went wrong. Please try again.");
                response.sendRedirect("job_apply.jsp?id=" + jobId);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("succMsg", "Error: " + e.getMessage());
            response.sendRedirect("home.jsp");
        }
    }
} 