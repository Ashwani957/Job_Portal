<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.DB.DBConnection" %>
<%@ page import="com.dao.jobDAO" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Browse Jobs - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .page-header {
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('all_component/img/job-banner.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 60px 0;
    margin-bottom: 40px;
    text-align: center;
  }
  
  .search-form {
    background: white;
    border-radius: 10px;
    padding: 25px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    margin-top: -30px;
    position: relative;
    z-index: 100;
  }
  
  .job-filter-sidebar {
    background: white;
    border-radius: 10px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    height: 100%;
    position: sticky;
    top: 20px;
  }
  
  .filter-title {
    font-size: 1.1rem;
    font-weight: 700;
    margin-bottom: 15px;
    color: var(--dark-color);
    display: flex;
    align-items: center;
  }
  
  .filter-title i {
    margin-right: 10px;
    color: var(--primary-color);
  }
  
  .filter-section {
    margin-bottom: 25px;
    border-bottom: 1px solid #eee;
    padding-bottom: 20px;
  }
  
  .filter-section:last-child {
    border-bottom: none;
    padding-bottom: 0;
    margin-bottom: 0;
  }
  
  .custom-control-label {
    cursor: pointer;
    font-size: 0.95rem;
    margin-bottom: 8px;
  }
  
  .job-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 25px;
    padding: 25px;
    transition: transform 0.3s, box-shadow 0.3s;
    border-left: 4px solid var(--primary-color);
  }
  
  .job-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  }
  
  .job-card-header {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }
  
  .job-logo {
    width: 70px;
    height: 70px;
    min-width: 70px;
    background: #f5f5f5;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    font-size: 2rem;
    color: var(--primary-color);
  }
  
  .job-title {
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 5px;
    color: var(--dark-color);
  }
  
  .job-company {
    color: var(--primary-color);
    font-weight: 600;
    margin-bottom: 5px;
  }
  
  .job-location {
    color: var(--gray-color);
    font-size: 0.9rem;
    display: flex;
    align-items: center;
  }
  
  .job-location i {
    margin-right: 5px;
  }
  
  .job-meta {
    display: flex;
    flex-wrap: wrap;
    margin: 15px 0;
    gap: 10px;
  }
  
  .job-tag {
    background: #f0f4ff;
    color: var(--primary-color);
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
  }
  
  .job-tag i {
    margin-right: 5px;
  }
  
  .job-description {
    color: #6c757d;
    margin-bottom: 20px;
    line-height: 1.6;
  }
  
  .job-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #eee;
  }
  
  .job-type {
    background: #e8f5e9;
    color: #2e7d32;
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
  }
  
  .job-date {
    color: #6c757d;
    font-size: 0.85rem;
  }
  
  .filter-button {
    margin-top: 20px;
  }
  
  .pagination {
    justify-content: center;
    margin-top: 40px;
  }
  
  .page-link {
    color: var(--primary-color);
    border-radius: 5px;
    margin: 0 5px;
  }
  
  .page-item.active .page-link {
    background-color: var(--primary-color);
    border-color: var(--primary-color);
  }
  
  @media (max-width: 767px) {
    .job-filter-sidebar {
      margin-bottom: 30px;
      position: static;
    }
  }
</style>
</head>
<body style="background-color: #f8f9fa;">

<!-- Check if user is logged in -->
<c:if test="${empty userobj }">
  <c:redirect url="login.jsp" />
</c:if> 

<%@include file="all_component/navbar.jsp" %>

<!-- Page Header -->
<div class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="font-weight-bold" data-aos="fade-up">Find Your Perfect Job</h1>
        <p class="lead" data-aos="fade-up" data-aos-delay="100">Discover thousands of job opportunities with top employers</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <!-- Search Form -->
  <div class="row justify-content-center">
    <div class="col-md-10">
      <div class="search-form" data-aos="fade-up">
        <form action="search.jsp" method="get">
          <div class="row g-3">
            <div class="col-md-5">
              <div class="form-floating">
                <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Job title or keyword">
                <label for="keyword"><i class="fas fa-search me-2"></i>Job title or keyword</label>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-floating">
                <select class="form-select" id="location" name="location">
                  <option selected value="">All Locations</option>
                  <option value="New York">New York, NY</option>
                  <option value="Remote">Remote</option>
                  <option value="Chicago">Chicago, IL</option>
                  <option value="Boston">Boston, MA</option>
                  <option value="San Francisco">San Francisco, CA</option>
                  <option value="Odisha">Odisha</option>
                  <option value="Jharkhand">Jharkhand</option>
                  <option value="Gujrat">Gujarat</option>
                  <option value="Bhubaneswar">Bhubaneswar</option>
                  <option value="Delhi">Delhi</option>
                  <option value="Banglore">Bangalore</option>
                  <option value="Chennai">Chennai</option>
                </select>
                <label for="location"><i class="fas fa-map-marker-alt me-2"></i>Location</label>
              </div>
            </div>
            <div class="col-md-3">
              <button type="submit" class="btn btn-primary w-100 h-100 rounded-3 fw-bold">
                <i class="fas fa-search me-2"></i>Search
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Success Messages -->
  <c:if test="${not empty succMsg }">
    <div class="alert alert-success alert-dismissible fade show mt-4" role="alert" data-aos="fade-up">
      <i class="fas fa-check-circle me-2"></i>${succMsg}
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <c:remove var="succMsg"/> 
  </c:if>

  <div class="row mt-4">
    <!-- Filter Sidebar -->
    <div class="col-md-3 mb-4" data-aos="fade-up">
      <div class="job-filter-sidebar">
        <h4 class="mb-4"><i class="fas fa-filter me-2"></i>Filters</h4>
        
        <form action="more_view.jsp" method="get">
          <!-- Category Filter -->
          <div class="filter-section">
            <h5 class="filter-title"><i class="fas fa-briefcase"></i>Category</h5>
            <div class="mb-3">
              <select class="form-select" name="cat">
                <option value="ca" selected>All Categories</option>
                <option value="IT">IT</option>
                <option value="Developer">Developer</option>
                <option value="Banking">Banking</option>
                <option value="Engineering">Engineering</option>
                <option value="Teacher">Teacher</option>
              </select>
            </div>
          </div>
          
          <!-- Location Filter -->
          <div class="filter-section">
            <h5 class="filter-title"><i class="fas fa-map-marker-alt"></i>Location</h5>
            <div class="mb-3">
              <select class="form-select" name="loc">
                <option value="lo" selected>All Locations</option>
                <option value="New York">New York, NY</option>
                <option value="Remote">Remote</option>
                <option value="Chicago">Chicago, IL</option>
                <option value="Boston">Boston, MA</option>
                <option value="San Francisco">San Francisco, CA</option>
                <option value="Odisha">Odisha</option>
                <option value="Jharkhand">Jharkhand</option>
                <option value="Gujrat">Gujarat</option>
                <option value="Bhubaneswar">Bhubaneswar</option>
                <option value="Delhi">Delhi</option>
                <option value="Banglore">Bangalore</option>
                <option value="Chennai">Chennai</option>
              </select>
            </div>
          </div>
          
          <!-- Job Type Filter -->
          <div class="filter-section">
            <h5 class="filter-title"><i class="far fa-clock"></i>Job Type</h5>
            <div class="form-check mb-2">
              <input class="form-check-input" type="checkbox" value="Full Time" id="jobType1" name="jobType">
              <label class="form-check-label" for="jobType1">
                Full Time
              </label>
            </div>
            <div class="form-check mb-2">
              <input class="form-check-input" type="checkbox" value="Part Time" id="jobType2" name="jobType">
              <label class="form-check-label" for="jobType2">
                Part Time
              </label>
            </div>
            <div class="form-check mb-2">
              <input class="form-check-input" type="checkbox" value="Contract" id="jobType3" name="jobType">
              <label class="form-check-label" for="jobType3">
                Contract
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="Internship" id="jobType4" name="jobType">
              <label class="form-check-label" for="jobType4">
                Internship
              </label>
            </div>
          </div>
          
          <!-- Status Filter -->
          <div class="filter-section">
            <h5 class="filter-title"><i class="fas fa-info-circle"></i>Status</h5>
            <div class="form-check mb-2">
              <input class="form-check-input" type="radio" name="status" id="statusActive" value="Active" checked>
              <label class="form-check-label" for="statusActive">
                Active
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="status" id="statusInactive" value="Inactive">
              <label class="form-check-label" for="statusInactive">
                Inactive
              </label>
            </div>
          </div>
          
          <button type="submit" class="btn btn-primary w-100 filter-button">
            <i class="fas fa-filter me-2"></i>Apply Filters
          </button>
        </form>
      </div>
    </div>
    
    <!-- Job Listings -->
    <div class="col-md-9">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 data-aos="fade-up"><i class="fas fa-briefcase me-2"></i>Available Jobs</h4>
        <div class="dropdown" data-aos="fade-up">
          <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="sortDropdown" data-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-sort me-2"></i>Sort By
          </button>
          <ul class="dropdown-menu" aria-labelledby="sortDropdown">
            <li><a class="dropdown-item" href="#">Newest First</a></li>
            <li><a class="dropdown-item" href="#">Oldest First</a></li>
            <li><a class="dropdown-item" href="#">A-Z</a></li>
            <li><a class="dropdown-item" href="#">Z-A</a></li>
          </ul>
        </div>
      </div>
      
      <% 
        String location = request.getParameter("loc");
        String category = request.getParameter("cat");
        String keyword = request.getParameter("keyword");
        
        jobDAO dao = new jobDAO(DBConnection.getConn());
        List<Jobs> list = null;
        
        if(location != null && category != null && !location.equals("lo") && !category.equals("ca")) {
          list = dao.getJobsORLocationAndCate(location, category);
        } else if (location != null && !location.equals("lo")) {
          list = dao.getJobsORLocation(location);
        } else if (category != null && !category.equals("ca")) {
          list = dao.getJobsORCategory(category);
        } else if (keyword != null && !keyword.trim().isEmpty()) {
          list = dao.searchJobsByKeyword(keyword);
        } else {
          list = dao.getAllJobsForUser();
        }
        
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

<%@ include file="all_component/Footer.jsp" %>

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