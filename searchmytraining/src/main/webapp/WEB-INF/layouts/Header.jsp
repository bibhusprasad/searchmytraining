<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css"> 
<link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"> 
	
<script type="text/javascript">
$(document).ready(function(){
	

$('#dropM').on('click',function(e){
	$('#coolMenu').slideToggle();

})

$("#regi_pop2").on('click',function(e){

	$("input[type='text']").val('');
	$("#cityid").val('0');
	$("input[type='password']").val('');
	$('#meter1').removeClass();
	$('#meter2').removeClass();
	$('#meter3').removeClass();
	
    $('#meter1').html(" ")
	$('#meter2').html("")
	$('#meter3').html("")
	$(".errorm").html("<text>.</text>");
	
})
$("#regi_pop").on('click',function(e){

	$("input[type='text']").val('');
	$("#selType").val('0');
	$("input[type='password']").val('');
	$('#meter01').removeClass();
	$('#meter02').removeClass();
	$('#meter03').removeClass();
	
    $('#meter01').html(" ")
	$('#meter02').html("")
	$('#meter03').html("")
	$(".errorm").html("<text>.</text>");
	
})
$("#regi_pop3").on('click',function(e){

	$("input[type='text']").val('');
	$("#City_name12").val('0');
	$("input[type='password']").val('');
	$('#meter12').removeClass();
	$('#meter13').removeClass();
	$('#meter14').removeClass();
	
    $('#meter12').html(" ");
	$('#meter13').html("");
	$('#meter14').html("");
	$(".errorm").html("<text>.</text>");
	
})
$(".my-button-new , .my-button").on('click',function(e){

	$("input[type='text']").val('');
	$(".errorm").html("<text>.</text>");


	
})
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

	
	
	
	
	<div id="pop_up_box_5">
		<a class="b-close"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
			<div class="logpag">
			</div>
			</div>
	
	<div id="pop_up_box_6">
		<a class="b-close close1"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"
			alt="cancel"></a>
			<div class="signin">
			
			</div>
			</div>
	<div id="pop_up_box">
	<a class="b-close p8"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
	<div class="enquiryt">
	
	</div>
	</div>
	<div id="pop_up_box_1">
	<a class="b-close p8"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
	<div class="grouptraining">
	
	</div>
	</div>
	<div id="pop_up_box_2">
	<a class="b-close p8"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
	<div class="traineebox">
	
	</div>
	</div>
	<div id="pop_up_box_4">
	<a class="b-close p8"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
	<div class="tproviderbox">
	
	</div>
	</div>
	<div id="pop_up_box_8">
	<a class="b-close p8"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
	<div class="boxContaint">
	
	</div>
	</div>
	<div id="pop_up_box_9">
		<a class="b-close close1"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
			<div class="advances">
			
			</div>
			</div>
	
  <div class="header">
            <div class="special_link">
                <div class="group">
                    <a href=#  class="animate my-button-new">
                        <span id="outerCircle"></span>
                        <span id="center"></span>
                    </a>
                    <a href="#" class="text my-button-new">    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Group<br> Training Request</a>
                </div>
            </div>
            <div id='cssmenu'>
                        <span class="menubtn" id ="dropM"></span>
                <ul id="coolMenu">
                <li class='active has-sub'><a href='${pageContext.request.contextPath}'><i class="fa fa-home"></i></a>
                    <li class='active has-sub'><a href='#'><span>Browse</span></a>
                        <ul>
                            <li><a href='#'><span>All Training</span></a></li>
                            <li ><a href='#'><span>Training By Category</span></a></li>
                           <!--  <li><a href='#'><span>By Category</span></a></li> -->
                            <li><a href='#'><span>Training By Institute</span></a></li>
                            <li><a href='#'><span>Training By Location</span></a></li>
                        </ul>
                    </li>

                    <li class='active has-sub'><a href='#'><span>Trainee</span></a>

                        <ul>
                            <li ><a href="#" id="regi_pop"><span >Registration</span></a></li>
                            <li><a href='Benefit'><span>Benefits Of Registration</span></a></li>
                        </ul>

                    </li>
                    <li class='active has-sub'><a href='#'><span>Training Provider</span></a>
                        <ul >
                            <li><a href="#" id="regi_pop2"><span>Registration</span></a></li>
                           <li><a href='TPBenefit'><span>Benefits Of Registration</span></a></li>
                        </ul>
                    </li>
                    <li class='active has-sub'><a href='#'><span>Freelancer</span></a>
                        <ul >
                            <li><a  href="#" id="regi_pop3"><span>Registration</span></a></li>
                            <li><a href='FLBenefit'><span>Benefits Of Registration</span></a></li>
                        </ul>
                    </li>

                    <li class='active has-sub'><a href='about'><span>About Us</span></a>
                        <ul>
                            <li><a href="about"><span>Why SearchMyTraining</span></a></li>
                            <li><a href='Team'><span>About Us</span></a></li>
                            <li><a href='News'><span>SearchMyTraining News</span></a></li>
                             <li><a href='Career'><span>Career With Us</span></a></li>
                            <li><a href="contact"><span>Contact Us</span></a></li>
                        </ul>
                    </li>
                    <li class='active has-sub'>
                        <a href="Blog">Blog</a>
                    </li>
                    <li class='active has-sub'>
                        <a href="#" id="sign-up">Sign-In</a>
                    </li>

                </ul>
            </div>

            <div class="logo">
                <div class="training">
                    <a href=#  class="animate my-button ">
                        <span id="outerCircle"></span>
                        <span id="center"></span>
                    </a>
                    <a href="#" class="text my-button">Training Enquiry</a>
                </div>
            </div>    
        </div>


</body>
</html>