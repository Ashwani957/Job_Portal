 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@page import="com.DB.DBConnection" %>
 <%@page import="com.dao.jobDAO" %>
 <%@page import="com.entity.Jobs" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<c:if test="${userobj.role ne 'admin' }"> 
  <c:redirect url="login.jsp"></c:redirect>
 </c:if>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
	<%-- 				<c:if test="${not empty succMsg }">
<div class="alert alert-success" role="alert">${succMsg }</div>
<c:remove var="succMsg"/>
</c:if>  --%>



<%
int id =Integer.parseInt(request.getParameter("id"));
jobDAO dao=new jobDAO(DBConnection.getConn());
Jobs j = dao.getAllJobById(id);
%>
						<h5>Edit Jobs</h5>
					</div>

					<form action="updatejobs" method="post">
				
					<input type="hidden" value="<%=j.getId() %>" name="id">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%= j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="odhisha">Odhisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Punjab">Punjab</option>
									<option value="Haryana">Haryana</option>
									<option value="UP">UP</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="category">
									<option value="<%=j.getCategory() %>"> <%=j.getCategory() %></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Sales">Sales</option>
									<option value="Teaching">Teaching</option>
									<option value="Engineer">Engineer</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
								<option class="Active" value=" <%= j.getStatus()%>"><%=j.getStatus() %></option>
									<option class="Active" value="Active">Active</option>
									<option class="InActive" value="InActive">InActive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Descripton </label>
							<textarea required rows="6" cols="" name="desc" 
								class="form-control"><%=j.getDescription() %></textarea>
						</div>
						<button class="btn btn-success">Update JObs</button>
					</form>
				</div>
			</div>
		</div>
	</div>



</body>
</html>