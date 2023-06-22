<%@page import="java.sql.Connection"%>
<%@page import="com.entities.Message"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Jobs"%>
<%@page import="com.connect.Connector"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<%@ include file="components/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body style="background-color: #F2F3F5;">
	<c:if test="${empty userobj }">
		<c:redirect url="login_page.jsp" />
	</c:if>
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
	
	<div class="container-fluid  login-container">
		<div class="row">
			<div class="col-md-12 ">

				<div class="card">
					<div class="card-body">
						<form class="form-inline" method="get" action="more_view.jsp">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-5 mt-1">
								<h5>Category</h5>
							</div>
							<div class="form-group col-md-5">
								<select class="custom-select" name="lo"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Gujart">Gujart</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Punjab">Punjab</option>
									<option value="Karnataka">Karnataka</option>
								</select>
							</div>
							<div class="form-group col-md-5">
								<select class="custom-select" name="ca"
									id="inlineFormCustomSelectPref">
									<option selected value="ca">Choose...</option>
									<option value="Java Developer">Java Developer</option>
									<option value="C/C++ Developer">C/C++ Developer</option>
									<option value="Python Developer">Python Developer</option>
									<option value="Web Developer">Web Developer</option>
									<option value="React Developer">React Developer</option>
								</select>
							</div>
							<button type="submit" class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
				<%
				JobDAO dao = new JobDAO(Connector.getCon());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs v : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">

						<h6><%=v.getTitle()%></h6>
						<%
						if (v.getDescription().length() > 0 && v.getDescription().length() < 120) {
						%>
						<p>
							<%=v.getDescription()%>
						</p>
						<%
						} else {
						%>
						<p><%=v.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>
						<br />
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=v.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=v.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Publish Date:<%=v.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=v.getId()%>" type="submit"
								class="btn btn-secondary btn-sm">View More...</a>
						</div>
					</div>
				</div>

				<%
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>