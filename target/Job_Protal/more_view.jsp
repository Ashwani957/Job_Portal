  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.jobDAO" %>
     
    <%@ page import ="com.DB.DBConnection" %>
    <%@ page import="com.entity.Jobs" %>
    <%@ page import="java.util.List" %>
     <%@ taglib uri="jakarta.tags.core" prefix="c" %>
     <%@ page import="java.util.*" %>
 <%@ page isELIgnored="false" %>
	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:View Jobs</title>
  <%@include file="all_component/all_css.jsp"%>
</head>
<body style="#f0f1f2;">


<!-- Do not uncomment for this   -->
 
 <!-- if the userobje is not empty then the container will be run otherwise the below code will be run   -->
	
  <c:if test="${empty userobj }"> 
  <c:redirect url="login.jsp"></c:redirect>
 </c:if> 
  

<%@ include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-12">
<h5 class="text-center text-primary">All Jobs</h5>

<!--From home.jsp we get the location and category   -->
	<%
	 String loc=request.getParameter("loc");
	String cat=request.getParameter("cat");
	String msg="";
	jobDAO dao=new jobDAO(DBConnection.getConn());
	 List<Jobs> list =null ; 
	if("lo".equals(loc)&& "ca".equals(cat)){
	 list=new ArrayList<Jobs>();
	 msg="Job Not available";
	}
	 
	else if ("lo".equals(loc)||"ca".equals(cat)) {
		list=dao.getJobsORLocationAndCate(cat,loc);	 
	}
	
	/* IN else will be execute when both the category and location will be selected  */
	else{
		list= dao.getJobsAndLocationAndCate(cat,loc);
	}
 /*   If list is empty then show that job not available*/
 	
 if(list.isEmpty()){
	 %>
	 <h4 class="text-center text-danger">Job Not Available</h4>
	 
	 <%
 }
 
 if(list!=null){
	 
	 // Here we print all the value 
	 for(Jobs j : list){
		 %>
		 
		 <div class="cards mt-5">
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

 
</div>

<h6>Publish Date: <%=j.getPdate().toString() %></h6>
<div class="text-center">
<!--Url re-writing  -->
<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View</a>
 
</div>
</div>
</div>

<%
  }
 }
 else {
	 %>
	 <h4 class="text-center text-danger"><%=msg %></h4>
	 <%
 }
 %>
<!-- <h5 class="text-center text-primary">All Jobs</h5> -->

</div>
</div>
</div>
</body>
</html>