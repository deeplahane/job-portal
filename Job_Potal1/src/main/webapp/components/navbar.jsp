
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<h3>
			<a class="navbar-brand" href="index.jsp"> Job Potal </a>
		</h3>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active ml-2"><a class="nav-link"
					href="home.jsp"><i class="fa-solid fa-house"></i> Home <span
						class="sr-only">(current)</span></a></li>

				<c:if test="${userobj.role eq 'admin' }">
					<li class="nav-item active ml-2"><a class="nav-link"
						href="add_job.jsp"><i class="fa-solid fa-plus"></i> Post Job</a></li>
					<li class="nav-item active ml-2"><a class="nav-link"
						href="view_jobs.jsp"><i class="fa-solid fa-magnifying-glass"></i>
							View Jobs</a></li>
				</c:if>

			</ul>
			<form class="form-inline my-2 my-lg-0">

				<c:if test="${userobj.role eq 'admin' }">
					<a href="admin.jsp" class="btn btn-light mr-2"><i
						class="fa-solid fa-user-gear"></i> Admin</a>
					<a href="logout" class="btn btn-light"><i
						class="fa-solid fa-right-to-bracket fa-rotate-180"></i> Logout</a>
				</c:if>

				<c:if test="${userobj.role eq 'user' }">
					<a href="home.jsp" class="btn btn-light mr-2" data-toggle="modal"
						data-target="#exampleModal"><i class="fa-solid fa-user"></i>
						${userobj.name } </a>
					<a href="logout" class="btn btn-light"><i
						class="fa-solid fa-right-to-bracket fa-rotate-180"></i> Logout</a>
				</c:if>


				<c:if test="${empty userobj}">
					<a href="login_page.jsp" class="btn btn-light mr-2"><i
						class="fa-solid fa-right-to-bracket"></i></i> login</a>
					<a href="signup_page.jsp" class="btn btn-light"><i
						class="fa-solid fa-user-plus"></i> singup</a>
				</c:if>
			</form>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Profile Page</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="fa-solid fa-user-circle fa-4x"></i>
							</div>
							<br/>
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name</th>
										<td>${userobj.name }</td>
									
									</tr>
									<tr>
										<th scope="row">Qualification</th>
										<td>${userobj.qualification }</td>
										
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td>${userobj.email } </td>
										
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary "
						data-dismiss="modal">Close</button>
					<!-- <button type="" class="btn btn-primary">Edit</button> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>