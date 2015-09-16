<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/aboutus.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/combine.css">
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<title>Contact Us</title>
</head>
<body>
	<%@include file="../../layouts/Header.jsp"%>
	<div id="contact">
		<div class="contact_banner">
			<img alt="banner"
				src="<%=request.getContextPath()%>/resources/images/contact-us.png">
		</div>
		<h1>contact us</h1>
		<div class="contact_info">
			<div class="contact_form">
				<input id="firstname" class="firstname" type="text"
					placeholder="* First Name" title="First Name"> <input
					id="lastname" class="lastname" type="text"
					placeholder="* Last Name" title="Last Name"> <input
					id="email" class="email" type="text" placeholder="* Email"
					title="Email">
				<textarea rows="5" cols="65" placeholder="* Write a message"></textarea>
				<input type="button" value="SEND MESSAGE">
			</div>

			<div class="address_info">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.5932995625435!2d73.93596800000002!3d18.547272000000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c3db00000001%3A0x570779d477cae3c8!2sSoftinfology+Solutions+And+Cunsultancy+Pvt.+Ltd.!5e0!3m2!1sen!2sin!4v1433485885455"
					width="600" height="400" frameborder="0" style="border: 0"></iframe>
			</div>
		</div>
		<div class="content">
		<div class="left-content">
		<p>
		<span>SearchMyTraining,</span>
		<br>
		Opp-Hyundai Showroom, 
		<br>
		Pune., Tukaram Nagar, Kharadi, 
		<br>
		Pune, Maharashtra 411014
		<br><br>
		<img alt="call" src="<%=request.getContextPath()%>/resources/images/call.png">
		+1800-657-1800
		<br>
		<img style="width: 20px;" alt="email" src="<%=request.getContextPath()%>/resources/images/email.png">
		hr@softinfology.com
		</p>
		</div>
		<div class="right-content">
		</div>
		
		</div>
	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>