<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Aview.css"
	type="text/css">
	<link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"> 
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css"
	type="text/css">
	<script
	src="<%=request.getContextPath()%>/resources/js/modernizr-1.5.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<title>view</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#edit").click( function(e){
	$(".input-field").removeAttr('disabled');
	$(".select-field").removeAttr('disabled');
	$("#update").css("visibility", 'visible');
		
	});
	
	$("#update").click( function(e){
		alert("fgdgfd");
	});

	
});


</script>


</head>
<body>
<div class="headbar"><p><a href="#">Back To Home</a></p>
<h1>SearchMyTraining</h1>

</div>
<div class="view_wrapar">
<div class="form_wrapar">
<h1>Calendar Details</h1>
<a href="#" id="edit"><i class=" fa fa-edit"></i> Edit</a>
<form action="#">
<label for="Tid"><span>Training Id:</span><input type="text" class="input-field" name="training_id" value="" disabled="true"/></label>
<label for="Title"><span>Title:</span><input type="text" class="input-field" name="title" value="" disabled="true"/></label>
<label for="Code"><span>Code:</span><input type="text" class="input-field" name="Code" value="" disabled="true"/></label>
<label for="start_date"><span>Start Date:</span><input type="text" class="input-field" name="start-date" value="" disabled="true"/></label>
<label for="End_date"><span>End Date:</span><input type="text" class="input-field" name="end-date" value="" disabled="true"/></label>
<label for="Price"><span>Price:</span><input type="text" class="input-field" name="price" value="" disabled="true"/></label>
<label for="Download"><span>Download:</span><a href="#"><i class="fa fa-download fa-1x"></i> Calender</a></label>
<label for="Type"><span>Type:</span><select name="type" class="select-field" disabled="true">
<option value="Conference">Conference:</option>
<option value="Seminar">Seminar:</option>
<option value="Workshop">Workshop:</option>

</select></label>

<label for="create"><span>Cerated On:</span><p>15/05/2015</p></label>
<label for="Upadate"><span>Updated On:</span><p>15/05/2015</p></label>
<label for="Updatedb"><span>Updated By:</span><p>Admin</p></label>
<input type="button" id="update" name="update" value="UPDATE" disabled="true">
</form>
</div>

</div>
<div class="view_footer"><p>&copy Copyright 2015 - All Rights Strictly Reserved -
				Softinfology Pvt. Ltd.<p></div>
</body>
</html>