<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Signup - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .signup-container {
    padding: 80px 0;
    min-height: calc(100vh - 200px);
    display: flex;
    align-items: center;
  }
  
  .signup-card {
    border: none;
    border-radius: var(--border-radius);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
    overflow: hidden;
    padding: 0;
  }
  
  .signup-form {
    padding: 40px;
  }
  
  .signup-image {
    background-image: linear-gradient(rgba(58, 12, 163, 0.85), rgba(58, 12, 163, 0.85)), url('img/signup-bg.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px;
    color: white;
    text-align: center;
    min-height: 100%;
  }
  
  .signup-image h3 {
    font-weight: 700;
    margin-bottom: 24px;
    font-size: 2rem;
  }
  
  .signup-image p {
    font-size: 1.1rem;
    opacity: 0.9;
    margin-bottom: 32px;
    line-height: 1.6;
  }
  
  .signup-title {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 16px;
    color: var(--dark-color);
  }
  
  .signup-subtitle {
    color: var(--gray-color);
    margin-bottom: 32px;
    font-size: 1.1rem;
  }
  
  .form-label {
    font-weight: 600;
    margin-bottom: 8px;
    color: var(--dark-color);
  }
  
  .form-control {
    height: 50px;
    font-size: 1rem;
  }
  
  .input-group-text {
    background-color: white;
    border-left: none;
    padding-left: 0;
  }
  
  .signup-btn {
    height: 56px;
    font-size: 1.1rem;
    font-weight: 600;
    margin-top: 16px;
  }
  
  .divider {
    margin: 32px 0;
    display: flex;
    align-items: center;
    text-align: center;
  }
  
  .divider::before,
  .divider::after {
    content: '';
    flex: 1;
    border-bottom: 1px solid #e0e0e0;
  }
  
  .divider span {
    padding: 0 16px;
    color: var(--gray-color);
  }
  
  .social-signup {
    display: flex;
    gap: 16px;
    margin-bottom: 32px;
  }
  
  .social-btn {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 12px;
    border-radius: var(--border-radius);
    border: 1px solid #e0e0e0;
    background: white;
    font-size: 1.25rem;
    color: #666;
    transition: all 0.3s ease;
  }
  
  .social-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  }
  
  .social-btn.google:hover {
    color: #DB4437;
  }
  
  .social-btn.facebook:hover {
    color: #4267B2;
  }
  
  .social-btn.twitter:hover {
    color: #1DA1F2;
  }
  
  .login-link {
    text-align: center;
    margin-top: 32px;
    font-size: 1.05rem;
  }
  
  .check-field {
    margin-bottom: 24px;
    display: flex;
    align-items: center;
  }
  
  .check-field label {
    margin-left: 10px;
    margin-bottom: 0;
    cursor: pointer;
  }
  
  .custom-checkbox {
    width: 20px;
    height: 20px;
    cursor: pointer;
  }
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<div class="signup-container">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div class="card signup-card">
          <div class="row no-gutters">
            <div class="col-md-6 d-none d-md-block">
              <div class="signup-image">
                <div>
                  <h3>Join Our Job Portal Community</h3>
                  <p>Create an account to access thousands of job opportunities, connect with employers, and manage your job applications in one place.</p>
                  <a href="index.jsp" class="btn btn-light rounded-pill px-4 py-2">Explore Jobs</a>
                </div>
              </div>
            </div>
            
            <div class="col-md-6">
              <div class="signup-form">
                <h2 class="signup-title">Create an Account</h2>
                <p class="signup-subtitle">Sign up to access job opportunities and connect with employers</p>
                
                <c:if test="${not empty succMsg}">
                  <div class="alert alert-success" role="alert">
                    ${succMsg}
                    <c:remove var="succMsg" />
                  </div>
                </c:if>
                
                <c:if test="${not empty failedMsg}">
                  <div class="alert alert-danger" role="alert">
                    ${failedMsg}
                    <c:remove var="failedMsg" />
                  </div>
                </c:if>
                
                <form action="user_register" method="post">
                  <div class="mb-3">
                    <label for="inputName" class="form-label">Full Name</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="inputName" name="name" required>
                      <span class="input-group-text">
                        <i class="fas fa-user"></i>
                      </span>
                    </div>
                  </div>
                  
                  <div class="mb-3">
                    <label for="inputQualification" class="form-label">Qualification</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="inputQualification" name="qualification" required>
                      <span class="input-group-text">
                        <i class="fas fa-graduation-cap"></i>
                      </span>
                    </div>
                  </div>
                  
                  <div class="mb-3">
                    <label for="inputEmail" class="form-label">Email address</label>
                    <div class="input-group">
                      <input type="email" class="form-control" id="inputEmail" name="email" required>
                      <span class="input-group-text">
                        <i class="fas fa-envelope"></i>
                      </span>
                    </div>
                  </div>
                  
                  <div class="mb-3">
                    <label for="inputPassword" class="form-label">Password</label>
                    <div class="input-group">
                      <input type="password" class="form-control" id="inputPassword" name="ps" required>
                      <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                      </span>
                    </div>
                  </div>
                  
                  <div class="check-field">
                    <input type="checkbox" class="custom-checkbox" id="check" name="check">
                    <label for="check">I agree to the <a href="#" class="text-decoration-none">Terms of Service</a> and <a href="#" class="text-decoration-none">Privacy Policy</a></label>
                  </div>
                  
                  <button type="submit" class="btn btn-primary rounded-pill w-100 signup-btn">Sign Up</button>
                </form>
                
                <div class="divider">
                  <span>OR</span>
                </div>
                
                <div class="social-signup">
                  <button class="social-btn google">
                    <i class="fab fa-google"></i>
                  </button>
                  <button class="social-btn facebook">
                    <i class="fab fa-facebook-f"></i>
                  </button>
                  <button class="social-btn twitter">
                    <i class="fab fa-twitter"></i>
                  </button>
                </div>
                
                <div class="login-link">
                  Already have an account? <a href="login.jsp" class="text-decoration-none fw-bold">Login now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="all_component/Footer.jsp"%>
</body>
</html>