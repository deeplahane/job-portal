<%@page import="com.dao.JobDAO"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false"%>
<%@page import="com.entities.Jobs"%>
<%@page import="com.entities.Message"%>
<%@page import="com.connect.Connector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<%@ include file="components/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
</head>
<body style="background-color: #F2F3F5;">
<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>	
</c:if>
	<div class="container-fluid  login-container">
		<div class="row pb-4">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header text-center">
						<h3>
							<i class="fa-solid fa-pen-to-square"></i> Edit Job
						</h3>
					</div>
					<%
					Message msg = (Message) session.getAttribute("msg");
					if (msg != null) {
					%>
					<div class="alert <%=msg.getCssClass()%>" role="alert">
						<%=msg.getContent()%>
					</div>
					<%
					}
					session.removeAttribute("msg");
					%>
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					JobDAO job = new JobDAO(Connector.getCon());
					Jobs v = job.getJobById(id);
					%>
					<div class="card-body">
						<form action="update" method="post">
							<input type="hidden" value="<%=v.getId()%>" name="id" />
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Title </label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Java Developer"
									name="title" value="<%=v.getTitle()%>">

							</div>
							<div
								style="display: flex; align-items: center; justify-content: space-between;">
								<div class="form-group" style="width: 100%">
									<label for="exampleInputEmail1">Location </label> <select
										class="custom-select" name="location">
										<option value="<%=v.getLocation()%>"><%=v.getLocation()%></option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Gujart">Gujart</option>
										<option value="Uttar Pradesh">Uttar Pradesh</option>
										<option value="Tamil Nadu">Tamil Nadu</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Punjab">Punjab</option>
										<option value="Karnataka">Karnataka</option>
									</select>
								</div>
								<div class="form-group"
									style="width: 100%; margin-left: 20px; margin-right: 20px">
									<label for="exampleInputEmail1">Category </label> <select
										class="custom-select" name="category">
										<option value="<%=v.getCategory()%>"><%=v.getCategory()%></option>
										<option value="Java Developer">Java Developer</option>
										<option value="C/C++ Developer">C/C++ Developer</option>
										<option value="Python Developer">Python Developer</option>
										<option value="Web Developer">Web Developer</option>
										<option value="React Developer">React Developer</option>
									</select>
								</div>
								<div class="form-group" style="width: 100%">
									<label for="exampleInputEmail1">Status </label> <select
										class="form-control" name="status">
										<option class="active" value="<%=v.getStatus()%> "><%=v.getStatus()%></option>
										<option class="active" value="Active">Active</option>
										<option value="Inactive">Inactive</option>

									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Description</label>
								<textarea type="text" class="form-control" required rows="6"
									placeholder="Design, Code, Test and Document the system."
									name="description"><%=v.getDescription()%></textarea>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-success btn-lg">Update
									Job</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>