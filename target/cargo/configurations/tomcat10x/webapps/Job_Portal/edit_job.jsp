 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@page import="com.DB.DBConnection" %>
 <%@page import="com.dao.jobDAO" %>
 <%@page import="com.entity.Jobs" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Job - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .edit-job-container {
    padding: 60px 0;
    background: linear-gradient(135deg, rgba(240, 241, 242, 0.9) 0%, rgba(232, 235, 240, 0.9) 100%);
  }
  
  .edit-job-card {
    border: none;
    border-radius: var(--border-radius);
    overflow: hidden;
    box-shadow: var(--card-shadow);
    background-color: white;
  }
  
  .edit-job-header {
    background: linear-gradient(to right, var(--primary-color), var(--accent-color));
    padding: 30px 20px;
    text-align: center;
    color: white;
  }
  
  .edit-job-title {
    font-weight: 700;
    margin-top: 15px;
    margin-bottom: 0;
  }
  
  .edit-job-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    color: var(--primary-color);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
  }
  
  .edit-job-body {
    padding: 40px 30px;
  }
  
  .form-group label {
    font-weight: 600;
    color: var(--gray-color);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
  }
  
  .form-group label i {
    margin-right: 8px;
  }
  
  .form-control, .custom-select {
    border-radius: var(--border-radius);
    padding: 12px 15px;
    border: 1px solid var(--light-gray);
    transition: var(--transition);
  }
  
  .form-control:focus, .custom-select:focus {
    box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
    border-color: var(--primary-color);
  }
  
  .update-btn {
    padding: 12px 25px;
    font-weight: 600;
    margin-top: 15px;
  }
  
  .back-link {
    display: inline-flex;
    align-items: center;
    color: var(--gray-color);
    text-decoration: none;
    margin-bottom: 20px;
    font-weight: 600;
    transition: var(--transition);
  }
  
  .back-link:hover {
    color: var(--primary-color);
    text-decoration: none;
  }
  
  .back-link i {
    margin-right: 6px;
  }
</style>
</head>
<body style="background-color: #f8f9fa;">

<c:if test="${userobj.role ne 'admin' }"> 
  <c:redirect url="login.jsp"></c:redirect>
 </c:if>
	<%@ include file="all_component/navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	jobDAO dao = new jobDAO(DBConnection.getConn());
	Jobs j = dao.getAllJobById(id);
	%>

	<div class="edit-job-container">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8" data-aos="fade-up">
					<a href="view_jobs.jsp" class="back-link">
						<i class="fas fa-arrow-left"></i> Back to Job Listings
					</a>
					
					<div class="edit-job-card">
						<div class="edit-job-header">
							<div class="edit-job-icon">
								<i class="fas fa-edit"></i>
							</div>
							<h3 class="edit-job-title">Edit Job Listing</h3>
						</div>
						
						<div class="edit-job-body">
							<form action="updatejobs" method="post">
								<input type="hidden" value="<%=j.getId() %>" name="id">
								
								<div class="form-group">
									<label for="title">
										<i class="fas fa-heading"></i> Job Title
									</label>
									<input type="text" name="title" id="title" required class="form-control" 
										value="<%=j.getTitle()%>">
								</div>

								<div class="row">
									<div class="form-group col-md-4">
										<label for="location">
											<i class="fas fa-map-marker-alt"></i> Location
										</label>
										<select name="location" class="custom-select" id="location">
											<option value="<%= j.getLocation()%>" selected><%=j.getLocation()%></option>
											<option value="Odisha">Odisha</option>
											<option value="Jharkhand">Jharkhand</option>
											<option value="Gujrat">Gujarat</option>
											<option value="bhubaneswar">Bhubaneswar</option>
											<option value="Delhi">Delhi</option>
											<option value="Banglore">Bangalore</option>
											<option value="Chennai">Chennai</option>
										</select>
									</div>

									<div class="form-group col-md-4">
										<label for="category">
											<i class="fas fa-briefcase"></i> Category
										</label>
										<select class="custom-select" id="category" name="category">
											<option value="<%=j.getCategory() %>" selected><%=j.getCategory() %></option>
											<option value="IT">IT</option>
											<option value="Developer">Developer</option>
											<option value="Banking">Banking</option>
											<option value="Engineering">Engineering</option>
											<option value="Teacher">Teacher</option>
										</select>
									</div>
									
									<div class="form-group col-md-4">
										<label for="status">
											<i class="fas fa-toggle-on"></i> Status
										</label>
										<select class="custom-select" id="status" name="status">
											<option value="<%= j.getStatus()%>" selected><%=j.getStatus() %></option>
											<option value="Active">Active</option>
											<option value="InActive">Inactive</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="desc">
										<i class="fas fa-align-left"></i> Job Description
									</label>
									<textarea required rows="6" id="desc" name="desc" class="form-control"><%=j.getDescription() %></textarea>
								</div>
								
								<div class="text-center">
									<button type="submit" class="btn btn-primary rounded-pill update-btn">
										<i class="fas fa-save me-2"></i> Update Job
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/Footer.jsp" %>
</body>
</html>