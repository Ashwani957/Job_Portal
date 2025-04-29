<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.jobDAO" %>
<%@ page import ="com.DB.DBConnection" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Jobs - Admin Dashboard</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .admin-jobs-header {
    background: linear-gradient(rgba(67, 97, 238, 0.9), rgba(67, 97, 238, 0.8));
    padding: 40px 0;
    color: white;
    margin-bottom: 40px;
  }
  
  .admin-jobs-title {
    font-weight: 700;
    margin-bottom: 10px;
  }
  
  .admin-jobs-subtitle {
    font-weight: 300;
    opacity: 0.9;
  }
  
  .job-card {
    border: none;
    border-radius: var(--border-radius);
    box-shadow: var(--shadow);
    margin-bottom: 25px;
    transition: var(--transition);
    overflow: hidden;
  }
  
  .job-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--card-shadow);
  }
  
  .job-card-header {
    padding: 20px 20px 0;
    position: relative;
  }
  
  .job-card-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    height: 4px;
    width: 100%;
    background: var(--primary-color);
  }
  
  .job-icon {
    color: var(--primary-color);
    margin-bottom: 15px;
  }
  
  .job-title {
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--dark-color);
    margin-bottom: 15px;
  }
  
  .job-description {
    color: var(--gray-color);
    font-size: 0.95rem;
    line-height: 1.6;
    margin-bottom: 20px;
  }
  
  .job-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 20px;
  }
  
  .job-meta-item {
    padding: 6px 12px;
    border-radius: 20px;
    background-color: rgba(67, 97, 238, 0.1);
    color: var(--primary-color);
    font-size: 0.85rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
  }
  
  .job-meta-item i {
    margin-right: 5px;
  }
  
  .job-card-body {
    padding: 0 20px;
  }
  
  .job-card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background: rgba(0, 0, 0, 0.02);
    border-top: 1px solid rgba(0, 0, 0, 0.05);
  }
  
  .job-date {
    font-size: 0.85rem;
    color: var(--gray-color);
  }
  
  .job-actions .btn {
    margin-left: 8px;
  }
  
  .alert {
    border-radius: var(--border-radius);
  }
  
  .add-job-btn {
    margin-bottom: 20px;
  }
  
  .no-jobs {
    text-align: center;
    padding: 60px 0;
    color: var(--gray-color);
  }
  
  .no-jobs-icon {
    font-size: 4rem;
    margin-bottom: 20px;
    color: #e9ecef;
  }
</style>
</head>
<body style="background-color: #f8f9fa;">

<!-- Check if user is admin -->
<c:if test="${userobj.role ne 'admin' }"> 
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<!-- Header -->
<div class="admin-jobs-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="admin-jobs-title" data-aos="fade-up">Manage Job Listings</h1>
        <p class="admin-jobs-subtitle" data-aos="fade-up" data-aos-delay="100">View, edit, and delete all job listings from this dashboard</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <!-- Success Messages -->
      <c:if test="${not empty succMsg }">
        <div class="alert alert-success alert-dismissible fade show" role="alert" data-aos="fade-up">
          <i class="fas fa-check-circle me-2"></i>${succMsg}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <c:remove var="succMsg"/> 
      </c:if>
      
      <!-- Add Job Button -->
      <div class="text-right add-job-btn" data-aos="fade-up">
        <a href="add_job.jsp" class="btn btn-primary rounded-pill">
          <i class="fas fa-plus-circle me-2"></i>Post New Job
        </a>
      </div>
      
      <!-- Job Listings -->
      <% 
        jobDAO dao = new jobDAO(DBConnection.getConn());
        List<Jobs> list = dao.getAllJobs();
        
        if(list.isEmpty()) {
      %>
        <div class="no-jobs" data-aos="fade-up">
          <div class="no-jobs-icon">
            <i class="fas fa-clipboard"></i>
          </div>
          <h4>No Jobs Available</h4>
          <p>There are currently no job listings. Add your first job to get started.</p>
        </div>
      <% 
        } else {
          int jobCount = 0;
          for(Jobs j : list) { 
            jobCount++;
      %>
        <div class="job-card" data-aos="fade-up" data-aos-delay="<%= 100 + (jobCount * 50) %>">
          <div class="job-card-header">
            <div class="job-icon">
              <i class="far fa-clipboard fa-2x"></i>
            </div>
            <h5 class="job-title"><%=j.getTitle() %></h5>
            
            <div class="job-description">
              <% 
                if(j.getDescription().length() > 150) {
                  out.print(j.getDescription().substring(0, 150) + "...");
                } else {
                  out.print(j.getDescription());
                }
              %>
            </div>
            
            <div class="job-meta">
              <span class="job-meta-item">
                <i class="fas fa-map-marker-alt"></i> <%=j.getLocation() %>
              </span>
              <span class="job-meta-item">
                <i class="fas fa-briefcase"></i> <%=j.getCategory() %>
              </span>
              <span class="job-meta-item">
                <i class="fas fa-info-circle"></i> <%=j.getStatus() %>
              </span>
            </div>
          </div>
          
          <div class="job-card-footer">
            <div class="job-date">
              <i class="far fa-calendar-alt me-1"></i> Posted on: <%=j.getPdate() %>
            </div>
            
            <div class="job-actions">
              <a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm btn-info rounded-pill">
                <i class="fas fa-eye me-1"></i> View
              </a>
              <a href="edit_job.jsp?id=<%=j.getId()%>" class="btn btn-sm btn-primary rounded-pill">
                <i class="fas fa-edit me-1"></i> Edit
              </a>
              <a href="delete?id=<%=j.getId()%>" class="btn btn-sm btn-danger rounded-pill">
                <i class="fas fa-trash-alt me-1"></i> Delete
              </a>
            </div>
          </div>
        </div>
      <% 
          }
        }
      %>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>