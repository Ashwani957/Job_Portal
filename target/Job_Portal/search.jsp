<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<%@include file="all_component/all_css.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style type="text/css">
  .back-img {
    background: url("img/job2.jpg");
    width: 100%;
    height: 20vh;
    background-repeat: no-repeat;
    background-size: cover;
  }
  
  .job-card {
    border-radius: 10px;
    border: none;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 25px;
    background-color: #fff;
    transition: all 0.3s ease;
  }
  
  .job-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  }
  
  .job-card-header {
    display: flex;
    margin-bottom: 15px;
    align-items: center;
  }
  
  .job-logo {
    width: 60px;
    height: 60px;
    background-color: #f0f8ff;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    color: #007bff;
    font-size: 2rem;
  }
  
  .job-title {
    margin-bottom: 5px;
    color: #333;
  }
  
  .job-company {
    font-size: 0.9rem;
    color: #555;
    margin-bottom: 5px;
  }
  
  .job-meta {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 15px;
  }
  
  .job-tag {
    background-color: #f8f9fa;
    border-radius: 30px;
    padding: 5px 15px;
    margin-right: 10px;
    margin-bottom: 10px;
    font-size: 0.85rem;
    color: #555;
  }
  
  .job-tag i {
    margin-right: 5px;
    color: #007bff;
  }
  
  .job-description {
    font-size: 0.95rem;
    color: #555;
    margin-bottom: 15px;
    line-height: 1.6;
  }
  
  .job-footer {
    display: flex;
    justify-content: space-between;
    color: #777;
    font-size: 0.85rem;
    border-top: 1px solid #eee;
    padding-top: 15px;
    margin-bottom: 15px;
  }
  
  .job-type {
    background-color: #e8f4ff;
    color: #007bff;
    padding: 3px 12px;
    border-radius: 20px;
    font-weight: 500;
  }
  
  .search-header {
    background-color: #f8f9fa;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 30px;
    border-left: 5px solid #007bff;
  }
  
  .filter-section {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 30px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
  }
  
  .filter-title {
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 15px;
    color: #333;
    border-bottom: 2px solid #f0f0f0;
    padding-bottom: 10px;
  }
  
  .filter-item {
    margin-bottom: 10px;
  }
  
  .filter-checkbox {
    margin-right: 10px;
  }
</style>
</head>
<body style="background-color: #f0f8ff;">
  <%@include file="all_component/navbar.jsp"%>
  
  <div class="container-fluid back-img">
    <div class="text-center">
      <h1 class="text-white p-4">
        <i class="fa fa-search"></i> Search Results
      </h1>
    </div>
  </div>
  
  <div class="container mt-n5 mb-5">
    <div class="row">
      <!-- Left side filters -->
      <div class="col-md-3" data-aos="fade-right">
        <div class="filter-section">
          <div class="filter-title">
            <i class="fas fa-filter me-2"></i>Filter Jobs
          </div>
          
          <form action="search.jsp" method="get">
            <div>
              <div class="filter-title mt-4">Search</div>
              <div class="form-group mb-3">
                <input type="text" name="keyword" class="form-control" placeholder="Job title or keyword" 
                  value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
              </div>
            </div>
            
            <div>
              <div class="filter-title mt-4">Category</div>
              <select name="category" class="form-control mb-3">
                <option value="">All Categories</option>
                <option value="IT" <%= "IT".equals(request.getParameter("category")) ? "selected" : "" %>>IT</option>
                <option value="Design" <%= "Design".equals(request.getParameter("category")) ? "selected" : "" %>>Design</option>
                <option value="Marketing" <%= "Marketing".equals(request.getParameter("category")) ? "selected" : "" %>>Marketing</option>
                <option value="Engineering" <%= "Engineering".equals(request.getParameter("category")) ? "selected" : "" %>>Engineering</option>
              </select>
            </div>
            
            <div>
              <div class="filter-title mt-4">Location</div>
              <select name="location" class="form-control mb-3">
                <option value="">All Locations</option>
                <option value="New York" <%= "New York".equals(request.getParameter("location")) ? "selected" : "" %>>New York, NY</option>
                <option value="Remote" <%= "Remote".equals(request.getParameter("location")) ? "selected" : "" %>>Remote</option>
                <option value="Chicago" <%= "Chicago".equals(request.getParameter("location")) ? "selected" : "" %>>Chicago, IL</option>
                <option value="Boston" <%= "Boston".equals(request.getParameter("location")) ? "selected" : "" %>>Boston, MA</option>
                <option value="San Francisco" <%= "San Francisco".equals(request.getParameter("location")) ? "selected" : "" %>>San Francisco, CA</option>
                <option value="Odisha" <%= "Odisha".equals(request.getParameter("location")) ? "selected" : "" %>>Odisha</option>
                <option value="Jharkhand" <%= "Jharkhand".equals(request.getParameter("location")) ? "selected" : "" %>>Jharkhand</option>
                <option value="Gujrat" <%= "Gujrat".equals(request.getParameter("location")) ? "selected" : "" %>>Gujarat</option>
                <option value="Bhubaneswar" <%= "Bhubaneswar".equals(request.getParameter("location")) ? "selected" : "" %>>Bhubaneswar</option>
                <option value="Delhi" <%= "Delhi".equals(request.getParameter("location")) ? "selected" : "" %>>Delhi</option>
                <option value="Banglore" <%= "Banglore".equals(request.getParameter("location")) ? "selected" : "" %>>Bangalore</option>
                <option value="Chennai" <%= "Chennai".equals(request.getParameter("location")) ? "selected" : "" %>>Chennai</option>
              </select>
            </div>
            
            <div class="mt-4">
              <button type="submit" class="btn btn-primary w-100 rounded-pill">
                <i class="fas fa-search me-2"></i>Search Jobs
              </button>
              <a href="jobs.jsp" class="btn btn-outline-secondary w-100 rounded-pill mt-2">
                <i class="fas fa-undo me-2"></i>Reset Filters
              </a>
            </div>
          </form>
        </div>
      </div>
      
      <!-- Right side job listings -->
      <div class="col-md-9">
        <%
          String keyword = request.getParameter("keyword");
          String category = request.getParameter("category");
          String location = request.getParameter("location");
          
          jobDAO dao = new jobDAO(DBConnection.getConn());
          List<Jobs> list = null;
          
          // Build search criteria for display
          StringBuilder searchCriteria = new StringBuilder();
          
          if (keyword != null && !keyword.trim().isEmpty()) {
            searchCriteria.append("\"").append(keyword).append("\"");
            if ((category != null && !category.isEmpty()) || (location != null && !location.isEmpty())) {
              searchCriteria.append(" in ");
            }
          }
          
          if (category != null && !category.isEmpty()) {
            searchCriteria.append(category);
            if (location != null && !location.isEmpty()) {
              searchCriteria.append(" at ");
            }
          }
          
          if (location != null && !location.isEmpty()) {
            searchCriteria.append(location);
          }
          
          // Define search strategy
          if (keyword != null && !keyword.trim().isEmpty()) {
            // Keyword search takes precedence
            list = dao.searchJobsByKeyword(keyword);
            
            // Further filter results by category and location if provided
            if (category != null && !category.isEmpty() && location != null && !location.isEmpty()) {
              // We need to filter the list manually because we don't have a specific DAO method for this combination
              List<Jobs> filteredList = new java.util.ArrayList<>();
              for (Jobs j : list) {
                if (j.getCategory().equals(category) && j.getLocation().equals(location)) {
                  filteredList.add(j);
                }
              }
              list = filteredList;
            } else if (category != null && !category.isEmpty()) {
              // Filter by category
              List<Jobs> filteredList = new java.util.ArrayList<>();
              for (Jobs j : list) {
                if (j.getCategory().equals(category)) {
                  filteredList.add(j);
                }
              }
              list = filteredList;
            } else if (location != null && !location.isEmpty()) {
              // Filter by location
              List<Jobs> filteredList = new java.util.ArrayList<>();
              for (Jobs j : list) {
                if (j.getLocation().equals(location)) {
                  filteredList.add(j);
                }
              }
              list = filteredList;
            }
          } else if (category != null && !category.isEmpty() && location != null && !location.isEmpty()) {
            // Both category and location specified
            list = dao.getJobsAndLocationAndCate(category, location);
          } else if (category != null && !category.isEmpty()) {
            // Only category specified
            list = dao.getJobsORCategory(category);
          } else if (location != null && !location.isEmpty()) {
            // Only location specified
            list = dao.getJobsORLocation(location);
          } else {
            // No search criteria - show all active jobs
            list = dao.getAllJobsForUser();
          }
          
          // Set default search criteria if none was provided
          if (searchCriteria.length() == 0) {
            searchCriteria.append("All Jobs");
          }
        %>
        
        <div class="search-header" data-aos="fade-up">
          <h4 class="mb-0">Search Results for <%= searchCriteria.toString() %></h4>
          <p class="text-muted mb-0">Found <%= list.size() %> jobs matching your criteria</p>
        </div>
        
        <div class="d-flex justify-content-between align-items-center mb-4" data-aos="fade-up">
          <p class="mb-0 text-muted">Showing <%= list.size() %> results</p>
          <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-sort me-1"></i> Sort by
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <li><a class="dropdown-item" href="#">Newest First</a></li>
              <li><a class="dropdown-item" href="#">Oldest First</a></li>
              <li><a class="dropdown-item" href="#">A-Z</a></li>
              <li><a class="dropdown-item" href="#">Z-A</a></li>
            </ul>
          </div>
        </div>
        
        <% 
          int jobCount = 0;
          for(Jobs j : list) {
            jobCount++;
        %>
        
        <div class="job-card" data-aos="fade-up" data-aos-delay="<%= 100 + (jobCount * 50) %>">
          <div class="job-card-header">
            <div class="job-logo">
              <i class="fas fa-building"></i>
            </div>
            <div>
              <h5 class="job-title"><%= j.getTitle() %></h5>
              <p class="job-company">ABC Corporation</p>
              <p class="job-location"><i class="fas fa-map-marker-alt"></i> <%= j.getLocation() %></p>
            </div>
          </div>
          
          <div class="job-meta">
            <span class="job-tag"><i class="fas fa-briefcase"></i> <%= j.getCategory() %></span>
            <span class="job-tag"><i class="fas fa-info-circle"></i> <%= j.getStatus() %></span>
            <span class="job-tag"><i class="fas fa-dollar-sign"></i> Negotiable</span>
          </div>
          
          <p class="job-description">
            <% if (j.getDescription().length() > 0 && j.getDescription().length() < 150) { %>
              <%= j.getDescription() %>
            <% } else { %>
              <%= j.getDescription().substring(0, 150) %>...
            <% } %>
          </p>
          
          <div class="job-footer">
            <span class="job-type">Full-time</span>
            <span class="job-date">
              <i class="far fa-calendar-alt me-1"></i> Posted: <%= j.getPdate().toString() %>
            </span>
          </div>
          
          <div class="mt-3">
            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-primary rounded-pill px-4">
              <i class="fas fa-eye me-1"></i> View Details
            </a>
            <a href="#" class="btn btn-outline-primary rounded-pill px-4 ms-2">
              <i class="far fa-bookmark me-1"></i> Save Job
            </a>
          </div>
        </div>
        
        <% } %>
        
        <% if (list.isEmpty()) { %>
          <div class="text-center py-5" data-aos="fade-up">
            <i class="fas fa-search fa-3x mb-3 text-muted"></i>
            <h4 class="text-muted">No jobs found</h4>
            <p>Try adjusting your search filters or check back later.</p>
          </div>
        <% } else { %>
          <!-- Pagination -->
          <nav aria-label="Page navigation" data-aos="fade-up">
            <ul class="pagination">
              <li class="page-item disabled">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        <% } %>
      </div>
    </div>
  </div>
  
  <%@include file="all_component/Footer.jsp"%>
  
  <!-- Initialize AOS -->
  <script>
    AOS.init({
      duration: 800,
      easing: 'ease-in-out',
      once: true
    });
  </script>
</body>
</html> 
