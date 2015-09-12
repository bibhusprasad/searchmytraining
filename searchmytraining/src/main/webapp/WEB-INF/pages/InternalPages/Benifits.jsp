<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/aboutus.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/combine.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<title>Benefits Of registration</title>
</head>
<body>


	<%@include file="../../layouts/Header.jsp"%>


	<div id="main">

		<div class="benefit_banner">
			<img alt="banner"
				src="<%=request.getContextPath()%>/resources/images/register.jpg">
		</div>
		<div class="clear"></div>
		<div class="benefit_container">
			<div class="benefit_left">
			<h2>Why SearchMyTraining ?</h2>
			
			</div>
			<div class="benefit_right">
				<h2>Benefits Of Registration</h2>
				<div class="trainee_benifit">
					<div class="why">
						<h3>Why Trainee</h3>
						<ul>
							<li><p>As the business world is continuously changing,
									every individual need training for growth and development. If
									they choose not to enroll in the process of continuous learning
									they will find it difficult to stay ahead of the competition.</p></li>
							<li><p>Training keeps individuals motivated. New skills
									and knowledge help to reduce boredom. It also demonstrates to
									the employee that they are valuable enough for the employer to
									invest in them and their development</p></li>
							<li><p>Training can be used to create positive attitudes
									through clarifying the behaviours and attitudes that are
									expected from the employees</p></li>
							<li><p>Training brings effectiveness and productivity
									and the productivity save the organization money and
									organization becomes more efficient.</p></li>

						</ul>
					</div>
					<div class="tr_benefit">
						<h3>Benefits for Trainee</h3>
						<ul>
							<li>Receive regular notification and training details on
								email as per the area of their choice on different subject.</li>
							<li>Training provider can contact you directly to give you
								best offer</li>
							<li>Free newsletter will be accessible</li>
							<li>Receive notifications on free trainings, seminars,
								conferences, etc.</li>
							<li>Search My Training may nominate you for a training
								programme for free</li>
						</ul>
					</div>
					<div class="sub_banner">
					<img alt="banner"
				src="<%=request.getContextPath()%>/resources/images/trainee.png">
					
					
					</div>
				</div>


			</div>


		</div>

	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>