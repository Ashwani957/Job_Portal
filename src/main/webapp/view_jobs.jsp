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
<title>Admin View Jobs</title>
  <%@include file="all_component/all_css.jsp"%>
</head>
<body style="#f0f1f2;">


<!--if the user.role is not a admin then  redirect to the login.jsp  -->
<c:if test="${userobj.role ne 'admin' }"> 
  <c:redirect url="login.jsp"></c:redirect>
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

  <% jobDAO dao=new jobDAO(DBConnection.getConn());
 	List<Jobs> list = dao.getAllJobs();
  for(Jobs j : list ){%>
  <!--Here we write all the logic of the card   -->
 <div class="cards mt-2">
<div class="card-body">
<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>
<h6><%=j.getTitle() %></h6>
<p> <%=j.getDescription() %></p>
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

<h6>Publish Date: <%=j.getPdate() %></h6>
<div class="text-center">
<!--Url re-writing  -->
<a href="edit_job.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">Edit</a>
<a href="delete?id=<%=j.getId()%>" class="btn btn-sm bg-danger text-white">Delete</a>
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