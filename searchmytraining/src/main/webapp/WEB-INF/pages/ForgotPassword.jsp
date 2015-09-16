<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Forgot Password</title>
<script type="text/javascript"
	src="./resources/js/jquery/jquery-1.10.2.js"></script>

<link rel="stylesheet" href="./resources/css/combine.css" media="all"
	type="text/css">
<link rel="stylesheet" href="./resources/css/LogIn.css" media="all"
	type="text/css">
<script type="text/javascript">
	$(document).ready(function(e) {
		$("#edit").hide();
		$("#otpMsg").hide();		
		var anyErrors =   ${validationErrs || error};		
		if (anyErrors){			
			$("#otpMsg").show();
			$("#edit").show();
			$("#hidebar").slideDown();
			$("#otp").attr('value', 'Resend');
			$("#Femail").attr('readonly', 'readonly');
		}
					

		//$("#Femail").removeAttr('disabled');
		$("#otp").on('click', function(e) {
			var otpbtn = $("#otp").attr('value');
			var url;
			if (otpbtn == 'Send OTP') {
				url = "${ctx}/searchmytraining/sendOTP";
			} else {
				url = "${ctx}/searchmytraining/resendOTP";
			}

			$.ajax({
				url : url,
				type : "POST",
				//data : {
				//	usremail : $("#Femail").val()
				//},
				data : $("#forgotPwdForm").serialize(),
				success : function(data, status) {
					if (data != null) {
						if (data.success == true) {
							$("#otpMsg").show();
							$("#edit").show();
							//$("#hidebar").slideDown();
							$("#hidebar").slideDown(0,function(){
					            alert("The slideUp() method is finished!");
					            $("#password.errors").remove();
								$("#otp.errors").remove();
					        });
							$("#otp").attr('value', 'Resend');
							$("#Femail").attr('readonly', 'readonly');
							
						}if (data.success == false) {
							alert("something wrong");
						}
					}
				},
				error : function() {
					alert("inside error");
				//TODO show error div
					//$("#otpMsg").text("something went wrong,Please contact helhdesk @22222222");
					//$("#otpMsg").show(); 
				}

			});
		});

		$("#edit").on('click', function(e) {
			$("#otpMsg").hide();
			$("#otp1").val("");
			$("#Newpass").val("");			 
			$("#otp").attr('value', 'Send OTP');
			$("#hidebar").slideUp();
			$("#Femail").removeAttr('readonly');
		});

		$("#fsubmit").on('click', function(e) {

			$("#forgotPwdForm").submit();

		});

	});
</script>

</head>

<body>


	<%@include file="../layouts/Header.jsp"%>

	<!-- ================================================================================================= -->
	<div class="Fpass_wrapar">
		<div class="Fpass_container">
			<h1>FORGOT YOUR PASSWORD ?</h1>
			<h3 id="otpMsg">A One Time Password Was Sent To Your Registered
				Email Id</h3>
			<form:form action="./handleForgotPwd" method="post"
				id="forgotPwdForm" modelAttribute="forgotPasswordBean">
				
				
				<div class="email">

					<form:input path="userName" type="text" id="Femail"
						placeholder="Email Id" />
					<form:errors path="userName" cssErrorClass="error" />
					<input type="button" id="edit" value="Edit"> 
					<input type="button" id="otp" value="Send OTP">

				</div>
				<!--  <p><strong>Get a Verification Code On</strong></p>
			    <div class="radio-option">
			       <input type="radio" name="r1" value="1" id="r1" onclick="recoveryoption1();">
			       <label for="r1">Phone</label>
			        <div class="hide-wrapar" id="hiden-box1">
			            <input type="text" id="frphone" name="frphone" value="" >
			            <p>Hint:Enter Your Registred Phone Number<p>
			        </div>
			    </div>
			     <div class="radio-option">
			       <input type="radio" name="r2" value="2" id="r2" onclick="recoveryoption();">
			       <label for="r1">Email</label>
			       
			    </div> -->
				<div class="hideable" id="hidebar">
					<div class="verifiaction">
						<form:input path="otp" type="text" id="otp1" name="otp" value=""
							placeholder="One Time Password" />
						<br><form:errors path="otp" cssErrorClass="error" />
					</div>
					<div class="Npass">
						<form:input path="password" type="password" autocomplete="off"
							id="Newpass" name="Newpass" value="" placeholder="New Password" />
						<br><form:errors path="password" cssErrorClass="error" />
					</div>
					<div class="vsubmit">
						<input type="button" id="fsubmit" value="Submit" />
					</div>
				</div>
			</form:form>
		</div>

	</div>

	<%@include file="../layouts/footer.jsp"%>
</body>

</html>