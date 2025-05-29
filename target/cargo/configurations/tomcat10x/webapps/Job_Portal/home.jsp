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
<title>Job Portal - Find Your Dream Job</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  /* Hero Section */
  .hero-section {
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('all_component/img/banner.jpg');
    background-size: cover;
    background-position: center;
    min-height: 500px;
    display: flex;
    align-items: center;
    color: white;
    padding: 80px 0;
  }
  
  .hero-title {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 20px;
  }
  
  .hero-subtitle {
    font-size: 1.5rem;
    margin-bottom: 30px;
    font-weight: 300;
  }
  
  /* Search Box */
  .search-box {
    background: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    margin-top: -50px;
    position: relative;
    z-index: 100;
  }
  
  /* Category Section */
  .category-section {
    padding: 80px 0;
  }
  
  .category-card {
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s, box-shadow 0.3s;
    text-align: center;
    margin-bottom: 30px;
    background: white;
    height: 100%;
  }
  
  .category-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  }
  
  .category-icon {
    width: 70px;
    height: 70px;
    background: var(--primary-color);
    margin: 0 auto 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    color: white;
  }
  
  /* Featured Jobs */
  .featured-section {
    padding: 80px 0;
    background: #f8f9fa;
  }
  
  .job-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 25px;
    padding: 25px;
    transition: transform 0.3s, box-shadow 0.3s;
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
  
  .company-logo {
    width: 70px;
    height: 70px;
    min-width: 70px;
    background: #f5f5f5;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    overflow: hidden;
  }
  
  .company-logo img {
    width: 100%;
    height: 100%;
    object-fit: contain;
  }
  
  .job-title {
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 5px;
    color: var(--dark-color);
  }
  
  .company-name {
    color: var(--primary-color);
    font-weight: 600;
    margin-bottom: 5px;
  }
  
  .job-location {
    color: var(--gray-color);
    font-size: 0.9rem;
  }
  
  .job-tags {
    display: flex;
    flex-wrap: wrap;
    margin: 15px 0;
  }
  
  .job-tag {
    background: #f0f4ff;
    color: var(--primary-color);
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 0.85rem;
    margin-right: 10px;
    margin-bottom: 10px;
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
  
  .job-salary {
    font-weight: 700;
    color: var(--dark-color);
  }
  
  .section-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 15px;
    color: var(--dark-color);
  }
  
  .section-subtitle {
    font-size: 1.1rem;
    color: var(--gray-color);
    margin-bottom: 50px;
    max-width: 700px;
  }
  
  /* Stats Section */
  .stats-section {
    padding: 80px 0;
  }
  
  .stat-card {
    text-align: center;
    padding: 30px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    height: 100%;
  }
  
  .stat-value {
    font-size: 3rem;
    font-weight: 800;
    color: var(--primary-color);
    margin-bottom: 10px;
  }
  
  .stat-label {
    color: var(--gray-color);
    font-size: 1.1rem;
  }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>

<!-- Hero Section -->
<section class="hero-section">
  <div class="container text-center">
    <div class="row justify-content-center">
      <div class="col-md-10" data-aos="fade-up">
        <h1 class="hero-title">Find Your Dream Job Today</h1>
        <p class="hero-subtitle">Discover thousands of job opportunities with all the information you need.</p>
        <a href="jobs.jsp" class="btn btn-primary btn-lg rounded-pill px-4 py-3 fw-bold">
          <i class="fas fa-search me-2"></i>Browse All Jobs
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Search Box -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-10">
      <div class="search-box" data-aos="fade-up">
        <form action="search.jsp" method="GET">
          <div class="row g-3">
            <div class="col-md-5">
              <div class="form-floating">
                <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Job title, keywords, or company">
                <label for="keyword"><i class="fas fa-search me-2"></i>Job title or keyword</label>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-floating">
                <select class="form-select" id="category" name="category">
                  <option selected value="">All Categories</option>
                  <option value="IT">Information Technology</option>
                  <option value="Marketing">Marketing</option>
                  <option value="Design">Design</option>
                  <option value="Finance">Finance</option>
                  <option value="Banking">Banking</option>
                  <option value="Developer">Developer</option>
                  <option value="Engineering">Engineering</option>
                  <option value="Teacher">Teacher</option>
                </select>
                <label for="category"><i class="fas fa-tag me-2"></i>Category</label>
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
</div>

<!-- Category Section -->
<section class="category-section">
  <div class="container text-center">
    <h2 class="section-title" data-aos="fade-up">Popular Categories</h2>
    <p class="section-subtitle mx-auto" data-aos="fade-up">
      Explore jobs by category and find the perfect opportunity in your preferred field
    </p>
    
    <div class="row">
      <div class="col-md-3 col-sm-6" data-aos="fade-up">
        <div class="category-card">
          <div class="category-icon">
            <i class="fas fa-laptop-code"></i>
          </div>
          <h3>Technology</h3>
          <p>124 Jobs Available</p>
          <a href="category.jsp?id=tech" class="btn btn-outline-primary rounded-pill mt-3">View Jobs</a>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6" data-aos="fade-up" data-aos-delay="100">
        <div class="category-card">
          <div class="category-icon">
            <i class="fas fa-chart-line"></i>
          </div>
          <h3>Marketing</h3>
          <p>86 Jobs Available</p>
          <a href="category.jsp?id=marketing" class="btn btn-outline-primary rounded-pill mt-3">View Jobs</a>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6" data-aos="fade-up" data-aos-delay="200">
        <div class="category-card">
          <div class="category-icon">
            <i class="fas fa-palette"></i>
          </div>
          <h3>Design</h3>
          <p>67 Jobs Available</p>
          <a href="category.jsp?id=design" class="btn btn-outline-primary rounded-pill mt-3">View Jobs</a>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6" data-aos="fade-up" data-aos-delay="300">
        <div class="category-card">
          <div class="category-icon">
            <i class="fas fa-money-bill-wave"></i>
          </div>
          <h3>Finance</h3>
          <p>92 Jobs Available</p>
          <a href="category.jsp?id=finance" class="btn btn-outline-primary rounded-pill mt-3">View Jobs</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Featured Jobs -->
<section class="featured-section">
  <div class="container">
    <h2 class="section-title text-center" data-aos="fade-up">Featured Jobs</h2>
    <p class="section-subtitle text-center mx-auto" data-aos="fade-up">
      Handpicked premium positions available for you
    </p>
    
    <div class="row">
      <div class="col-lg-6" data-aos="fade-up">
        <div class="job-card">
          <div class="job-card-header">
            <div class="company-logo">
              <img src="all_component/img/company1.png" alt="Company Logo">
            </div>
            <div>
              <h3 class="job-title">Senior Full Stack Developer</h3>
              <p class="company-name">TechNova Inc.</p>
              <p class="job-location"><i class="fas fa-map-marker-alt me-2"></i>San Francisco, CA (Remote)</p>
            </div>
          </div>
          
          <div class="job-tags">
            <span class="job-tag">JavaScript</span>
            <span class="job-tag">React</span>
            <span class="job-tag">Node.js</span>
            <span class="job-tag">MongoDB</span>
          </div>
          
          <p>Build scalable applications and lead the development team in creating innovative solutions for our clients.</p>
          
          <div class="job-footer">
            <span class="job-type">Full-time</span>
            <span class="job-salary">$120K - $150K/year</span>
          </div>
          
          <a href="one_view.jsp?id=1" class="btn btn-primary rounded-pill w-100 mt-3">View Details</a>
        </div>
      </div>
      
      <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
        <div class="job-card">
          <div class="job-card-header">
            <div class="company-logo">
              <img src="all_component/img/company2.png" alt="Company Logo">
            </div>
            <div>
              <h3 class="job-title">UX/UI Designer</h3>
              <p class="company-name">Designify</p>
              <p class="job-location"><i class="fas fa-map-marker-alt me-2"></i>New York, NY</p>
            </div>
          </div>
          
          <div class="job-tags">
            <span class="job-tag">Figma</span>
            <span class="job-tag">Adobe XD</span>
            <span class="job-tag">Prototyping</span>
            <span class="job-tag">User Research</span>
          </div>
          
          <p>Create beautiful and intuitive user interfaces for web and mobile applications with a focus on user experience.</p>
          
          <div class="job-footer">
            <span class="job-type">Full-time</span>
            <span class="job-salary">$90K - $110K/year</span>
          </div>
          
          <a href="one_view.jsp?id=2" class="btn btn-primary rounded-pill w-100 mt-3">View Details</a>
        </div>
      </div>
      
      <div class="col-lg-6" data-aos="fade-up">
        <div class="job-card">
          <div class="job-card-header">
            <div class="company-logo">
              <img src="all_component/img/company3.png" alt="Company Logo">
            </div>
            <div>
              <h3 class="job-title">Marketing Manager</h3>
              <p class="company-name">GrowthGenius</p>
              <p class="job-location"><i class="fas fa-map-marker-alt me-2"></i>Chicago, IL</p>
            </div>
          </div>
          
          <div class="job-tags">
            <span class="job-tag">Digital Marketing</span>
            <span class="job-tag">SEO</span>
            <span class="job-tag">Content Strategy</span>
            <span class="job-tag">Analytics</span>
          </div>
          
          <p>Lead marketing initiatives to drive brand awareness and customer acquisition through multiple channels.</p>
          
          <div class="job-footer">
            <span class="job-type">Full-time</span>
            <span class="job-salary">$85K - $105K/year</span>
          </div>
          
          <a href="one_view.jsp?id=3" class="btn btn-primary rounded-pill w-100 mt-3">View Details</a>
        </div>
      </div>
      
      <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
        <div class="job-card">
          <div class="job-card-header">
            <div class="company-logo">
              <img src="all_component/img/company4.png" alt="Company Logo">
            </div>
            <div>
              <h3 class="job-title">Data Scientist</h3>
              <p class="company-name">DataVision Analytics</p>
              <p class="job-location"><i class="fas fa-map-marker-alt me-2"></i>Boston, MA (Hybrid)</p>
            </div>
          </div>
          
          <div class="job-tags">
            <span class="job-tag">Python</span>
            <span class="job-tag">Machine Learning</span>
            <span class="job-tag">SQL</span>
            <span class="job-tag">Data Visualization</span>
          </div>
          
          <p>Analyze complex datasets and build predictive models to uncover insights and drive business decisions.</p>
          
          <div class="job-footer">
            <span class="job-type">Full-time</span>
            <span class="job-salary">$110K - $140K/year</span>
          </div>
          
          <a href="one_view.jsp?id=4" class="btn btn-primary rounded-pill w-100 mt-3">View Details</a>
        </div>
      </div>
    </div>
    
    <div class="text-center mt-5" data-aos="fade-up">
      <a href="jobs.jsp" class="btn btn-outline-primary btn-lg rounded-pill px-5 py-3 fw-bold">
        <i class="fas fa-briefcase me-2"></i>View All Jobs
      </a>
    </div>
  </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
  <div class="container text-center">
    <h2 class="section-title" data-aos="fade-up">Our Statistics</h2>
    <p class="section-subtitle mx-auto" data-aos="fade-up">
      We've helped thousands of job seekers find their dream positions
    </p>
    
    <div class="row">
      <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up">
        <div class="stat-card">
          <div class="stat-value">5,234+</div>
          <div class="stat-label">Jobs Posted</div>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="100">
        <div class="stat-card">
          <div class="stat-value">3,789+</div>
          <div class="stat-label">Active Users</div>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="200">
        <div class="stat-card">
          <div class="stat-value">1,126+</div>
          <div class="stat-label">Companies</div>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="300">
        <div class="stat-card">
          <div class="stat-value">2,579+</div>
          <div class="stat-label">Successful Hires</div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>