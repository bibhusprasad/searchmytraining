<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
</head>
<body>

<%-- <%@include file="../pages/HomePageLogin.jsp" %> --%>
	
		<div class="reg_form">

			<form action="#" name="myform" onsubmit="return (validation());">

				<div class="head">
					<h2>Sign In</h2>
				</div>
				<div class="sign-in">
					<div class="sub-login">
						<a href="#login_form" class="login_pop close1">
							<h2>Trainee</h2> <img
							src="<%=request.getContextPath()%>/resources/images/user.png"
							alt="user" />
						</a>
					</div>
					<div class="sub-login">
						<a href="#login_form2" class="login_pop close1">
							<h2>Provider</h2> <img
							src="<%=request.getContextPath()%>/resources/images/provider.png"
							alt="provider" />
						</a>
					</div>
					<div class="sub-login">
					<a href="#" class="login_pop close1">
						<h2>Freelancer</h2>
						<img
							src="<%=request.getContextPath()%>/resources/images/lancer.png"
							alt="lancer" />
							</a>
							
					</div>
				</div>


			</form>
		</div>

</body>
</html>