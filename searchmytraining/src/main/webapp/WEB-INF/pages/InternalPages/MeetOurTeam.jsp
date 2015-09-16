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
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<title>MeetOurTeam</title>
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
					<h1>About Us</h1>
				</div>
				
				<p><strong>Search My Training </strong>is founded by a group of likeminded young professionals in the year January 2015. Much before they built their website they realized the need of the industry and learners.The team of SearchMyTraining strongly believes that everyone should get chance to participate the learning programmes of their choice to enhance and develop their qualities which support themself for their personal and professional career.</p>
				<p>Learning agility of an trainee should not go waste and training providers should get the chance to share their knowledge with rest of the world. Like other popular web portals which provides you best services,  SearchMyTraining.com saves time and provides better quality results in comparison to traditional training search method.</p>
				<p>We are helping to instructor led and onsite training for individuals and helping individuals to find their choice of training through <a href="#">searchmytraining.com</a></p>
				
			</div>

		</div>
	</div>
	<%@include file="../../layouts/footer.jsp"%>
</body>
</html>