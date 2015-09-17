<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login SMT</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/modernizr-1.5.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/combine.css"
	media="all" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/LogIn.css"
	media="all" type="text/css">
<script type="text/javascript">
	$(window).scroll(function() {
		if ($(window).scrollTop() >= 10) {
			$('.header').addClass('fixed_header');
		} else {
			$('.header').removeClass('fixed_header');
		}
	});

	function randString(x) {

		var text = " ";

		var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

		for (var i = 0; i < x; i++)
			text += charset.charAt(Math.floor(Math.random() * charset.length));

		$(".Ccode").html(text);

	}
</script>
<script type="text/javascript">
	function myfunc() {
		/* var email = $('#username').val();
		$('#formemailid').val(email);
		var email1 = $('#formemailid').val();
		if (email == "") {
			$("#username").focus();
			$("#username").css('border-color', 'red');
			$("#auth_error_div_emailreq").html('Email Id Required');
		} else { */
			
			$("#hiddenform").submit();
			
		//}
	}
</script>
</head>

<body>

	<%@include file="../layouts/Header.jsp"%>

	<div class="Log_container">
		<div class="Log_warapar">
			<div class="log_bar">
				<div class="form_container ">
					<h1>Sign In</h1>
					
					<%-- <c:if test="${'true' eq param.logout}">
						<div style="color: blue">
							Logout successful!!!<br />

						</div>
					</c:if>
					<c:if test="${'true' eq param.access_denied}">
						<div style="color: blue">
							Access Denied!!!<br />

						</div>
					</c:if> --%>
					<div class="errormsg" id="auth_error_div1">
					<span
						class="error_msg_auth" id="auth_error_mesg1"></span>
					</div>

					<form id="#loginForm" action="#">
						<div class="user">
							<input id="username" type="text" name="username"
								placeholder="  User or Email Address">

						</div>
						<div class="pass">
							<input id="password1" type="password" name="password" placeholder="  Password">
						</div>

						<div class="submit">
							<input id="login" type="button" value="Sign In" onclick="dologin();">
							 <a	id="forgetpasslinkid1" href="${pageContext.request.contextPath}/forgotPwd" >Forgot Password </a>
						</div>

					</form>
					<div class="social">
						<h1>Connect With Us:</h1>
						<ul>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/face.png"></a>
							</li>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/google.png"></a></li>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/in.png"></a></li>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/pin.png"></a></li>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/twit .png"></a></li>
							<li><a href="#"><img alt="facebook"
									src=" <%=request.getContextPath()%>/resources/images/social/yout.png"></a></li>
						</ul>
					</div>
					<div class="Nuser">
						<p>Not Account Yet ?</p>
						<a href="#">Sign Up</a>
					</div>
				</div>
			</div>
			<div class="advertise"></div>
		</div>
	</div>
	<form id="loginformhidden" style="display: hidden" method="POST">
		<input type="hidden" id="url" name="username" value="" />
	</form>
	<form id="hiddenform"
		action="${pageContext.request.contextPath}/forgotPwd" method="POST">
		<input id="formemailid" type="hidden" name="username" />
	</form>
	<%@include file="../layouts/footer.jsp"%>
</body>
<script type="text/javascript">
function dologin()
{
	
	var username = $("#username").val();
	var pass = $("#password1").val();
	
	$.ajax({
		url : "${ctx}/searchmytraining/j_spring_security_check",
		type : "POST",
		beforeSend : function(xhr) {
			xhr.withCredentials = true;
		},
		data : {username:$("#username").val(), password:pass},
		success : function(data, status) {
			if (data != null) {
				if (data.success == false) {
					alert("inside success false");
					$('#auth_error_mesg1').html(data.message);
					$("#auth_error_div1").show();
				} else if (data.success == true) {
					alert("inside success false");
					$('#url').val(username);
					$("#loginformhidden").attr("action",
							"${ctx}/searchmytraining" + data.page);
					$('#loginformhidden').submit();
				}
			}
		},
		error : loginFailed
	});
}
	/* $("#login").click(
			function(e) {
				// e.preventDefault();
				
			}); */
</script>
</html>