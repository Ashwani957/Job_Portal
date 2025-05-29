<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Dashboard - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
  .admin-header {
    background: linear-gradient(rgba(49, 59, 172, 0.8), rgba(49, 59, 172, 0.9)), url("img/admin.jpg");
    background-size: cover;
    background-position: center;
    padding: 100px 0;
    color: white;
    text-align: center;
    position: relative;
  }
  
  .admin-header h1 {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 20px;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
  }
  
  .admin-header p {
    font-size: 1.2rem;
    max-width: 700px;
    margin: 0 auto;
  }
  
  .admin-stats {
    margin-top: -70px;
    margin-bottom: 50px;
  }
  
  .stat-card {
    border-radius: var(--border-radius);
    padding: 25px;
    text-align: center;
    box-shadow: var(--card-shadow);
    transition: var(--transition);
    background: white;
    border: none;
    height: 100%;
  }
  
  .stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  }
  
  .stat-icon {
    width: 70px;
    height: 70px;
    margin: 0 auto 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.8rem;
    color: white;
  }
  
  .bg-jobs {
    background: var(--primary-color);
  }
  
  .bg-users {
    background: var(--success-color);
  }
  
  .bg-categories {
    background: var(--warning-color);
  }
  
  .stat-value {
    font-size: 2.2rem;
    font-weight: 700;
    margin-bottom: 10px;
    color: var(--dark-color);
  }
  
  .stat-label {
    font-size: 1rem;
    font-weight: 600;
    color: var(--gray-color);
    margin-bottom: 0;
  }
  
  .admin-actions {
    padding: 40px 0;
  }
  
  .action-card {
    border-radius: var(--border-radius);
    padding: 30px;
    box-shadow: var(--shadow);
    transition: var(--transition);
    background: white;
    border: none;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  
  .action-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--card-shadow);
  }
  
  .action-icon {
    font-size: 2.5rem;
    margin-bottom: 20px;
    color: var(--primary-color);
  }
  
  .action-title {
    font-weight: 700;
    margin-bottom: 15px;
    color: var(--dark-color);
  }
  
  .action-desc {
    color: var(--gray-color);
    margin-bottom: 20px;
  }
  
  .action-link {
    margin-top: auto;
  }
</style>
</head>
<body>
<!-- Check if user is admin -->
<c:if test="${userobj.role ne 'admin' }"> 
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<!-- Admin Header -->
<div class="admin-header">
  <div class="container">
    <h1 data-aos="fade-up">Welcome to Admin Dashboard</h1>
    <p data-aos="fade-up" data-aos-delay="100">
      Manage your job listings, users, and monitor the platform's performance from one central location.
    </p>
  </div>
</div>

<!-- Stats Section -->
<div class="container admin-stats">
  <div class="row">
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
      <div class="stat-card">
        <div class="stat-icon bg-jobs">
          <i class="fas fa-briefcase"></i>
        </div>
        <h2 class="stat-value">125</h2>
        <p class="stat-label">Total Jobs</p>
      </div>
    </div>
    
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
      <div class="stat-card">
        <div class="stat-icon bg-users">
          <i class="fas fa-users"></i>
        </div>
        <h2 class="stat-value">548</h2>
        <p class="stat-label">Registered Users</p>
      </div>
    </div>
    
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="400">
      <div class="stat-card">
        <div class="stat-icon bg-categories">
          <i class="fas fa-th-list"></i>
        </div>
        <h2 class="stat-value">6</h2>
        <p class="stat-label">Job Categories</p>
      </div>
    </div>
  </div>
</div>

<!-- Admin Actions -->
<div class="container admin-actions">
  <h3 class="text-center mb-4" data-aos="fade-up">Quick Actions</h3>
  
  <div class="row">
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
      <div class="action-card">
        <div class="action-icon">
          <i class="fas fa-plus-circle"></i>
        </div>
        <h4 class="action-title">Post New Job</h4>
        <p class="action-desc">Create a new job listing with all details and publish it for applicants.</p>
        <a href="add_job.jsp" class="btn btn-primary rounded-pill action-link">
          <i class="fas fa-plus me-1"></i> Post Job
        </a>
      </div>
    </div>
    
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
      <div class="action-card">
        <div class="action-icon">
          <i class="fas fa-list-alt"></i>
        </div>
        <h4 class="action-title">Manage Jobs</h4>
        <p class="action-desc">View all job listings, edit details, or remove outdated positions.</p>
        <a href="view_jobs.jsp" class="btn btn-primary rounded-pill action-link">
          <i class="fas fa-eye me-1"></i> View Jobs
        </a>
      </div>
    </div>
    
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
      <div class="action-card">
        <div class="action-icon">
          <i class="fas fa-cog"></i>
        </div>
        <h4 class="action-title">Admin Settings</h4>
        <p class="action-desc">Configure system settings, manage categories, and set preferences.</p>
        <a href="#" class="btn btn-primary rounded-pill action-link">
          <i class="fas fa-cog me-1"></i> Settings
        </a>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>