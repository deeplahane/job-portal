<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false"%>
<%@ include file="components/all_css.jsp" %>
<%@ include file="components/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.back-img1{
	background: url("https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1686899747~exp=1686900347~hmac=dfca307d04d213957e0b601cf41b29f1413f533019f2778bd783c473478ca97d");
	height:65vh;
	width:35%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body style="background-color:#ffe6a6;">
<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>	
</c:if>
<div class="container-fluid "> 
		<div class="text-center ">
			<h2  class=" admin-div">
				<i class="fa-solid fa-user-gear"></i> Welcome Admin
			</h2>
		</div>
	</div>
	<div class="container-fluid back-img1">
	</div>
<%@ include file="components/footer.jsp" %>
</body>
</html> 