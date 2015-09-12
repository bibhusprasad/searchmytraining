<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page import="java.util.List,java.io.File,java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang=''>
<head>
<title>SearchMyTraining</title>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/combine.css"
	media="all" type="text/css">
 <link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"> 
<link
	href="<%=request.getContextPath()%>/resources/css/tooltipster.css"
	rel="stylesheet" type="text/css"> 
<script
	src="<%=request.getContextPath()%>/resources/js/modernizr-1.5.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-ui-1.10.4.custom.js"></script>
<!--color-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jssor.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jssor.slider.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.iconmenu.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/my_js1.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/tabBar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/combine.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/paging.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.tablesorter.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.tooltipster.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
 
<script
	src="<%=request.getContextPath()%>/resources/js/work/calender.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.autocomplete.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main_auto.css"
	media="all" type="text/css">
	
<script>
  function LoadPage(){
	 var inputkeyword=$("#w-input-search").val();
     $.ajax({
        url: '<%=request.getContextPath()%>/getCalendars',  
        type: 'post',
        dataType:'json',
        data: 'inputkeyword='+inputkeyword,
        cache: true,
        success: function (response) {  
            console.log("in success... of LoadPage()");
        }       
    }); 
    } 
  

 
</script>
<script type="text/javascript">
$(window).scroll(function(){
    if ($(window).scrollTop() >= 10) {
       $('.header').addClass('fixed_header');
    }
    else {
       $('.header').removeClass('fixed_header');
    }
});

 jQuery(document).ready(function ($) {
    var options = {

        $AutoPlay: true,                                   //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
        $DragOrientation: 1                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
    };

    var jssor_slider1 = new $JssorSlider$("slider1_container", options);
});
 
 function searchvalidate() {
	 if ($("#w-input-search").val()==""){
		 $("#w-input-search").css('border','1px solid red');
		 $("#w-input-search").focus();
	 }
	 else if($("#loc").val()==""){
		 $("#loc").css('border','1px solid red');
		 $("#loc").focus();
	 }
	 else{
		 $("#w-input-search").css('border','1px solid #ccc');
		 $("#loc").css('border','1px solid #ccc');
		 loadcalender();
	 }
	
 }
 function loadcalender() {
	      
		   	 var keyword=$('#w-input-search').val();
		   	
		   	 console.log("from loadcalender keyword :"+keyword);

		   	$("#mid").load("./getCalendars",{inputkeyword:keyword},function(responseText, statusText, xhr) {
		   					if (statusText == "success")
		   						console.log("Successfully loaded the content!"); 
		   						if (statusText == "error")
		   							alert("An error occurred: " + xhr.status + " - "
		   									+ xhr.statusText);
		   				});
		
	} 
</script>
<script type="text/javascript">
$(function(){
	
	//type dialogBox
	$('#btn-type').click(function(){
		
		$('#type-dialogBox').dialogBox({
			type: 'correct',  //three type:'normal'(default),'correct','error',
			
			content: '<%=request.getContextPath()%>/AdvSearch'
		});
	})


})
$(document).ready(function(){

	function randString(x){
	    
		 var text = " ";

		    var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

		    for( var i=0; i < x; i++ )
		        text += charset.charAt(Math.floor(Math.random() * charset.length));
		    
	           $(".Ccode").html(text);
		
			
		}
});

</script>

</head>
<body>
	<%@include file="layouts/Header.jsp"%>


	<!--==============================================================================-->
	<div class="search_wrapar">

		<div class="logoname">
			<h1>SearchMyTraining</h1>
		</div>

		<div class="citi-box">

			<div class="country">

				<div class="arrow">
					<a href="#" onclick="my_show()"><img
						src="<%=request.getContextPath()%>/resources/images/loc3.png"
						alt="arrow" /></a>
				</div>
				<span class="txt"><a href="#" id="Country"
					onclick="my_show()">Pune</a></span>
				<div id="drop" class="drop1">
					<ul>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Pune')">Pune</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('solapur')">Solapur</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Mumbai')">Mumbai</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Thane')">Thane</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Nagpur')">Nagpur</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('kolkata')">kolkata</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Goa')">Goa</a></li>
					</ul>
				</div>
			</div>

		</div>

		<div class="search_bar">

			<div class="course-name">
				<input class="input-1" id="w-input-search" type="text"
					placeholder="Course Name"  required="required"/>
			</div>
			<div class="location">
				<!-- <input class="input-2" id="loc" type="text" placeholder="Location" required="required" /> -->
				<input class="input-2" id="loc" list="cities" placeholder="Location" required="required" />
				<datalist id="cities">
					<c:forEach var="city" items="${cities}">
						<option value="${city.cityName}">${city.cityName}</option>
					</c:forEach>
				</datalist>
			</div>
			<div class="search">
				<input type="submit" value="Search" id="button" name=button
					onclick="searchvalidate(); " />
			</div>
			<div class="adv-search">
				<a href="#" id="advsearch1">Advance Search</a>
				<div id="type-dialogBox"></div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				console.log("in auto_complete..path: ${pageContext.request.contextPath}");
				$('#w-input-search').autocomplete({
					serviceUrl: '${pageContext.request.contextPath}/dosearch',
					paramName: "tagName",
					delimiter: ",",
				    transformResult: function(response) {
				        return {
				            suggestions: $.map($.parseJSON(response), function(item) {
				                /* return { value: item.tagName, data: item.id }; */
				                return {value: item};
				            })
				        };
				    },
				    select: function(event, ui)
				    {
				    	alert("selected...");
				    }
				});
			});
		</script>

		<div class="brow_train">
			<ul class="brow_obpt">
				<li><a href="#1">All Training </a> &nbsp;&nbsp; <span> |</span>
				</li>
				<li><a href="#2">Upcoming Trainings </a> &nbsp;&nbsp; <span>
						|</span></li>
				<li><a href="#3">Training By Category</a>&nbsp;&nbsp;<span>
						| </span></li>
				<li><a href="#4">Training By Institute </a>&nbsp;&nbsp;<span>
						| </span></li>
				<li><a href="#5">Training By Location </a></li>
			</ul>
		</div>
	</div>
	<!--====================================section start here================================================================-->

	<div class="section_wrapar" id="section">
		<div class="ver_add-wrapar">

			<div id="verticalScroller">
				
				<c:forEach var="image" items="${verticalLeftImageList}">
				<div>  
	  				<img src="./resources/images/ads_verticalleftscroller/${image}" alt="${image}">
				</div>
				</c:forEach>
				
				<%-- <div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/b.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/c.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/d.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/b.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div> --%>
			</div>

		</div>
		<div class="middle_part" id="mid">
			<div class="top_add" id="top">
				<c:forEach var="image" items="${horizontalMainImageList}">
					<div>  
		  				<img src="./resources/images/ads_horizontalmainbanner/${image}" alt="${image}">
					</div>
				</c:forEach>
			</div>
			<%-- <div class="top_add" id="top">
				<img
					src="<%=request.getContextPath()%>/resources/images/hdBannerCareers_bg.jpg"
					alt="a">
			</div> --%>
			<div id="t" class="clearfix">
				<ul id="tabmenu">
					<li class="open hvr-underline-reveal"><a href="#home-content">All
							Institute</a></li>

					<li class="open hvr-underline-reveal"><a href="#about-content">Top
							Institute</a></li>

					<li class="open hvr-underline-reveal"><a href="#ideas-content">Govt.
							Institute</a></li>

					<li class="open hvr-underline-reveal"><a
						href="#contact-content">National Institute</a></li>

				</ul>
				<div id="tabcontent">
					<div id="home-content" class="contentblock">
						<div class="top-institute" id="calender"></div>


					</div>
					<!-- @end #home-content -->


					<div id="about-content" class="contentblock hidden">

						<div class="top-institute">
							<ul>
								<li><h1>Training Institute2</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute2</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute2</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
					</div>

					<div id="ideas-content" class="contentblock hidden">
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute3</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute3</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute3</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>

					</div>
					<!-- @end #ideas-content -->

					<div id="contact-content" class="contentblock hidden">
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute4</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute4</h1></li>
								<ul>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute4</h1></li>
								<ul>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
								</ul>
							</ul>
						</div>



					</div>
					<!-- @end #contact-content -->
				</div>
			</div>
			<!-- @end #w -->
		</div>
		<div class="right_part">

			<div class="top_cat_box">
				<div id="slider1_container" style="width: 290px; height: 300px;">
					<div u="slides"	style="cursor: move; position: absolute; left: 0px; top: 0px; width: 290px; height: 300px; overflow: hidden;">
					
						<c:forEach var="image" items="${verticalRightImageList}">
							<div>  
	  							<img src="./resources/images/ads_verticalrightscroller/${image}" alt="${image}">
							</div>
						</c:forEach>
					
						<%-- <div>
							<img
								src="<%=request.getContextPath()%>/resources/images/first.png"
								alt="a">
						</div>

						<div>
							<img
								src="<%=request.getContextPath()%>/resources/images/traino2.png"
								alt="b">
						</div>

						<div>
							<img
								src="<%=request.getContextPath()%>/resources/images/train.png"
								alt="c">
						</div>

						<div>
							<img
								src="<%=request.getContextPath()%>/resources/images/traino1.png"
								alt="d">
						</div>

						<div>
							<img
								src="<%=request.getContextPath()%>/resources/images/traino2.png"
								alt="f">
						</div> --%>

					</div>
				</div>
			</div>
			<div class="bottom_ban_box">
				<!--<img src="images/sem.gif" alt="a">-->
				<h1>SEMINARS</h1>
				<ul class="text_slide">
					<marquee direction="up" behavior="scroll" scrollamount="3"
						onmouseover="this.stop()" onmouseout="this.start()" height="305">

						<li><a href="#" target="_blank">Seminar on Graphics
								Design</a>
						<li>
						<li><a href="#" target="_blank">Seminar on HTML5 Design </a></li>
						<li><a href="#" target="_blank">Seminar on Web Design</a></li>
						<li><a href="#" target="_blank">Seminar on web
								Development</a></li>
						<li><a href="#" target="_blank">Seminar on Graphics
								Design</a></li>
						<li><a href="#" target="_blank">Seminar on web Design</a></li>
					</marquee>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="image-slider">
		<div class="ribbon-1">
			<h1>Did You Know?</h1>
			<div class="para">
				<p>Our vision is to give people the power to learn and make the
					world more enlightened one training course at a time.</p>
			</div>
		</div>


		<div id="slider" class="transbg-2 roundtext">

			<ul id="icon-menu" class="sti-menu">
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/softeware-development.html">
						<h2 data-type="mText" class="sti-item">Respect The Training
							Honor The Commitment Cherish The Result.</h2>
						<h3 data-type="sText" class="sti-item">All Training �</h3>
						<span data-type="icon" class="sti-icon sti-icon-branding sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/ourwork.html">
						<h2 data-type="mText" class="sti-item">Sucess in Business
							Require Training and Discipline and Hard Work But If You're Not
							Frightened By These Things,The Opportunities are Just as Great
							Today as they ever were.</h2>
						<h3 data-type="sText" class="sti-item">Group Training
							�</h3> <span data-type="icon" class="sti-icon sti-icon-web sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/seo.html">
						<h2 data-type="mText" class="sti-item">Practice Is The
							Hardest Part Of Learning, And Training Is The Essence Of
							Transformation.</h2>
						<h3 data-type="sText" class="sti-item">Industrial Training �</h3> <span
						data-type="icon" class="sti-icon sti-icon-seo sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/graph-design.html">
						<h2 data-type="mText" class="sti-item">It Is Not Only
							Important To Be Powerfull, What's Really Important Is To Be
							Brave,Training Is Essential Because Training Makes You Brave.</h2>
						<h3 data-type="sText" class="sti-item">Seminar
							�</h3> <span data-type="icon" class="sti-icon sti-icon-print sti-item"></span>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="clear"></div>
	<div class="partners">
		<div class="partners-info">
			<h1>Our Partners</h1>
			<div class="para">
				<p>Our mission is to create a global ecommerce platform where
					anyone can develop themselves or others... making the complex
					simple.</p>
			</div>
		</div>


		<div class="border-top">
			<ul class="garagedoor">
				<li id="shutter1"><a href="#1">Link 1</a></li>
				<li id="shutter2"><a href="#2">Link 2</a></li>
				<li id="shutter3"><a href="#3">Link 3</a></li>
				<li id="shutter4"><a href="#4">Link 4</a></li>
				<li id="shutter5"><a href="#5">Link 4</a></li>
			</ul>
		</div>
		<div class="border-top2"></div>


	</div>

	<div class="clear"></div>

	<%@include file="layouts/footer.jsp"%>
</body>
</html>



