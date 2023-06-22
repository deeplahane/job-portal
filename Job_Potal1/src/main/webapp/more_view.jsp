<%@page import="java.util.ArrayList"%>
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
<title>User: View Jobs</title>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj}">
		<c:redirect url="login_page.jsp" />
	</c:if> 
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				String loc = request.getParameter("lo");
				String cat = request.getParameter("ca");
				String msg = "";

				JobDAO dao = new JobDAO(Connector.getCon());
				List<Jobs> list = null;
				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "Jobs not available!";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobsOrLocationAndCate(cat, loc);
				} else {
					list = dao.getJobsAndLocationAndCate(cat, loc);
				}
				if (list.isEmpty()) { 
				%><h4 class="text-center text-danger mt-4">Job Not Available</h4>
				<%} if(list!=null){ for(Jobs v:list){
				%>
				<div class="card mt-2">
					<div class="card-body">

						<h6><%=v.getTitle()  %></h6>
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
						<div class="text-center">
							<a href="one_view.jsp?id=<%=v.getId()%>" type="submit"
								class="btn btn-secondary btn-sm">View More...</a>
						</div>
					</div> 
				</div>
				<%} }else{ %>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>