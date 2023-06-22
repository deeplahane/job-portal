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
<title>One View</title>
</head>
<body style="background-color:#f0f1f2">
<c:if test="${empty userobj}" >
	<c:redirect url="login_page.jsp" />
</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<%
				int id=Integer.parseInt(request.getParameter("id"));
				JobDAO dao=new JobDAO( Connector.getCon() );
				Jobs v=dao.getJobById(id);
			%>
			<div class="card mt-2">
					<div class="card-body">

						<h6><%=v.getTitle()%></h6>
						<p>
							<%=v.getDescription()%>
						</p>
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
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>