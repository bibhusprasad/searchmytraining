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
						<h3>Why Training Provider ?</h3>
						<ul>
							<li><p>Training provider's play a vital role for all
									professionals in the development of specialization for
									individuals and organisations.</p></li>
							<li><p>Training providers can customize the programme as
									per the need of organizations or individuals</p></li>
							<li><p>Develop resources and create opportunity as per
									the need of the industry Training providers brings the
									effectiveness in organization and individuals which enhance the
									productivity</p></li>
							<li><p>Training provider's support in the 'skill
									development' program in the society.</p></li>

						</ul>
					</div>
					<div class="tr_benefit">
						<h3>Benefits for training provider</h3>
						<ul>
							<li>Publish your public training calendar on
								SearchMyTraining.</li>
							<li>Your organization profile will be visible and accessible
								to all.</li>
							<li>Trainee can contact directly to training provider.</li>
							<li>Training enquiry will be sent to you by
								SearchMyTraining.</li>
							<li>Will have the access of trainee database</li>
							<li>Training providers can send direct email &sms to
								trainees</li>
							<li>Free newsletter will be accessible along with
								information on latest training trends and related information
								for trainers</li>
						</ul>
					</div>
					<div class="sub_banner">
						<img alt="banner"
							src="<%=request.getContextPath()%>/resources/images/trainingprovider.jpg">


					</div>
				</div>


			</div>


		</div>

	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>