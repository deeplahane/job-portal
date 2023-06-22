<%@page import="com.entities.Message"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.Connector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<%@ include file="components/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background:
		url("https://img.freepik.com/free-vector/tiny-hr-manager-looking-candidate-job-interview-magnifier-computer-screen-flat-vector-illustration-career-employment_74855-8619.jpg?w=996&t=st=1686901109~exp=1686901709~hmac=3dc4c20c08327531e26af3f4d20c5de569363af884bdd0062a14ccd904268d21");
	height: 68vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<%-- <%
	Connection conn=Connector.getCon();
	if(conn!=null){
		out.print(conn);	
	}else{
		out.print("error");
	}
	
%> --%>

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>"><%=m.getContent()%></div>
	<%
	}
	session.removeAttribute("msg");
	%>
	<div
		style="display: flex; align-items: center; justify-content: center;"
		class="m-4 p-2 ">
		<div class="container-fluid con-hom">
			<div class="text-center">
				<h1 class="home-div ">
					<i class="fa-solid fa-book"></i> Online Job Portal
				</h1>
			</div>
		</div>
		<div class="container-fluid back-img con-hom	"></div>
	</div>
	<%@ include file="components/footer.jsp"%>
</body>
</html>
