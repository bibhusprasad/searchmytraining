<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Training Enquiry</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/Validations/TEvalidation.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/work/trainingenquiry.js"></script>
<script type="text/javascript">
function randString(x){
    
	 var text = " ";

	    var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < x; i++ )
	        text += charset.charAt(Math.floor(Math.random() * charset.length));
	    
          $(".Ccode").html(text);
	
		
	}

</script>
</head>
<body>

		<div class="reg_form">
			<div class="head">
				<img
					src="<%=request.getContextPath()%>/resources/images/enquiry-icon.png"
					alt="register">
			</div>
			<form id="enquiryform" name="myform" method="post"
				onsubmit="return TEvalidate();">
				<h2>Training Enquiry</h2>
				<div class="fname">
					<input type="text" autocomplete="off" name="firstname"
						id="firstname22" placeholder="Full Name" autofocus>
				</div>
				<span id="error29" class="errorm"><text>.</text></span>
				<!-- <div class="lname">
					<input type="text" autocomplete="off" name="lname" id="lname22"
						placeholder="Last Name">
				</div> -->
				<span id="error30" class="errorm"><text>.</text></span>
				<div class="title">
					<input type="text" autocomplete="off" name="title" id="title22"
						placeholder="Subject / Title">
				</div>
				<span id="error31" class="errorm"><text>.</text></span>
				<div class="city">
					<!--  <input type="text" autocomplete="off" name="city" id="city22" placeholder="City"> -->
					<select id="city22">
						<option value="0" selected>--Select--</option>
						<c:forEach var="city" items="${cities}">
							<option value="${city.cityId}">${city.cityName}</option>
						</c:forEach>
					</select>
				</div>
				<span id="error32" class="errorm"><text>.</text></span>
				<div class="mailto">
					<input type="text" autocomplete="off" name="email" id="email22"
						placeholder="Email Id">
				</div>
				<span id="error33" class="errorm"><text>.</text></span>
				<div class="contact">
					<input type="text" autocomplete="off" name="mob" id="mob22"
						placeholder="Contact No." onkeypress="return TEValidate(event)">
				</div>
				<span id="error34" class="errorm"><text>.</text></span>
				<div class="req">
					<textarea name="requirements" id="requirements22" class="require"
						placeholder="Requirement Description"></textarea>
				</div>
				<div class="rcpatcha1">

					<input  type="text" id="frcapch" name=""
						placeholder="Enter Captch">

				</div>
				<div class="cpatcha1">

					<div class="Ccode" id="captchf"></div>
					<div class="refresh1">
						<input type="button" id="refreshc" onclick='randString(5);' />

					</div>

				</div>

				<div class="sign">
					<input type="button" name="Submit" value="Send"
						onclick="enquiry('${pageContext.request.contextPath}/request/trainingenquiry');">
					<input type="reset" name="Cancel" value="Reset"
						class="cancel close1">
				</div>

			</form>
		</div>

</body>
</html>