<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom shadow-sm sticky-top">
  <div class="container">
    <!-- For non-logged in users, brand links to index.jsp -->
    <c:if test="${empty userobj}">
      <a class="navbar-brand" href="index.jsp">
        <i class="fa-solid fa-briefcase me-2"></i>Job Portal
      </a>
    </c:if>
    
    <!-- For logged-in users, brand links to home.jsp -->
    <c:if test="${not empty userobj}">
      <a class="navbar-brand" href="home.jsp">
        <i class="fa-solid fa-briefcase me-2"></i>Job Portal
      </a>
    </c:if>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <!-- Home link logic - changes based on login status -->
        <c:choose>
          <c:when test="${empty userobj}">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item active">
              <a class="nav-link" href="home.jsp"><i class="fas fa-home me-1"></i> Home</a>
            </li>
          </c:otherwise>
        </c:choose>
        
        <!-- Admin section -->
        <c:if test="${userobj.role eq 'admin'}" >
          <li class="nav-item">
            <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle me-1"></i> Post Job</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-list me-1"></i> View Jobs</a>
          </li>
        </c:if> 
        
        <!-- Jobs link for all users -->
        <li class="nav-item">
          <a class="nav-link" href="jobs.jsp"><i class="fas fa-briefcase me-1"></i> Browse Jobs</a>
        </li>
      </ul>
      <div class="form-inline my-2 my-lg-0">
        <!-- Admin buttons -->
        <c:if test="${userobj.role eq 'admin' }">
          <a href="#" class="btn btn-light me-2 rounded-pill">
            <i class="fas fa-user-shield me-1"></i> Admin
          </a>
          <a href="logout" class="btn btn-light rounded-pill">
            <i class="fas fa-sign-out-alt me-1"></i> Logout
          </a>
        </c:if> 
        
        <!-- User buttons -->
        <c:if test="${userobj.role eq 'user' }">
          <a href="#" class="btn btn-light me-2 rounded-pill" data-toggle="modal" data-target="#exampleModal">
            <i class="fas fa-user me-1"></i> ${userobj.name}
          </a>
          <a href="logout" class="btn btn-light rounded-pill">
            <i class="fas fa-sign-out-alt me-1"></i> Logout
          </a>
        </c:if> 
        
        <!-- Anonymous user buttons -->
        <c:if test="${empty userobj }">
          <a href="login.jsp" class="btn btn-light me-2 rounded-pill">
            <i class="fas fa-sign-in-alt me-1"></i> Login
          </a>
          <a href="Signup.jsp" class="btn btn-light rounded-pill">
            <i class="fa-solid fa-user-plus me-1"></i> Signup
          </a>
        </c:if>
      </div>
    </div>
  </div>
</nav>

<!-- User Profile Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
          <i class="fas fa-user-circle me-2"></i>User Profile
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card border-0 shadow-none">
          <div class="card-body">
            <div class="text-center text-primary mb-4">
              <i class="fas fa-user-circle fa-5x"></i>
              <h4 class="mt-3">${userobj.name}</h4>
            </div>
            <div class="table-responsive">
              <table class="table table-hover">
                <tbody>
                  <tr>
                    <th scope="row"><i class="fas fa-user me-2"></i>Name</th>
                    <td>${userobj.name}</td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fas fa-graduation-cap me-2"></i>Qualification</th>
                    <td>${userobj.qulaification}</td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fas fa-envelope me-2"></i>Email</th>
                    <td>${userobj.email}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary rounded-pill" data-dismiss="modal">Close</button>
        <a href="edit_profile.jsp" class="btn btn-primary rounded-pill">Edit Profile</a>
      </div>
    </div>
  </div>
</div>
