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
<title>Jobs by Category</title>
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
  
  .category-header {
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
      <h1 class="text-white p-4" id="pageTitle">
        <i class="fa fa-list-ul"></i> Jobs by Category
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
          
          <div>
            <div class="filter-title mt-4">Location</div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="loc1">
              <label for="loc1">New York</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="loc2">
              <label for="loc2">Remote</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="loc3">
              <label for="loc3">Chicago</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="loc4">
              <label for="loc4">San Francisco</label>
            </div>
          </div>
          
          <div>
            <div class="filter-title mt-4">Category</div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="cat1">
              <label for="cat1">IT</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="cat2">
              <label for="cat2">Design</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="cat3">
              <label for="cat3">Marketing</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="cat4">
              <label for="cat4">Engineering</label>
            </div>
          </div>
          
          <div>
            <div class="filter-title mt-4">Experience</div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="exp1">
              <label for="exp1">Entry Level</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="exp2">
              <label for="exp2">1-3 years</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="exp3">
              <label for="exp3">3-5 years</label>
            </div>
            <div class="filter-item">
              <input type="checkbox" class="filter-checkbox" id="exp4">
              <label for="exp4">5+ years</label>
            </div>
          </div>
          
          <div class="mt-4">
            <button class="btn btn-primary w-100 rounded-pill">
              <i class="fas fa-filter me-2"></i>Apply Filters
            </button>
            <button class="btn btn-outline-secondary w-100 rounded-pill mt-2">
              <i class="fas fa-undo me-2"></i>Reset
            </button>
          </div>
        </div>
      </div>
      
      <!-- Right side job listings -->
      <div class="col-md-9">
        <%
          String categoryId = request.getParameter("id");
          jobDAO dao = new jobDAO(DBConnection.getConn());
          List<Jobs> list = null;
          
          // Set category name for display
          String categoryName = "All Categories";
          if(categoryId != null) {
            // Map category ID to proper display name
            if(categoryId.equals("tech")) {
              categoryName = "Technology";
              list = dao.getJobsORCategory("IT");
            } else if(categoryId.equals("marketing")) {
              categoryName = "Marketing";
              list = dao.getJobsORCategory("Marketing");
            } else if(categoryId.equals("design")) {
              categoryName = "Design";
              list = dao.getJobsORCategory("Design");
            } else if(categoryId.equals("finance")) {
              categoryName = "Finance";
              list = dao.getJobsORCategory("Finance");
            } else {
              list = dao.getAllJobsForUser();
            }
          } else {
            list = dao.getAllJobsForUser();
          }
        %>
        
        <script>
          // Update the page title with the category name
          document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('pageTitle').innerHTML = '<i class="fa fa-list-ul"></i> <%= categoryName %> Jobs';
          });
        </script>
        
        <div class="category-header" data-aos="fade-up">
          <h4 class="mb-0"><%= categoryName %> Jobs</h4>
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