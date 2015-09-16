<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$('#acord3').accordion({
	collapsible : true
});
</script>
</head>
<body>
	<div id="acord3" class="acord">
							<h3 class="acord_head">Change Password</h3>
							<div class="acord_cont">
								<form action="#">
									<div class="oldpass">
										<label>Old Password :</label> <input type="password"
											name="name" />
									</div>
									<div class="newpass">
										<label>New Password :</label> <input type="password"
											name="name" />
									</div>
									<div class="conpass">
										<label>Confirm Password :</label> <input type="password"
											name="name" />
									</div>

									<div class=save>
										<input type="submit" value="Save" name="save" /> 
									</div>
								</form>
							</div>
						</div>
</body>
</html>