<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<%@page
	import="com.searchmytraining.dto.FreelancerDTO,com.searchmytraining.entity.UserEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang=''>
<head>
<title>Admin</title>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/tabs.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/form.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/AdminCalender.css">
 <link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet"> 
 <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css"
	rel="stylesheet"> 
  <link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">  
<script
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/pagination/jquery.tabpager.min.js"></script>
<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script> --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-ui-1.10.4.custom.js"></script>
<!--color-->
<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script> --%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.iconmenu.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/include.js"></script>
	
	 <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/canvasjs.min.js"></script>
	
	
<script type="text/javascript">
	


function FLCload() {
	$("#home-content").load("<%=request.getContextPath()%>/manageCalender", function(responseText, statusText, xhr)
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}

function FSIload() {
	$("#home-content").load("<%=request.getContextPath()%>/manageAdd", function(responseText, statusText, xhr)
			
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}

function FLSload() {
	$("#home-content").load("<%=request.getContextPath()%>/providerRanking", function(responseText, statusText, xhr)
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	}

function AMCload() {
	$("#home-content").load("<%=request.getContextPath()%>/charts",
				function(responseText, statusText, xhr) {
					if (statusText == "success")
						/* alert("Successfully loaded the content!"); */
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});
	}
	
function Reportload() {
	$("#home-content").load("./showReports",
				function(responseText, statusText, xhr) {
					if (statusText == "success")
						/* alert("Successfully loaded the content!"); */
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});
	}
</script>



<style>
.container .container-form-wrapar {
	width: 100%;
	box-shadow: none;
}
</style>
</head>
<body style="" onload="FLCload(); ">

	<input id="myhiddenid" type="hidden"
		value="${requestScope.freelancerDto.name12}" />

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"> Admin </a>
		</div>

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>Softinfology</strong> <span
									class="pull-right text-muted"> <em>Today</em>
								</span>
							</div>
							<div>Adhcgdh dsjkfhuf dfjdf dkfukdf dkjfhj...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>Softinfology</strong> <span
									class="pull-right text-muted"> <em>Yesterday</em>
								</span>
							</div>
							<div>Fdjhf djfgdj sjdhf dfudjf dfujyhfd fuydjfhddd...</div>
					</a></li>

					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> New Comment

							</div>
					</a></li>
					<li class="divider"></li>

					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> Message Sent

							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> New Task

							</div>
					</a></li>
					<li class="divider"></li>


				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="adminLogin"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul></li>

		</ul>

		</nav>
	</div>
	<div class="container">
		<div class="container-form-wrapar">
			
			<div style="margin-top: 0px;" id="w" class="clearfix">
				<ul  id="sidemenu">

					<li><a href="" onclick="FLCload();" class="open"><strong>Calender
								Details</strong></a></li>
					<li><a href="" onclick="FSIload();"><strong>Add
								Management / Upload Advertise</strong></a></li>

					<li><a href="" onclick="FLSload();"><strong>Ranking
								For Training Provider</strong></a></li>

					<li><a href="" onclick="AMCload();"><strong>Charts
								</strong></a></li>
					<li><a href="" onclick="Reportload();"><strong>Reports
								</strong></a></li>

				</ul>
				<div id="content" style="height: auto;">
					<div id="home-content" class="contentblock">
						<!--<h1>Update Profile</h1>-->


					</div>
					<!-- @end #home-content -->


					<div id="about-content" class="contentblock hidden">

						<p>ygygiugyi</p>
					</div>

					<div id="ideas-content" class="contentblock hidden"></div>


					<div id="contact-content" class="contentblock hidden">
						<h1>ooioioi</h1>
					</div>
					<!-- @end #contact-content -->
				</div>
			</div>
			<!-- @end #w -->

			<script>
				$('#acord1').accordion({
					collapsible : true
				});
				$('#acord2').accordion({
					collapsible : true
				});
			</script>


		</div>
	</div>
	<%-- <%@include file="../../layouts/footer.jsp"%> --%>
</body>
</html>
