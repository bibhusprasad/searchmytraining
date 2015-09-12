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
<title>About Us</title>
</head>
<body>
	<%@include file="../../layouts/Header.jsp"%>

	<div id="main">
		<div class="about_banner">
			<img alt="banner"
				src="<%=request.getContextPath()%>/resources/images/aboutus.jpg">
		</div>
		<div class="clear"></div>
		<div class="about">
			<div class="left">
				<div class="Service">
					<h1>OUR FEATURES</h1>
					<p>Search All Type Training</p>
					<p>Find Nearest Training Center</p>
					<p>Search All Type Training</p>
					<p>Search All Type Training</p>


				</div>
				<div class="testimonial">
					<h1>TESTIMONIALS</h1>
					<blockquote class="testo">
						<p>Softinfology Is The Leading Company In IT Industry.We Are
							The Master In All Technology</p>

					</blockquote>
					<p class="author">Prashant Maskar</p>
				</div>

			</div>
			<div class="right">
				<div class="title">
					<h1>Why SearchMyTraining?</h1>
				</div>
				<p><b><em>SearchMyTraining is one of the first organization to come up with the solution of bringing the training providers and trainee to a common platform.</em>  </b></p>
				<p><strong>Industry Prospective :-</strong>&nbsp;&nbsp;Almost in every sector corporate houses, Government employees, employers look for different trainings to enhance knowledge and keep their people up to date with the ever changing world.Although training it is quite organized within the boundaries of academic education, but when it comes to specialization and short duration training programs, it is difficult to find out its start and end point. These trainings (industry) have their own way of developing curriculums and developing its delivery method. The challenge is no benchmarking, no alignment and lastly scattered.</p>
				<p><strong>Training Providers Prospective :- </strong>&nbsp;&nbsp; From the prospective of training providers every organization is independent on their own while it comes to create their own customer base, pulling the learners and advertising their organization and product. If the organization is able spend enough money they are able to be in the leading position in the industry.When it comes to small or mid- size training providers they struggle to establish themselves in a large competitive market regardless of having good programme or product. Their connection withlearner depends on mass mailing, advertisementin newspapers, contact with corporate L&D team/ HR team, references, etc.</p>
				<p><strong>Trainee Prospective :- </strong> &nbsp;&nbsp;The biggest sufferer of this unorganized industry is Trainee. This unorganized industry affects trainees the most. Trainee struggles to get the appropriate specialized training which is required for their career or development. Trainee keeps on searching through deferent search engines, individual networks, references etc to get their training needs fulfilled. Trainee joins programme without having sufficient information, knowledge, and comparison.</p>
				<p><b>SearchMyTraining is an attempt to provide a common platform to connect training providers with potential learners and help learners find the best suitable trainings for them. </b></p>
			</div>

		</div>
	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>