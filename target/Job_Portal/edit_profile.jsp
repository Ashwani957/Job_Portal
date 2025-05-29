<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Profile - Job Portal</title>
<%@include file="all_component/all_css.jsp"%>
<style>
  .profile-container {
    padding: 60px 0;
    background: linear-gradient(135deg, rgba(240, 241, 242, 0.9) 0%, rgba(232, 235, 240, 0.9) 100%);
  }
  
  .profile-card {
    border: none;
    border-radius: var(--border-radius);
    overflow: hidden;
    box-shadow: var(--card-shadow);
  }
  
  .profile-header {
    padding: 30px 20px;
    text-align: center;
    background: linear-gradient(to right, var(--primary-color), var(--accent-color));
    color: white;
  }
  
  .profile-icon {
    width: 90px;
    height: 90px;
    margin: 0 auto 20px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    color: var(--primary-color);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
  }
  
  .profile-title {
    font-weight: 700;
    margin-bottom: 0;
  }
  
  .profile-body {
    padding: 40px 30px;
  }
  
  .form-group label {
    font-weight: 600;
    color: var(--gray-color);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
  }
  
  .form-group label i {
    margin-right: 8px;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  .profile-button {
    padding: 12px;
    font-weight: 600;
    font-size: 16px;
    margin-top: 15px;
  }
</style>
</head>
<body>
<c:if test="${empty userobj }">
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>

<div class="profile-container">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6" data-aos="fade-up">
        <div class="profile-card">
          <div class="profile-header">
            <div class="profile-icon">
              <i class="fas fa-user-edit"></i>
            </div>
            <h3 class="profile-title">Edit Your Profile</h3>
          </div>
          
          <div class="profile-body">
            <form action="update_profile" method="post">
              <input type="hidden" name="id" value="${userobj.id}">
              
              <div class="form-group">
                <label for="name">
                  <i class="fas fa-user"></i> Full Name
                </label>
                <input type="text" required="required" class="form-control"
                  id="name" name="name" value="${userobj.name}">
              </div>
              
              <div class="form-group">
                <label for="qualification">
                  <i class="fas fa-graduation-cap"></i> Qualification
                </label>
                <input type="text" required="required" class="form-control"
                  id="qualification" name="qua" value="${userobj.qulaification}">
              </div>
              
              <div class="form-group">
                <label for="email">
                  <i class="fas fa-envelope"></i> Email
                </label>
                <input type="email" required="required" class="form-control"
                  id="email" name="email" value="${userobj.email}">
              </div>
              
              <div class="form-group">
                <label for="password">
                  <i class="fas fa-lock"></i> Password
                </label>
                <input required="required" type="password" class="form-control"
                  id="password" name="ps" value="${userobj.password}">
              </div>
              
              <div class="text-center">
                <a href="home.jsp" class="btn btn-secondary rounded-pill me-2">
                  <i class="fas fa-times me-1"></i> Cancel
                </a>
                <button type="submit" class="btn btn-primary rounded-pill profile-button">
                  <i class="fas fa-save me-1"></i> Update Profile
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/Footer.jsp" %>
</body>
</html>