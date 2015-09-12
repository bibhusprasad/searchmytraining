<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Training Provider Registration</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/Validations/Rvalidation.js"></script>
<script type="text/javascript">
function trainerRegistration(path) {
	if (validation(path)) {
		try {
			$.ajax({
						url : '${pageContext.request.contextPath}'+'/trainingprovider_reg',
						type : 'post',
						dataType : 'json',
						data : JSON.stringify({
							"org_name" : $('#org_name').val(),
							"city" : $('#cityid').val(),
							"contact" : $('#contact1').val(),
							"email" : $('#email1').val(),
							"password" : $('#password').val(),
							"cnfpassword" : $('#cnfpassword').val()
						}),
						contentType : "application/json",
						success : function(response) {
							if (response.errorMsg) {
								$.map(response.errorMsg, function(val, key) {
									if (key == "org_name")
										$('#error1').text(val);
									else if (key == "city")
										$('#error2').text(val);
									else if (key == "contact")
										$('#error3').text(val);
									else if (key == "email")
										$('#error4').text(val);
									else if (key == "password")
										$('#error5').text(val);
									else if (key == "cnfpassword")
										$('#error6').text(val);
								});

							} else {
								alert("Thank you for Your Registration, Please Update Your Profile: SMT");
								doLoginTP();
								/*window.location.href = path	+ "/trainingprovider_updateprofile";*/
							}

						}
					});
		} catch (ex) {

			alert(ex);
		}
	}
}

function doLoginTP()
{
	console.log("in doLogin()... :-)..hi");
	var username = $('#email1').val();
	var password1=$('#password').val();
	console.log("username: "+username+"\npassword: "+password1);
	var credentials = {username:$('#email1').val(),password:$('#password').val()};
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
					alert(data.message);
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

function randString(x){
   
	 var text = " ";

	    var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < x; i++ )
	        text += charset.charAt(Math.floor(Math.random() * charset.length));
	    
          $(".Ccode").html(text);
	
		
	}

</script>
</head>

<body onload="randString(5);">

		<div class="reg_form">
			<div class="head">
				<img
					src="<%=request.getContextPath()%>/resources/images/register2.png"
					alt="register">
			</div>
			<form id="trainerRegistartionForm" name="myform" method="post"
				onsubmit="return (validation());">
				<h2>Registration</h2>
				<div class="name">
					<input id="org_name" type="text" autocomplete="off" name="org_name"
						value="" placeholder="Organization Name"  autofocus/> <span
						id="error1" class="errorm"><text>.</text></span>

				</div>
				<select id="cityid">
					<option value="0" selected>--Select--</option>
					<c:forEach var="city" items="${cities}">
						<option value="${city.cityId}">${city.cityName}</option>
					</c:forEach>
				</select> 
				<span id="error2"  class="errorm"><text>.</text></span>
				<div class="contact">
					<input id="contact1" type="text" autocomplete="off" name="contact"
						value="" placeholder="Contact No." required=""
						onkeypress="return validate(event)"> <span id="error3"  class="errorm"><text>.</text></span>
				</div>
				<div class="mailto">
					<input id="email1" type="text" autocomplete="off" name="email"
						value="" placeholder="Enter Email Id" required=""> 
					<span id="error4"  class="errorm"><text>.</text></span>
				</div>
				<div class="password">
					<input id="password" class="pass" type="password"
						autocomplete="off" name="password" value=""
						placeholder="Enter Password" required="">
				</div>
			<div id="Pass-chek"><div id="meter1"></div><div id="meter2"></div><div id="meter3"></div>
				</div>
				<div class="password">
					<input id="cnfpassword" type="password" autocomplete="off"
						name="cnfpassword" value="" placeholder="Confirm Password"
						required="">
				</div>
				<span id="error5"  class="errorm"><text>.</text></span>
				<div class="rcpatcha1">
			<input style="margin: 0 auto;" type="text" id="prcaptch" name="" placeholder="Enter Captch">
			</div>
				<div class="cpatcha1">
			<div class="Ccode" id="captch"></div>
			<div class="refresh1">
			<input type="button" id="refreshc" onclick='randString(5);' /> 
			</div>
			</div>
				<div class="sign">
					<input type="button" name="Submit" value="Submit" onclick="trainerRegistration('<%=request.getContextPath()%>'); " />
					<input type="reset" name="Cancel" value="Reset" class="cancel">
				</div>
			</form>
		</div>

	<form id="loginformhidden" style="display: none" method="POST">
		<input type="hidden" id="url" name="username" value="" />
	</form>
</body>
</html>