<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Freelancer Registration</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<%-- 	<script
	src="<%=request.getContextPath()%>/resources/js/modernizr-1.5.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/Validations/Fvalidation.js"></script>
</head>

<script type="text/javascript">
	function freelancerRegistration() {
		var flag = validation12();
		if (flag) {
			try {
				$.ajax({
							url : './freelancer/flregister',
							type : 'post',
							dataType : 'json',
							data : JSON.stringify({
								"name12" : $('#name12').val(),
								"city12" : $('#City_name12').val(),
								"contact12" : $('#contact12').val(),
								"email12" : $('#email12').val(),
								"password12" : $('#password12').val(),
								"cnfpassword12" : $('#cnfpassword12').val()
							}),
							contentType : "application/json",
							success : function(response) {
								alert("Thank you for Your Registration, Please Update Your Profile:");
								doLoginTPF();
							}
						});
			} catch (ex) {
				alert(ex);
			}
		}
	}
	function doLoginTPF() {
		var username = $('#email12').val();
		var credentials = {
			username : $('#email12').val(),
			password : $('#password12').val()
		};
		$.ajax({
			url : "${ctx}/searchmytraining/j_spring_security_check",
			type : "POST",
			//contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.withCredentials = true;
			},
			data : credentials,
			success : function(data, status) {
				if (data != null) {
					if (data.success == false) {
						$('#auth_error_mesg').html(data.message);
						$("#auth_error_div").show();
					} else if (data.success == true) {
						/* location.href = "${ctx}/searchmytraining" + data.page+"?username="+username; */
						$('#url').val(username);
						$("#loginformhidden").attr("action","${ctx}/searchmytraining" + data.page);
						$('#loginformhidden').submit();
					}
				}
			},
			error : loginFailed
		});
	}
</script>
<script type="text/javascript">
function randString(x){
    
	 var text = " ";

	    var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < x; i++ )
	        text += charset.charAt(Math.floor(Math.random() * charset.length));
	    
          $(".Ccode").html(text);
	
		
	}

</script>
<body onload='randString(5);'>

		
		<div class="reg_form">
			<div class="head">
				<img
					src="<%=request.getContextPath()%>/resources/images/register2.png"
					alt="register">
			</div>
			<form id="FreelancerRegistration" name="myform" method="post"
				onsubmit="return (validation12());">
				<h2>Registration</h2>
				<div class="name">
					<input type="text" autocomplete="off" name="name" id="name12"
						placeholder="Full Name" autofocus />
				</div>
				<span id="error11" class="errorm"><text>.</text></span> 
				<div class="city">
				<select id="City_name12">
					<option value="0" selected>--Select--</option>
					<c:forEach var="city" items="${cities}">
						<option value="${city.cityId}">${city.cityName}</option>
					</c:forEach>
				</select> 
				</div>
				<span id="error12" class="errorm"><text>.</text></span>
				<!--  <div class="name">
                        <input type="text" autocomplete="off" name="training_type" value="" placeholder="Training Type" required="">
                    </div> -->
				<div class="contact">
					<input type="text" name="contact" autocomplete="off" id="contact12"
						placeholder="Contact No." onkeypress="return validate12(event)">
				</div>
				<span id="error13" class="errorm"><text>.</text></span>
				<div class="mailto">
					<input type="text" autocomplete="off" name="email" id="email12"
						placeholder="Enter Email Id">
				</div>
				<span id="error14" class="errorm"><text>.</text></span>
				<div class="password">
					<input type="password" autocomplete="off" name="password"
						id="password12" placeholder="Enter Password">
				</div>
				<div id="Pass-chek12">
					<div id="meter12"></div>
					<div id="meter13"></div>
					<div id="meter14"></div>
				</div>


				<div class="password">
					<input type="password" autocomplete="off" name="cnfpassword"
						id="cnfpassword12" placeholder="Confirm Password">
				</div>
				<span id="error15" class="errorm"><text>.</text></span>
				<div class="rcpatcha1">

					<input style="margin: 0 auto;" type="text" id="frcapch" name=""
						placeholder="Enter Captch">

				</div>
				<div class="cpatcha1">

					<div class="Ccode" id="captchf"></div>
					<div class="refresh1">
						<input type="button" id="refreshc" onclick='randString(5);' />

					</div>

				</div>

				<div class="sign">
					<!-- <input type="button" name="Submit" value="Submit" onclick="freelancerRegistration();validation12();"> -->
					<input type="button" name="Submit" value="Submit"
						onclick="freelancerRegistration();">
					<input type="reset" name="Cancel" value="Reset" class="cancel">
				</div>

			</form>
		</div>
	
	<form id="loginformhidden" style="display: none" method="POST">
		<input type="hidden" id="url" name="username" value="" />
	</form>
</body>
</html>