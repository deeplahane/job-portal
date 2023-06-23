<%@page import="com.entities.Message"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>View Jobs</title>
</head>
<body style="background-color: #F2F3F5;">
<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>	
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
				<%
				JobDAO jobs = new JobDAO(Connector.getCon());
				List<Jobs> j = jobs.getAllJobs();

				for (Jobs v : j) {
				%>

				<div class="card mt-2">
					<div class="card-body">

						<h6><%=v.getTitle()%></h6>
						<p><%=v.getDescription()%></p>
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
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status:<%=v.getStatus()%>" readonly>
							</div>
						</div>
						<h6><%=v.getPdate()%></h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=v.getId()%>" type="submit"
								class="btn btn-secondary btn-sm">Edit</a> <a
								href="delete?id=<%=v.getId()%>" 
								type="submit"
								class="btn btn-danger btn-sm">Delete</a>
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