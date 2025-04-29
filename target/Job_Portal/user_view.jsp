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
<title>Browse Jobs - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .jobs-header {
    background: linear-gradient(rgba(67, 97, 238, 0.9), rgba(67, 97, 238, 0.8));
    padding: 40px 0;
    color: white;
    margin-bottom: 40px;
  }
  
  .jobs-title {
    font-weight: 700;
    margin-bottom: 10px;
  }
  
  .jobs-subtitle {
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
    background-color: white;
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
  
  .filter-card {
    background: white;
    border-radius: var(--border-radius);
    box-shadow: var(--shadow);
    margin-bottom: 30px;
    padding: 25px;
  }
  
  .filter-title {
    font-weight: 600;
    font-size: 1.1rem;
    margin-bottom: 15px;
    color: var(--dark-color);
  }
  
  .custom-select {
    border-radius: var(--border-radius);
    border: 1px solid var(--light-gray);
    padding: 10px 15px;
    height: calc(1.5em + 1rem + 2px);
  }
  
  .filter-btn {
    font-weight: 600;
    margin-top: 10px;
  }
  
  .alert {
    border-radius: var(--border-radius);
  }
</style>
</head>
<body style="background-color: #f8f9fa;">

<c:if test="${empty userobj }">
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<!-- Header -->
<div class="jobs-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="jobs-title" data-aos="fade-up">Explore Available Jobs</h1>
        <p class="jobs-subtitle" data-aos="fade-up" data-aos-delay="100">
          Find the perfect opportunity to advance your career
        </p>
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
      
      <!-- Job Filters -->
      <div class="filter-card" data-aos="fade-up">
        <h5 class="filter-title"><i class="fas fa-filter me-2"></i>Filter Jobs</h5>
        <form action="more_view.jsp" method="get" class="row">
          <div class="col-md-5 mb-3">
            <label for="location" class="font-weight-bold mb-2">Location</label>
            <select name="loc" class="custom-select" id="location">
              <option selected value="lo">Choose Location...</option>
              <option value="Odisha">Odisha</option>
              <option value="Jharkhand">Jharkhand</option>
              <option value="Gujrat">Gujarat</option>
              <option value="bhubaneswar">Bhubaneswar</option>
              <option value="Delhi">Delhi</option>
              <option value="Banglore">Bangalore</option>
              <option value="Chennai">Chennai</option>
            </select>
          </div>
          
          <div class="col-md-5 mb-3">
            <label for="category" class="font-weight-bold mb-2">Category</label>
            <select class="custom-select" id="category" name="cat">
              <option value="ca" selected>Choose Category...</option>
              <option value="IT">IT</option>
              <option value="Developer">Developer</option>
              <option value="Banking">Banking</option>
              <option value="Engineering">Engineering</option>
              <option value="Teacher">Teacher</option>
            </select>
          </div>
          
          <div class="col-md-2 d-flex align-items-end">
            <button class="btn btn-primary btn-block rounded-pill filter-btn">
              <i class="fas fa-search me-2"></i>Search
            </button>
          </div>
        </form>
      </div>
      
      <!-- Job Listings -->
      <h4 class="mb-4" data-aos="fade-up"><i class="fas fa-briefcase me-2"></i>Available Jobs</h4>
      
      <% 
        jobDAO dao = new jobDAO(DBConnection.getConn());
        List<Jobs> list = dao.getAllJobsForUser();
        int jobCount = 0;
        
        if(list.isEmpty()) {
      %>
        <div class="text-center py-5" data-aos="fade-up">
          <i class="fas fa-search fa-3x mb-3 text-muted"></i>
          <h4 class="text-muted">No Jobs Available</h4>
          <p>There are currently no job listings available. Please check back later.</p>
        </div>
      <% 
        } else {
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
                if(j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                  out.print(j.getDescription());
                } else {
                  out.print(j.getDescription().substring(0, 120) + "...");
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
              <i class="far fa-calendar-alt me-1"></i> Posted on: <%=j.getPdate().toString() %>
            </div>
            
            <a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-primary rounded-pill btn-sm">
              <i class="fas fa-eye me-1"></i> View Details
            </a>
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