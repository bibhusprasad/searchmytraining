<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>
</head>
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );
});

</script>
<body>
	<div id="pop_up_box_11">
		<a class="b-close close1"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"></a>
		<div class="form_wrapar">
		<div class="head">
                    <img src="<%=request.getContextPath()%>/resources/images/contact.png" alt="register">
                </div>
		
		<form action="./getContacted">
		     <h1>Get Contacted</h1>
		     <input type="text" id="Inst_name" name="Inst_name" value="" Placeholder="Name" autofocus/>
			<input type="email" id="Inst_email" name="Inst_email" value="" Placeholder="Email"/>
			<input type="text" id="Inst_contact" name="Inst_contact" value="" Placeholder="Contact"/>
			<textarea rows="4" cols="5" Placeholder="Enquiry About"></textarea>
			<h3>(Max 150 Character) </h3>
			
		      <input type="button" value="Register" onClick="giveLink('getContacted')"/>
		      <input type="button" value="Reset" name="">
			
		</form>
		</div>	
	</div>
</body>
</html>