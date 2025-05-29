<%@page import ="com.DB.DBConnection" %>
<%@page import ="java.sql.Connection " %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Job Portal - Find Your Dream Job</title>

<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
  .hero-section {
    background: linear-gradient(rgba(66, 84, 191, 0.8), rgba(66, 84, 191, 0.9)), url("img/portal1.png");
    background-size: cover;
    background-position: center;
    min-height: 85vh;
    display: flex;
    align-items: center;
    position: relative;
  }
  
  .hero-content {
    max-width: 800px;
    margin: 0 auto;
  }

  .hero-title {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
  }
  
  .hero-subtitle {
    font-size: 1.2rem;
    margin-bottom: 2rem;
  }
  
  .btn-hero {
    padding: 12px 30px;
    font-size: 1.1rem;
    font-weight: 600;
    margin-right: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
  }
  
  .feature-card {
    border-radius: var(--border-radius);
    overflow: hidden;
    margin-top: -70px;
    z-index: 10;
    position: relative;
    box-shadow: var(--card-shadow);
  }
  
  .feature-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    color: var(--primary-color);
  }
  
  .wave-shape {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
  }
  
  .wave-shape svg {
    position: relative;
    display: block;
    width: calc(100% + 1.3px);
    height: 120px;
    transform: rotateY(180deg);
  }
  
  .wave-shape .shape-fill {
    fill: #FFFFFF;
  }
</style>
</head>
<body>
 
<%@ include file="all_component/navbar.jsp" %>

<section class="hero-section" data-aos="fade-up">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto text-center hero-content text-white">
        <h1 class="hero-title" data-aos="fade-up" data-aos-delay="200">Find Your Dream Job Today</h1>
        <p class="hero-subtitle" data-aos="fade-up" data-aos-delay="300">
          Connect with top employers and land the perfect job opportunity that matches your skills and aspirations.
        </p>
        <div class="d-flex justify-content-center" data-aos="fade-up" data-aos-delay="400">
          <a href="login.jsp" class="btn btn-light rounded-pill btn-hero">
            <i class="fas fa-search me-2"></i>Find Jobs
          </a>
          <a href="Signup.jsp" class="btn btn-outline-light rounded-pill btn-hero">
            <i class="fas fa-user-plus me-2"></i>Join Now
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="wave-shape">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
      <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
    </svg>
  </div>
</section>

<div class="container" data-aos="fade-up">
  <div class="row">
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
      <div class="card feature-card h-100 text-center p-4">
        <div class="card-body">
          <div class="feature-icon">
            <i class="fas fa-search"></i>
          </div>
          <h4>Search Jobs</h4>
          <p class="text-muted">Find thousands of job opportunities from top companies in various industries.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
      <div class="card feature-card h-100 text-center p-4">
        <div class="card-body">
          <div class="feature-icon">
            <i class="fas fa-file-alt"></i>
          </div>
          <h4>Create Profile</h4>
          <p class="text-muted">Build your professional profile to showcase your skills and experience.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="400">
      <div class="card feature-card h-100 text-center p-4">
        <div class="card-body">
          <div class="feature-icon">
            <i class="fas fa-handshake"></i>
          </div>
          <h4>Get Hired</h4>
          <p class="text-muted">Connect with employers and take the next step in your career journey.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>

</body>
</html>