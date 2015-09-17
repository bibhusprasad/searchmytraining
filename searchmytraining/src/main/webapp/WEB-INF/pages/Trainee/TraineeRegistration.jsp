<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>Trainee Registration</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/Validations/passwordValidation.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/Validations/validation.js"></script>

<script type="text/javascript">
	$(function() {
		$('#selType').change(function() {
			$('#Answers > div').hide();
			$('#Answers').find('#' + $(this).val()).show();
			var x= document.getElementById("name2");
			x.style.backgroundImage = "url('<%=request.getContextPath()%>/resources/images/corporate1.png')";
							x.style.backgroundRepeat = "no-repeat";
						});
	});
	function traineeRegistration() {
		var flag = validation01();
		if (flag) {
			try {
				$.ajax({
							url : './registration/trainee',
							type : 'post',
							dataType : 'json',
							data : JSON.stringify({
								"traineetype" : $('#selType').val(),
								"corporatename" : $('#name2').val(),
								"name" : $('#fname').val(),
								"contact" : $('#mob').val(),
								"email" : $('#email').val(),
								"password" : $('#pass1').val(),
								"cnfpassword" : $('#cpass').val()
							}),
							contentType : "application/json",
							success : function(response) {
								if (response.errorMsg) {
									$.map(
										response.errorMsg,
									  		function(val, key) {
												if (key == "traineetype")
													$('#error00').text(val);
												else if (key == "corporatename")
													$('#error00').text(val);
												else if (key == "name")
													$('#error01').text(val);
												else if (key == "contact")
													$('#error02').text(val);
												else if (key == "email")
													$('#error04').text(val);
												else if (key == "password")
													$('#error04').text(val);
													});
								} else if(response.successMessage) {
									dologin($('#email').val(),$('#pass1').val());
								}else{
									console.log(response);
								}
							}
						});
			} catch (ex) {
				alert("Exception: " + ex);
			}
		}
	}
</script>
<script type="text/javascript">
function dologin(email,pass)
{
	$.ajax({
		url : "${ctx}/searchmytraining/j_spring_security_check",
		type : "POST",
		beforeSend : function(xhr) {
			xhr.withCredentials = true;
		},
		data : {username:email, password:pass},
		success : function(response) {
				console.log(response.success);
				if (!response.success) {
					$('#auth_error_mesg1').html(response.message);
					$("#auth_error_div1").show();
				} else if (response.success) {
					$('#url').val(email);
					$("#loginformhidden").attr("action",
							"${ctx}/searchmytraining" + response.page);
					$('#loginformhidden').submit();
				}
		},
		error : function(response) {
			console.log(response);
		},
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
<script type="text/javascript">
	$(function() {
	 randString(5);
	});
</script>

</head>
<body>

	<div class="reg_form">
		<div class="head">
			<img src="<%=request.getContextPath()%>/resources/images/user_1.png"
				alt="register">
		</div>
		<form action="#" name="registerFrm" method="post"
			onsubmit="return checkForm(this);">
			<h2>Registration</h2>
			<div class=type>

				<select id="selType" autofocus>
					<option value="0">--Trainee Type---</option>
					<option value="Corporate">Corporate</option>
					<option value="Individual">Individual</option>
				</select>
			</div>
			<span id="error00" class="errorm"><text>.</text></span>
			<div id="Answers">
				<div id="Corporate" style="display: none; margin-bottom: 20px;">
					<input type="text" id="name2" name="copname"
						placeholder="Corporate Name" />
				</div>
			</div>
			<div class="name">
				<input type="text" autocomplete="off" name="fname" id="fname"
					placeholder="Full Name">
			</div>
			<span id="error01" class="errorm"><text>.</text></span>
			<%-- <img src ="<%=request.getContextPath()%>/resources/images/error.png" alt="error"/> --%>
			<div class="contact">
				<input type="text" id="mob" autocomplete="off" name="mob"
					placeholder="Contact No." onkeypress="return validate02(event)">

			</div>
			<span id="error02" class="errorm"><text>.</text></span>
			<div class="mailto">
				<input type="text" id="email" autocomplete="off" name="email"
					placeholder="Email Id">
			</div>
			<span id="error03" class="errorm"><text>.</text></span>
			<div class="password">
				<input type="password" id="pass1" autocomplete="off" name="pass1"
					placeholder="Enter Password" />
			</div>
			<div id="Pass-chek01">
				<div id="meter01"></div>
				<div id="meter02"></div>
				<div id="meter03"></div>
			</div>


			<div class="password">
				<input title="Please enter the same Password as above"
					type="password" id="cpass" autocomplete="off" name="cpass"
					placeholder="Confirm Password" />

			</div>
			<span id="error04" class="errorm"><text>.</text></span>
			<div class="rcpatcha">
			
			<input style="margin: 0 auto;" type="text" id="rcapcthar" name="" placeholder="Enter Captch">
			
			</div>
			<div class="cpatcha">
			
			<div class="Ccode" id="captch"></div>
			<div class="refresh">
			<input type="button" id="refreshc" onclick="randString(5);" /> 
			
			</div>
			
			</div>

			<div class="sign">
				<input type="button" name="Submit" value="Submit"
					onclick="traineeRegistration();">
				<input type="reset" name="Cancel" value="Reset" class="b-close1">
			</div>

		</form>
	</div>

<form id="loginformhidden" style="display: none" method="POST">
		<input type="hidden" id="url" name="username" value="" />
</form>
</body>
</html>