<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.jobDAO" %>
<%@ page import ="com.DB.DBConnection" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Filtered Jobs - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .filtered-jobs-header {
    background: linear-gradient(rgba(67, 97, 238, 0.9), rgba(67, 97, 238, 0.8));
    padding: 40px 0;
    color: white;
    margin-bottom: 40px;
  }
  
  .filtered-jobs-title {
    font-weight: 700;
    margin-bottom: 10px;
  }
  
  .filtered-jobs-subtitle {
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
  
  .empty-state {
    text-align: center;
    padding: 60px 0;
    margin: 30px 0;
    background-color: white;
    border-radius: var(--border-radius);
    box-shadow: var(--shadow);
  }
  
  .empty-state-icon {
    font-size: 4rem;
    margin-bottom: 20px;
    color: #e9ecef;
  }
  
  .empty-state-title {
    font-weight: 700;
    color: var(--dark-color);
    margin-bottom: 10px;
  }
  
  .empty-state-subtitle {
    color: var(--gray-color);
    max-width: 500px;
    margin: 0 auto;
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

<!-- Check if user is logged in -->
<c:if test="${empty userobj }"> 
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<!-- Header -->
<div class="filtered-jobs-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="filtered-jobs-title" data-aos="fade-up">Filtered Job Results</h1>
        <p class="filtered-jobs-subtitle" data-aos="fade-up" data-aos-delay="100">
          Jobs matching your selected criteria
        </p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <a href="home.jsp" class="back-link" data-aos="fade-right">
        <i class="fas fa-arrow-left"></i> Back to All Jobs
      </a>
      
      <!-- Job Listing Results -->
      <%
        String loc = request.getParameter("loc");
        String cat = request.getParameter("cat");
        String msg = "";
        jobDAO dao = new jobDAO(DBConnection.getConn());
        List<Jobs> list = null;
        
        if("lo".equals(loc) && "ca".equals(cat)) {
          list = new ArrayList<Jobs>();
          msg = "No jobs match these criteria";
        } else if ("lo".equals(loc) || "ca".equals(cat)) {
          list = dao.getJobsORLocationAndCate(cat, loc);
        } else {
          list = dao.getJobsAndLocationAndCate(cat, loc);
        }
        
        if(list.isEmpty()) {
      %>
        <div class="empty-state" data-aos="fade-up">
          <div class="empty-state-icon">
            <i class="fas fa-search"></i>
          </div>
          <h3 class="empty-state-title text-danger">No Jobs Found</h3>
          <p class="empty-state-subtitle">
            We couldn't find any jobs matching your selected filters. Try adjusting your criteria or check back later.
          </p>
        </div>
      <% } else { 
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
                if(j.getDescription().length() > 0 && j.getDescription().length() < 150) {
                  out.print(j.getDescription());
                } else {
                  out.print(j.getDescription().substring(0, 150) + "...");
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