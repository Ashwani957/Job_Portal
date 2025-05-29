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
<title>Job Details - Job Portal</title>
  <%@include file="all_component/all_css.jsp"%>
<style>
  .job-header {
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('all_component/img/job-detail-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 50px 0;
    margin-bottom: 40px;
    text-align: center;
  }
  
  .job-detail-card {
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 30px;
  }
  
  .job-banner {
    background: linear-gradient(135deg, var(--primary-color), #4d94ff);
    padding: 25px;
    display: flex;
    align-items: center;
  }
  
  .company-logo {
    width: 90px;
    height: 90px;
    background: white;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    font-size: 2.5rem;
    color: var(--primary-color);
  }
  
  .job-title-area h4 {
    color: white;
    font-weight: bold;
    margin-bottom: 5px;
  }
  
  .job-company-name {
    color: rgba(255, 255, 255, 0.9);
    font-weight: 600;
    margin-bottom: 5px;
  }
  
  .job-location {
    color: rgba(255, 255, 255, 0.8);
    font-size: 0.9rem;
    display: flex;
    align-items: center;
  }
  
  .job-location i {
    margin-right: 5px;
  }
  
  .job-detail-body {
    padding: 30px;
  }
  
  .job-info-list {
    margin-bottom: 30px;
    background-color: #f9f9f9;
    border-radius: 10px;
    padding: 20px;
  }
  
  .job-info-item {
    display: flex;
    margin-bottom: 15px;
    border-bottom: 1px solid #eee;
    padding-bottom: 15px;
  }
  
  .job-info-item:last-child {
    margin-bottom: 0;
    border-bottom: none;
    padding-bottom: 0;
  }
  
  .job-info-label {
    min-width: 120px;
    font-weight: 600;
    color: var(--dark-color);
  }
  
  .job-info-value {
    color: var(--gray-color);
  }
  
  .job-tag {
    background: #f0f4ff;
    color: var(--primary-color);
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    display: inline-block;
    margin-right: 8px;
    margin-bottom: 8px;
  }
  
  .section-title {
    font-size: 1.25rem;
    font-weight: bold;
    color: var(--dark-color);
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #eee;
  }
  
  .apply-card {
    padding: 30px;
    border-radius: 10px;
    border: 1px solid #eee;
  }
  
  .action-btn {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    font-weight: 600;
  }
  
  .action-btn i {
    margin-right: 8px;
  }
  
  .job-description {
    color: #6c757d;
    line-height: 1.7;
    margin-bottom: 30px;
  }
  
  .quick-info {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    margin-bottom: 25px;
  }
  
  .quick-info-item {
    display: flex;
    align-items: center;
    background: #f8f9fa;
    padding: 10px 15px;
    border-radius: 5px;
    font-size: 0.9rem;
  }
  
  .quick-info-item i {
    margin-right: 8px;
    color: var(--primary-color);
    font-size: 1.1rem;
  }
  
  @media (max-width: 767px) {
    .job-banner {
      flex-direction: column;
      text-align: center;
    }
    
    .company-logo {
      margin-right: 0;
      margin-bottom: 15px;
    }
  }
</style>
</head>
<body style="background-color: #f8f9fa;">

<!-- Check if user is logged in -->
<c:if test="${empty userobj }">
  <c:redirect url="login.jsp" />
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<%
  int id = Integer.parseInt(request.getParameter("id"));
  jobDAO dao = new jobDAO(DBConnection.getConn());
  Jobs j = dao.getjobById(id);
%>

<!-- Page Header -->
<div class="job-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="font-weight-bold" data-aos="fade-up">Job Details</h1>
        <p class="lead" data-aos="fade-up" data-aos-delay="100">Find out more about this job opportunity</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-8 mb-4">
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
      
      <!-- Job Detail Card -->
      <div class="job-detail-card" data-aos="fade-up">
        <div class="job-banner">
          <div class="company-logo">
            <i class="fas fa-building"></i>
          </div>
          <div class="job-title-area">
            <h4><%= j.getTitle() %></h4>
            <p class="job-company-name">ABC Corporation</p>
            <p class="job-location"><i class="fas fa-map-marker-alt"></i> <%= j.getLocation() %></p>
          </div>
        </div>
        
        <div class="job-detail-body">
          <!-- Quick Info -->
          <div class="quick-info">
            <div class="quick-info-item">
              <i class="fas fa-briefcase"></i>
              <span><strong>Category:</strong> <%= j.getCategory() %></span>
            </div>
            <div class="quick-info-item">
              <i class="fas fa-clock"></i>
              <span><strong>Job Type:</strong> Full-time</span>
            </div>
            <div class="quick-info-item">
              <i class="fas fa-calendar-alt"></i>
              <span><strong>Posted:</strong> <%= j.getPdate().toString() %></span>
            </div>
            <div class="quick-info-item">
              <i class="fas fa-info-circle"></i>
              <span><strong>Status:</strong> <%= j.getStatus() %></span>
            </div>
          </div>
          
          <!-- Job Description -->
          <h5 class="section-title">Job Description</h5>
          <div class="job-description">
            <%= j.getDescription() %>
          </div>
          
          <!-- Job Information -->
          <h5 class="section-title">Job Information</h5>
          <div class="job-info-list">
            <div class="job-info-item">
              <div class="job-info-label">Job Title</div>
              <div class="job-info-value"><%= j.getTitle() %></div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Location</div>
              <div class="job-info-value"><%= j.getLocation() %></div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Category</div>
              <div class="job-info-value"><%= j.getCategory() %></div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Status</div>
              <div class="job-info-value"><%= j.getStatus() %></div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Posted Date</div>
              <div class="job-info-value"><%= j.getPdate().toString() %></div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Experience</div>
              <div class="job-info-value">2+ years</div>
            </div>
            <div class="job-info-item">
              <div class="job-info-label">Salary</div>
              <div class="job-info-value">Negotiable</div>
            </div>
          </div>
          
          <!-- Skills Required -->
          <h5 class="section-title">Skills Required</h5>
          <div class="mb-4">
            <span class="job-tag">Communication</span>
            <span class="job-tag">Team Work</span>
            <span class="job-tag">Problem Solving</span>
            <span class="job-tag">Creativity</span>
            <span class="job-tag">Adaptability</span>
            <% if (j.getCategory().equals("IT") || j.getCategory().equals("Developer")) { %>
              <span class="job-tag">Java</span>
              <span class="job-tag">Spring Boot</span>
              <span class="job-tag">HTML/CSS</span>
              <span class="job-tag">JavaScript</span>
              <span class="job-tag">SQL</span>
            <% } else if (j.getCategory().equals("Banking")) { %>
              <span class="job-tag">Finance</span>
              <span class="job-tag">Accounting</span>
              <span class="job-tag">Risk Management</span>
            <% } else if (j.getCategory().equals("Teacher")) { %>
              <span class="job-tag">Teaching</span>
              <span class="job-tag">Curriculum Development</span>
              <span class="job-tag">Student Assessment</span>
            <% } %>
          </div>
          
          <!-- Company Information -->
          <h5 class="section-title">About the Company</h5>
          <p class="job-description">
            ABC Corporation is a leading company in the <%= j.getCategory() %> industry, known for its innovative approach and excellent work environment. We are committed to creating a diverse and inclusive workplace where employees can thrive and grow professionally.
          </p>
          
          <!-- How to Apply -->
          <h5 class="section-title">How to Apply</h5>
          <p class="job-description">
            To apply for this position, please click the "Apply Now" button and follow the instructions. Make sure to include your updated resume and a cover letter explaining why you're a good fit for this role.
          </p>
        </div>
      </div>
    </div>
    
    <!-- Sidebar -->
    <div class="col-lg-4">
      <div class="apply-card" data-aos="fade-up">
        <h5 class="font-weight-bold mb-4">Apply for this job</h5>
        <a href="#" class="btn btn-primary action-btn"><i class="fas fa-paper-plane"></i> Apply Now</a>
        <a href="#" class="btn btn-outline-primary action-btn"><i class="far fa-bookmark"></i> Save Job</a>
        <a href="#" class="btn btn-outline-secondary action-btn"><i class="fas fa-share-alt"></i> Share Job</a>
        
        <hr class="my-4">
        
        <h6 class="font-weight-bold mb-3">Job Overview</h6>
        <ul class="list-unstyled">
          <li class="mb-3">
            <i class="fas fa-calendar-alt mr-2 text-primary"></i> 
            Posted: <%= j.getPdate().toString() %>
          </li>
          <li class="mb-3">
            <i class="fas fa-map-marker-alt mr-2 text-primary"></i> 
            Location: <%= j.getLocation() %>
          </li>
          <li class="mb-3">
            <i class="fas fa-briefcase mr-2 text-primary"></i> 
            Job Type: Full-time
          </li>
          <li class="mb-3">
            <i class="fas fa-graduation-cap mr-2 text-primary"></i> 
            Experience: 2+ years
          </li>
          <li class="mb-3">
            <i class="fas fa-user-tie mr-2 text-primary"></i> 
            Positions: 2
          </li>
          <li>
            <i class="fas fa-dollar-sign mr-2 text-primary"></i> 
            Salary: Negotiable
          </li>
        </ul>
        
        <hr class="my-4">
        
        <h6 class="font-weight-bold mb-3">Contact Information</h6>
        <ul class="list-unstyled">
          <li class="mb-3">
            <i class="fas fa-envelope mr-2 text-primary"></i> 
            Email: info@abccorp.com
          </li>
          <li class="mb-3">
            <i class="fas fa-phone mr-2 text-primary"></i> 
            Phone: +1 (123) 456-7890
          </li>
          <li>
            <i class="fas fa-globe mr-2 text-primary"></i> 
            Website: www.abccorp.com
          </li>
        </ul>
      </div>
      
      <div class="card mt-4" data-aos="fade-up" data-aos-delay="100">
        <div class="card-body">
          <h5 class="font-weight-bold mb-3">Similar Jobs</h5>
          <div class="media mb-3 pb-3 border-bottom">
            <div class="mr-3 text-primary">
              <i class="fas fa-briefcase fa-2x"></i>
            </div>
            <div class="media-body">
              <h6 class="mt-0 mb-1">Software Developer</h6>
              <p class="text-muted small mb-2">XYZ Technologies</p>
              <span class="badge badge-light">Full-time</span>
            </div>
          </div>
          <div class="media mb-3 pb-3 border-bottom">
            <div class="mr-3 text-primary">
              <i class="fas fa-briefcase fa-2x"></i>
            </div>
            <div class="media-body">
              <h6 class="mt-0 mb-1">Web Designer</h6>
              <p class="text-muted small mb-2">Design Studio Inc.</p>
              <span class="badge badge-light">Part-time</span>
            </div>
          </div>
          <div class="media">
            <div class="mr-3 text-primary">
              <i class="fas fa-briefcase fa-2x"></i>
            </div>
            <div class="media-body">
              <h6 class="mt-0 mb-1">UI/UX Designer</h6>
              <p class="text-muted small mb-2">Creative Solutions</p>
              <span class="badge badge-light">Remote</span>
            </div>
          </div>
          <div class="text-center mt-3">
            <a href="jobs.jsp" class="btn btn-outline-primary btn-sm">View All Jobs</a>
          </div>
        </div>
      </div>
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