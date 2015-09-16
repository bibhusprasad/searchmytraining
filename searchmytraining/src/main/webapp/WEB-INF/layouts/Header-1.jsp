<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Header1.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/logout.js"></script>
	 <link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">  
</head>

<body>
	<div class="header">

		<div id='cssmenu'>

			<ul id="coolMenu">
			<li class='active has-sub'><a href='${pageContext.request.contextPath}'><i class="fa fa-home fa-1x"></i></a>
				</li>
				<li class='active has-sub'><a href='#'><span>Browse</span></a>
					<ul>
						<li><a href='#'><span>All Training</span></a></li>
						<li><a href='#'><span>Training By Category</span></a></li>
						<li><a href='#'><span>Training By Institute</span></a></li>
						<li><a href='#'><span>Training By Location</span></a></li>
					</ul></li>

				<li class='active has-sub'><a href='#'><span>About
							Us</span></a>
					<ul>
						<li><a href='about'><span>Why SearchMyTraining</span></a></li>
						<li><a href='Team'><span>About Us</span></a></li>
						<li><a href='News'><span>SearchMyTraining News</span></a></li>
						<li><a href='Career'><span>Career With Us</span></a></li>
						<li><a href="contact"><span>Contact Us</span></a></li>
					</ul></li>
				<li class='active has-sub'><a href="Blog">Blog</a>
				</li>
			</ul>


		</div>
		<!-- <div class="welcome">
			<h2>Welcome,</h2>
		</div> -->
		<div class="main">
			<div class="user-icon">
				<c:if test="${!empty actordetails.picture}">
				 	<img src="${pageContext.request.contextPath}/common/downloadPicture/${actordetails.user.userId}" id="menu_opener" alt="ass"/>
				 </c:if>
				 <c:if test="${empty actordetails.picture}">
				 	<img src="${pageContext.request.contextPath}/resources/images/user-icon.png" id="menu_opener" alt="ass"/>
				 </c:if>	
			</div>
			<div id="submenu">
				<div class="Pro-pic">
					<c:if test="${!empty actordetails.picture}">
				 		<img src="${pageContext.request.contextPath}/common/downloadPicture/${actordetails.user.userId}" id="profilepic" name="profilepic" width="98" height="98" border="0" alt="PROFILE PICTURE" onError="this.src= ${pageContext.request.contextPath}/resources/images/avtar.jpg ;" />
				 	</c:if>
				 	<c:if test="${empty actordetails.picture}">
				 		<img alt="user" src="${pageContext.request.contextPath}/resources/images/user-icon.png">
				 	</c:if>
				</div>
				<div class="u-info">
				<h1>Welcome,</h1>
				 <div class="u_name">
				<h2>${actordetails.name}</h2>
				</div>
				<div class=u_mailid><h3>${actordetails.user.userName}</h3>
				</div> 
				</div><br></br>
				 <div class="signout">
				 <a href="<c:url value="${pageContext.request.contextPath}/j_spring_security_logout"/>" >Sign-Out</a> 
				</div> 
			</div>
		</div>
	</div>

</body>
</html>