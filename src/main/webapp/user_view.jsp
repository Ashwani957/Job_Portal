  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.jobDAO" %>
    <%@ page import ="com.DB.DBConnection" %>
    <%@ page import="com.entity.Jobs" %>
    <%@ page import="java.util.List" %>
     <%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <%@ page isELIgnored="false" %>
	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> View Jobs</title>
  <%@include file="all_component/all_css.jsp"%>
</head>
<body style="#f0f1f2;">


<c:if test="${empty userobj }">
<c.redirect url="login.jsp">
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-12">
<h5 class="text-center text-primary">All Jobs</h5>



<c:if test="${not empty succMsg }">
<div class="alert alert-success" role="alert">${succMsg }</div>
<c:remove var="succMsg"/> 
</c:if> 

	<div class="card">
	
	 <div class="card-body">
	 
	 <form class="form-inline " action="more_view.jsp" method="get">
	 <div class="form-group col-me-5 mt-1">
	 <h5>Location</h5>
	 </div>
	 
	 <div class="form-group col-md-4 mt-1">
	 <h5>Category</h5>
	 </div>
	 
	 <div class="form-group col-md-5">
	 <select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
	 <option selected value="lo">Choose...</option>
	 <option value="Odisha">Odisha</option>
	 <option value="Jharkhand">Jharkhand</option>
	 <option value="Gujrat">Gujrat</option>
	 <option value="bhubaneswar">Bhubaneswar</option>
	 <option value="Delhi">Delhi</option>
	 <option value="Banglore">Banglore</option>
	 <option value="Chennai">Chennai</option>
	 
	 
	 </select>
	 
	 
	 </div>
	 
	 <div class="form-group col-md-5">
	 <select class="custom-select" id="inlineFormsCustomSelectPref" name="cat">
	 <option value="ca" selected>Choose...</option>
	 <option value="IT">IT</option>
	 <option  value="Developer">Developer</option>
	 <option value="Banking">Banking</option>
	 <option value="Engineering">Engineering</option>
	 <option value="Teacher">Teacher</option>
	 </select>
	 </div>
	 <button class="btn btn-success">Submit</button>
	 </form>
	 </div>
	</div>
  <% jobDAO dao=new jobDAO(DBConnection.getConn());
 	List<Jobs> list = dao.getAllJobsForUser();
  for(Jobs j : list ){%>
  <!--Here we write all the logic of the card   -->
 <div class="cards mt-2">
<div class="card-body">
<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>
<h6><%=j.getTitle() %></h6>


<%
if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
%>
    <p><%= j.getDescription() %></p>
<%
} else {
%>
    <p><%= j.getDescription().substring(0, 120) %>.....</p>
<%
}
%>
<!-- Name and category  -->

<br>	
<div class="form-row">
<div class="form-group col-md-3">

<!--Here we use the dynamic value of location , category , status   -->
<input type="text" class="form-control form-control-sm" value="Location: <%=j.getLocation() %>" readonly>
</div>

<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" value="category:<%=j.getCategory() %>" readonly >
</div>

<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" value="Status:<%=j.getStatus() %>" readonly >
</div>
</div>

<h6>Publish Date: <%=j.getPdate().toString() %></h6>
<div class="text-center">
<!--Url re-writing  -->
<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View More...</a>
 
</div>
</div>
</div>
 <% }
  %>
</div>
</div>
</div>
</body>
</html>