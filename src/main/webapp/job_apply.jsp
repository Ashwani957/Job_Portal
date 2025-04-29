<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.DB.DBConnection" %>
<%@ page import="com.dao.jobDAO" %>
<%@ page import="com.entity.Jobs" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Apply for Job - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .job-apply-header {
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('all_component/img/apply-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 50px 0;
    margin-bottom: 40px;
    text-align: center;
  }
  
  .apply-form-container {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    padding: 30px;
    margin-bottom: 40px;
  }
  
  .section-title {
    font-size: 1.25rem;
    font-weight: bold;
    color: var(--dark-color);
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #eee;
  }
  
  .job-summary {
    background-color: #f9f9f9;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 30px;
  }
  
  .job-summary-title {
    font-weight: 600;
    margin-bottom: 15px;
    color: var(--primary-color);
  }
  
  .job-summary-company {
    color: #6c757d;
    font-size: 0.9rem;
    margin-bottom: 10px;
  }
  
  .job-summary-detail {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    font-size: 0.9rem;
  }
  
  .job-summary-detail i {
    color: var(--primary-color);
    margin-right: 10px;
    width: 20px;
    text-align: center;
  }
  
  .form-section {
    margin-bottom: 30px;
  }
  
  .form-label {
    font-weight: 600;
    color: var(--dark-color);
  }
  
  .form-text {
    color: #6c757d;
    font-size: 0.85rem;
  }
  
  .required-asterisk {
    color: #dc3545;
    margin-left: 3px;
  }
  
  .file-upload-area {
    border: 2px dashed #ddd;
    border-radius: 5px;
    padding: 25px;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-bottom: 15px;
  }
  
  .file-upload-area:hover {
    border-color: var(--primary-color);
  }
  
  .file-upload-icon {
    font-size: 2rem;
    color: var(--primary-color);
    margin-bottom: 10px;
  }
  
  .custom-file-input {
    cursor: pointer;
  }
  
  .submit-btn {
    padding: 12px 30px;
    font-weight: 600;
  }
  
  .success-alert {
    background-color: #d4edda;
    color: #155724;
    border-color: #c3e6cb;
    border-radius: 5px;
    padding: 15px;
    margin-bottom: 20px;
  }
  
  @media (max-width: 767px) {
    .job-apply-header {
      padding: 30px 0;
    }
    
    .apply-form-container {
      padding: 20px;
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

<%
  int id = Integer.parseInt(request.getParameter("id"));
  jobDAO dao = new jobDAO(DBConnection.getConn());
  Jobs j = dao.getJobById(id);
%>

<!-- Page Header -->
<div class="job-apply-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="font-weight-bold" data-aos="fade-up">Apply for Job</h1>
        <p class="lead" data-aos="fade-up" data-aos-delay="100">Complete the form below to submit your application</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-lg-8 mx-auto">
      <!-- Success Messages -->
      <c:if test="${not empty succMsg }">
        <div class="success-alert" role="alert" data-aos="fade-up">
          <i class="fas fa-check-circle mr-2"></i>${succMsg}
        </div>
        <c:remove var="succMsg"/> 
      </c:if>
      
      <!-- Job Summary -->
      <div class="job-summary" data-aos="fade-up">
        <h5 class="job-summary-title">You are applying for: <%= j.getTitle() %></h5>
        <p class="job-summary-company">ABC Corporation</p>
        <div class="job-summary-detail">
          <i class="fas fa-map-marker-alt"></i>
          <span><%= j.getLocation() %></span>
        </div>
        <div class="job-summary-detail">
          <i class="fas fa-briefcase"></i>
          <span><%= j.getCategory() %></span>
        </div>
        <div class="job-summary-detail">
          <i class="fas fa-calendar-alt"></i>
          <span>Posted: <%= j.getPdate().toString() %></span>
        </div>
      </div>
      
      <!-- Application Form -->
      <div class="apply-form-container" data-aos="fade-up">
        <h5 class="section-title">Personal Information</h5>
        
        <form action="submit_application" method="post" enctype="multipart/form-data">
          <input type="hidden" name="job_id" value="<%= j.getId() %>">
          
          <!-- Personal Information Section -->
          <div class="form-section">
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="firstName" class="form-label">First Name<span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
              </div>
              <div class="form-group col-md-6">
                <label for="lastName" class="form-label">Last Name<span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="email" class="form-label">Email<span class="required-asterisk">*</span></label>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
              <div class="form-group col-md-6">
                <label for="phone" class="form-label">Phone Number<span class="required-asterisk">*</span></label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
              </div>
            </div>
            
            <div class="form-group">
              <label for="address" class="form-label">Address</label>
              <input type="text" class="form-control" id="address" name="address">
            </div>
            
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="city" class="form-label">City<span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="city" name="city" required>
              </div>
              <div class="form-group col-md-4">
                <label for="state" class="form-label">State/Province<span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="state" name="state" required>
              </div>
              <div class="form-group col-md-4">
                <label for="zip" class="form-label">Zip/Postal Code<span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="zip" name="zip" required>
              </div>
            </div>
          </div>
          
          <!-- Resume Section -->
          <h5 class="section-title">Resume & Cover Letter</h5>
          <div class="form-section">
            <div class="form-group">
              <label class="form-label">Resume<span class="required-asterisk">*</span></label>
              <small class="form-text d-block mb-2">Upload your resume (PDF, DOC, DOCX only, max 2MB)</small>
              
              <div class="file-upload-area" onclick="document.getElementById('resumeUpload').click()">
                <div class="file-upload-icon">
                  <i class="fas fa-file-upload"></i>
                </div>
                <p class="mb-1">Drag & drop your resume here or click to browse</p>
                <small class="text-muted">Supported formats: PDF, DOC, DOCX (Max 2MB)</small>
                <input type="file" name="resume" id="resumeUpload" class="d-none" accept=".pdf,.doc,.docx" required>
                <p id="selectedResumeFile" class="mt-2 mb-0 font-weight-bold text-primary"></p>
              </div>
            </div>
            
            <div class="form-group">
              <label for="coverLetter" class="form-label">Cover Letter</label>
              <small class="form-text d-block mb-2">Explain why you're a good fit for this position</small>
              <textarea class="form-control" id="coverLetter" name="coverLetter" rows="6"></textarea>
            </div>
          </div>
          
          <!-- Experience Section -->
          <h5 class="section-title">Experience & Education</h5>
          <div class="form-section">
            <div class="form-group">
              <label for="experience" class="form-label">Work Experience<span class="required-asterisk">*</span></label>
              <small class="form-text d-block mb-2">Briefly describe your most relevant work experience</small>
              <textarea class="form-control" id="experience" name="experience" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
              <label for="education" class="form-label">Education<span class="required-asterisk">*</span></label>
              <small class="form-text d-block mb-2">List your educational qualifications</small>
              <textarea class="form-control" id="education" name="education" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
              <label for="skills" class="form-label">Skills<span class="required-asterisk">*</span></label>
              <small class="form-text d-block mb-2">List your relevant skills (separated by commas)</small>
              <input type="text" class="form-control" id="skills" name="skills" required>
            </div>
          </div>
          
          <!-- Additional Information -->
          <h5 class="section-title">Additional Information</h5>
          <div class="form-section">
            <div class="form-group">
              <label for="linkedIn" class="form-label">LinkedIn Profile</label>
              <input type="url" class="form-control" id="linkedIn" name="linkedIn" placeholder="https://www.linkedin.com/in/yourprofile">
            </div>
            
            <div class="form-group">
              <label for="portfolio" class="form-label">Portfolio/Website</label>
              <input type="url" class="form-control" id="portfolio" name="portfolio" placeholder="https://www.yourwebsite.com">
            </div>
            
            <div class="form-group">
              <label for="additionalInfo" class="form-label">Additional Information</label>
              <small class="form-text d-block mb-2">Anything else you'd like us to know?</small>
              <textarea class="form-control" id="additionalInfo" name="additionalInfo" rows="4"></textarea>
            </div>
            
            <div class="form-group form-check mt-4">
              <input type="checkbox" class="form-check-input" id="termsCheck" required>
              <label class="form-check-label" for="termsCheck">
                I certify that all information provided is true and complete to the best of my knowledge<span class="required-asterisk">*</span>
              </label>
            </div>
          </div>
          
          <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary submit-btn">
              <i class="fas fa-paper-plane mr-2"></i>Submit Application
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>

<!-- Custom JS -->
<script>
  // Show selected resume file name
  document.getElementById('resumeUpload').addEventListener('change', function() {
    const fileName = this.files[0]?.name;
    if (fileName) {
      document.getElementById('selectedResumeFile').textContent = fileName;
    }
  });
  
  // Initialize AOS
  AOS.init({
    duration: 800,
    easing: 'ease-in-out',
    once: true
  });
</script>
</body>
</html> 