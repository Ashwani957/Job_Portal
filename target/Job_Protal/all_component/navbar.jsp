 <%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <%@ page isELIgnored="false" %>


<nav class="navbar navbar-expand-lg navbar-dark  navbar  bg-custom">
  <a class="navbar-brand" href="#">Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
      <!--Here we write the condition when the role is admin then show this two button otherwise hide it -->
      <c:if test="${userobj.role eq 'admin'}" >
       <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle"></i>Post Job</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-eye"></i>View Job</a>
      </li>
      </c:if> 
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <!-- if user object is not empty then show me Admin and logout button 	  -->
     <c:if test="${userobj.role eq 'admin' }">
    <a href="#" class="btn btn-light  mr-1"><i  class="fas fa-user"></i>Admin </a>
    <a href="logout" class="btn btn-light "> <i class="fas fa-sign-in-alt "></i>Logout</a>
    </c:if> 
     <c:if test="${userobj.role eq 'user' }">
      <!--     data-toggle="modal" data-target="#exampleModal" Here we use it so that we can open the pop window when we click signup  when we click Here then we will open the modal  -->
    <a href="#" class="btn btn-light  mr-1"   data-toggle="modal" data-target="#exampleModal"><i  class="fas fa-user"></i>${userobj.name}
    <a href="logout" class="btn btn-light "> <i class="fas fa-sign-in-alt "></i>Logout</a>
    </a>
    </c:if> 
    <!-- if the user is empty the we show that then we showo the login and signup button  -->
        <c:if test="${empty userobj }">
   
    <a href="login.jsp" class="btn btn-light  mr-1"><i  class="fas fa-sign-in-alt"></i>Login</a>
       <a href="Signup.jsp" class="btn btn-light "> <i class="fa-solid fa-user"></i>Signup</a>
    </c:if>
       
    </form>
  </div>
</nav>
<!-- Modal Menu  -->

<!-- Button trigger modal -->
 <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <div class="card">
      <div class="card-body">
      <div class="text-centre text-primary">
      <i class="fas fa-user-circle fa-3x"></i>
      </div>
      <table class="table">
      <tbody>
      <tr>
      <th scope="row">Name</th>
      	<th>${userobj.name }</th>
      </tr>
      
      <tr>
      
      <th scope="row"> Qualification</th>
      <th>${userobj.qulaification}</th>
      
      </tr>
      
      <tr>
      <th scope="row">Email</th>
		<th>${userobj.email }</th>
		</tr>
      </tbody>
      </table>
      </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>
