<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
						<h3>Why Freelancer ?</h3>
						<ul>
							<li><p>Specialization with an effective cost</p></li>
							<li><p>Good resources and easy availability/association</p></li>
							<li><p>Better alignment with trainee</p></li>
							<li><p>Industry specific</p></li>

						</ul>
					</div>
					<div class="tr_benefit">
						<h3>Benefits for Freelancer</h3>
						<ul>
							<li>Can publish their profile on SearchMyTraining website.</li>
							<li>Details will be accessible to corporate HR, L&D Managers, Training House & Trainees.</li>
							<li>Group Training & individual training request will be forwarded to freelancer.</li>
							<li>Free newsletter will be accessible along with information on latest training trends and related information for trainers.</li>
							
						</ul>
					</div>
					<div class="sub_banner">
						<img alt="banner"
							src="<%=request.getContextPath()%>/resources/images/freelance.png">


					</div>
				</div>


			</div>


		</div>

	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>