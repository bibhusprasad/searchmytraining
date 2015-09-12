
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="com.searchmytraining.dto.TrainerDTO,com.searchmytraining.entity.UserEntity"%>
<html lang=''>
<head>

<title>Training Provider Profile</title>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/form.css"
	type="text/css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/tabs.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/accordion.css"
	type="text/css">
	
	
	
	
	
	 <link rel="stylesheet"href="<%=request.getContextPath()%>/resources/css/tooltip.css"type="text/css"> 
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-ui-1.10.4.custom.js"></script>
<!--color-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.iconmenu.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/accordion.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>

	<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/include.js"></script>

<script>
	$(document).ready(function() {
		$('#icon-menu').iconmenu();
	});
	
	
	  $(function() {
	    $( ".datepicker" ).datepicker();
	  });
	 
	
</script>
<script type="text/javascript">
function displaybox(val) {
	if(val==="Select")
		document.getElementById('hide').style.display='none';
	else 
		
	document.getElementById('hide').style.display='block';
}

</script>


<script type="text/javascript">
function FPload() {
	<%-- $("#home-content").load("<%=request.getContextPath()%>/resources/pages/TrainingProvider/TPprofile.jsp?user='chetan'", function(responseText, statusText, xhr) --%>
	$("#home-content").load("./trainerprofile", function(responseText, statusText, xhr)
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}


function TCload() {
	$("#home-content").load("./TPcalender", function(responseText, statusText, xhr)
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}


function TSload() {
	$("#home-content").load("./resources/pages/TrainingProvider/TPsetting.jsp", function(responseText, statusText, xhr)
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}


function TIload() {
	$("#home-content").load("./resources/pages/TrainingProvider/Insights.jsp", function(responseText, statusText, xhr)
			
	        {
	                if(statusText == "success")
	                        /* alert("Successfully loaded the content!"); */
	                if(statusText == "error")
	                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	        });
	
}

</script>
</head>

<body style="min-width: 960px;" onload="FPload();">

	<%@include file="../../layouts/Header-1.jsp"%>
	<div class="container">
		<div class=" container-form-wrapar">
			<div class="space">
				
			</div>
			<!--==================================tab code start========================================================-->

			<div id="w" class="clearfix">
				<ul id="sidemenu">
					<li><a href="" onclick="FPload();" class="open"><strong>Profile</strong></a></li>
                    <li><a href="" onclick="TCload();"><strong>Calender</strong></a></li>
					<li><a href="" onclick="TIload();" ><strong>Insights</strong></a></li>

					<li><a href=""onclick="TSload();"><strong>Settings</strong></a></li>

					<li><a href="#contact-content"><strong>Send SMS</strong></a></li>
					<li><a href="#contact-content"><strong>Send Email</strong></a>
					</li>
					
				</ul>
				<div id="content">
					<div id="home-content" class="contentblock">
						<!--<h1>Update Profile</h1>-->
						

					</div>
					<div id="contact-content" class="contentblock hidden">
						<!--<h1>Update Profile</h1>-->
						nnbvnbvnnnn

					</div>
					<!-- @end #home-content -->
                      
					
				
			</div>
			<!-- @end #w -->

			<!--===========================================accord drop form script===================================================================-->

			<script>
				$('#acord1').accordion({
					collapsible : true
				});

				$('#acord2').accordion({
					collapsible : true
				});
				$('#acord3').accordion({
					collapsible : true
				});
			</script>
			<!--===========================================accord drop form script end===================================================================-->


		</div>
	</div>
	
	</div>

	

<%@include file="../../layouts/footer.jsp"%>
</body>
</html>
