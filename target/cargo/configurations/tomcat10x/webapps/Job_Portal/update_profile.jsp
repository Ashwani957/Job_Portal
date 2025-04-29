<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Profile Updated - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .success-container {
    min-height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, rgba(240, 241, 242, 0.9) 0%, rgba(232, 235, 240, 0.9) 100%);
    padding: 40px 0;
  }
  
  .success-card {
    background: white;
    border-radius: var(--border-radius);
    box-shadow: var(--card-shadow);
    padding: 40px;
    text-align: center;
    max-width: 500px;
    width: 100%;
  }
  
  .success-icon {
    width: 100px;
    height: 100px;
    background: var(--primary-color);
    margin: 0 auto 30px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 3rem;
    color: white;
  }
  
  .success-title {
    font-size: 2rem;
    font-weight: 700;
    color: var(--dark-color);
    margin-bottom: 15px;
  }
  
  .success-text {
    color: var(--gray-color);
    margin-bottom: 30px;
    font-size: 1.1rem;
  }
  
  .action-button {
    margin: 5px;
    padding: 10px 25px;
    font-weight: 600;
  }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>

<div class="success-container">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="success-card" data-aos="zoom-in">
          <div class="success-icon">
            <i class="fas fa-check"></i>
          </div>
          <h1 class="success-title">Profile Updated</h1>
          <p class="success-text">
            Your profile has been updated successfully. The changes have been saved to your account.
          </p>
          <div>
            <a href="home.jsp" class="btn btn-primary rounded-pill action-button">
              <i class="fas fa-home me-2"></i>Go to Home
            </a>
            <a href="edit_profile.jsp" class="btn btn-outline-primary rounded-pill action-button">
              <i class="fas fa-user-edit me-2"></i>Back to Profile
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>