<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login - Job Portal</title>
<%@include file="all_component/all_css.jsp" %>
<style>
  .login-container {
    min-height: 85vh;
    display: flex;
    align-items: center;
    background: linear-gradient(135deg, rgba(240, 241, 242, 0.9) 0%, rgba(232, 235, 240, 0.9) 100%);
  }
  
  .login-card {
    border: none;
    border-radius: var(--border-radius);
    box-shadow: var(--card-shadow);
    overflow: hidden;
  }
  
  .login-header {
    padding: 30px 20px;
    text-align: center;
    position: relative;
    background: linear-gradient(to right, var(--primary-color), var(--accent-color));
  }
  
  .login-header h3 {
    color: white;
    margin-bottom: 0;
    font-weight: 700;
  }
  
  .login-header-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto 20px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    color: var(--primary-color);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
  }
  
  .login-form {
    padding: 40px 30px;
  }
  
  .form-group label {
    font-weight: 600;
    color: var(--gray-color);
    margin-bottom: 8px;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  .login-button {
    padding: 12px;
    font-weight: 600;
    font-size: 16px;
    margin-top: 10px;
  }
  
  .signup-link {
    text-align: center;
    margin-top: 20px;
    font-weight: 500;
  }
  
  .signup-link a {
    color: var(--primary-color);
    text-decoration: none;
    font-weight: 600;
  }
  
  .alert {
    border-radius: var(--border-radius);
    font-weight: 500;
  }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>

<div class="login-container">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-5" data-aos="fade-up">
        <div class="login-card">
          <div class="login-header">
            <div class="login-header-icon">
              <i class="fas fa-user"></i>
            </div>
            <h3>User Login</h3>
          </div>
          
          <div class="login-form">
            <c:if test="${not empty succMsg }">
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${succMsg}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <c:remove var="succMsg"/>
            </c:if>
            
            <form action="login" method="post">
              <div class="form-group">
                <label for="email"><i class="fas fa-envelope me-2"></i>Email Address</label>
                <input type="email" required="required" 
                class="form-control" id="email" aria-describedby="emailHelp" name="em" 
                placeholder="Enter your email">
              </div>
              
              <div class="form-group">
                <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                <input required="required" type="password" class="form-control" id="password" 
                name="ps" placeholder="Enter your password">
              </div>
              
              <button type="submit" class="btn btn-primary btn-block rounded-pill login-button">
                <i class="fas fa-sign-in-alt me-2"></i>Login
              </button>
            </form>
            
            <div class="signup-link">
              Don't have an account? <a href="Signup.jsp">Sign Up</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>