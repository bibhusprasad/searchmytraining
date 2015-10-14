<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/cdate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/Validations/common.js"></script>	

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/Validations/calender_validation.js"></script>

<script type="text/javascript">
$('#acord2').accordion({
	collapsible : true
});
$.get('Resent', function(data) {
    $('#resent').append(data);
});

$.get('View', function(data) {
    $('#viewall').append(data);
});

$('#Fdate,#Tdate').datepicker();
</script>
<script type="text/javascript">
	$(document)
			.ready(function() {
					$('.tagRemove').click(function(event) {
						alert("see you")
						event.preventDefault();
						$(this).parent().remove();
					});
					$('ul.tags').click(function() {
						$('#tags-field').focus();
					});
						$('#tags-field')
							.keypress(
									function(event) {
										if (event.which == '188') {
                                                alert("fggf");
										console.log(event.which);
												if ($(this).val() != '') {
													$(
														'<li class="addedTag">'
																+ $(this)
																		.val()
																+ '<span class="tagRemove" onclick="$(this).parent().remove();">x</span><input type="hidden" value="'
																+ $(this)
																		.val()
																+ '" name="tags[]"></li>')
														.insertBefore(
																'.tags .tagAdd');
												$(this).val('');
												}
											}
										});
					});
						
	
						
</script>

<script type="text/javascript">

</script>

</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">ADD Calendar</h3>
		<div class="acord_cont">
			<form id="Add_calender" method="post" enctype="multipart/form-data">

				
				<div class="title">
					<label><b>Course Title</b><font color="red">*</font></label><input type="text" id="ctitle" 
						placeholder="Title" name="ctitle" maxlength="100"/>
						<span id="errorctitle" class="errorm"></span>
				</div>
				
				<div class="Ctype">
					<label><b>Type Of Calendar</b><font color="red">*</font></label> <select id="Ctype" name="Ctype">
					</select>
					<span id="errorCtype" class="errorm"></span>
				</div>
				<div class="Industry">
					<label><b>Industry Type</b><font color="red">*</font></label> <select id="Itype" name="Itype">
					</select>
					<span id="errorItype" class="errorm"></span>
				</div>
				
				<div class="price">
					<label><b>Price</b></label> <input type="text" id="cPrice"
						placeholder="Price" name="cPrice" onkeypress="return isNumber(event)"/>
						<input type="checkbox" id="cpBox" name="cpBox" /><span>Click to Hide Price</span>
				</div>
				
				<div class="date">
				<label><b>From Date</b><font color="red">*</font></label> <input type="text" id="Fdate" name="Fdate"/> 
				<label><b>To Date</b><font color="red">*</font></label> <input type="text" id="Tdate" name="Tdate"/>
				<span id="errorFdate" class="errorm"></span>
				<span id="errorTdate" class="errorm"></span>
				</div>
								
				<div class="Ctime">
					<label><b>Time</b><font color="red">*</font></label><select id="Chour" name="Chour">
						<option>HH</option></select>
					<select id="Cmin" name="Cmin">
						<option>MM</option>
					</select>
					<select id="Campm" name="Campm">
						<option value="am">AM</option>
						<option value="am">PM</option>
					</select>
					<span id="errorChour" class="errorm"></span>
				</div>
				<div class="caddress1">
					<label><b>Address Line1</b></label><input type="text" name="Caddress1" id="Caddress1" height="30"/>
					<span><input type="checkbox" id="autoPopulateAddress">Auto Populate Address</span>
				</div>
				
				<div class="caddress2">
					<label><b>Address Line2</b></label><input type="text" name="Caddress2" id="Caddress2" height="30"/>
				</div>
				
				<div class="Clmark">
					<label><b>Landmark</b></label><input type="text" name="Clmark" id="Clmark"/>
				</div>
				
				<div class="ccity">
					<label><b>City</b><font color="red">*</font></label><input type="text" name="place" id="place"/>
					<span id="errorplace" class="errorm"></span>
				</div>
				
				<div class="cstate">
					<label><b>State<b></b><font color="red">*</font></label> <select id="state" name="state">
					</select>
					<span id="errorstate" class="errorm"></span>
				</div>
				
				<div class="ccountry">
					<label><b>Country</b></label><input type="text" name="Ccountry" id="Ccountry" value="India" readonly/> 
				</div>
				
				<div class="cpincode">
					<label><b>Pin Code</b></label><input type="text" name="Cpincode" id="Cpincode" maxlength="6" onkeypress="return isNumber(event)"/> 
				</div>
				
				<div class="cquickview">
					<label><b>Programme brief for Quick View Section</b><font color="red">*</font></label>
					<input type="text" id="Qview" name="Qview"/>
					<span id="errorQview" class="errorm"></span>
				</div>
				
				<div class="cprogover">
					<label><b>Programme Overview</b><font color="red">*</font></label><input type="text" id="Pview" name="Pview"/>
					<span id="errorPview" class="errorm"></span>
				</div>
				
				<div class="ctakeaway">
					<label><b>Your take away from the programme</b></label><input type="text" id="Taway" name="Taway"/>
				</div>
				
				<div class="cmethod">
					<label>Training Methodology:</label><input type="text" id="Tmethod" name="Tmethod"/>
				</div>
				
				<div class="cattend">
					<label>Who should attend:</label><input type="text" id="wsa" name="wsa"/>
				</div>
				
				<div class="ckeyword">
					<label><b>Keywords</b><font color="red">*</font></label><input type="text" id="kword" name="kword"/>
					<span id="errorkword" class="errorm"></span>
				</div>
								
				<div class="cfacdetails">
					<label><b>Faculty Details for this programme</b></label><input type="text" id="fdetails" name="fdetails"/>
				</div>
				
				<div class="chowtoregi">
					<label><b>How to Register</b></label><input type="text" id="helpregister" name="helpregister"/>
				</div>
				
				<div class="ctrainprov">
					<label><b>Details of Training Providers</b></label><input type="text" id="TPdetails" name="TPdetails"/>
				</div>

				<div class="submit">
					<input type="button" id="PPC" value="Preview & Post Calendar" onclick="previewC();"/>
					<input type="button" id="SPL" value="Save & Post Later" onclick="postCalender();"/>
				</div>
				<label><font color="red">*</font>Indicates mandatory field</label>
				<input type="hidden" name="userType" value="trainer">
			</form>
		</div>

		<h3 class="acord_head" onclick="recenAddedCalendert();">Recently
			Added Calendar</h3>
		<div class="acord_cont">
			<div id="resent"></div>
		</div>
		<h3 class="acord_head" onclick="recenAddedCalenderat();">View All
			Calendar</h3>
		<div class="acord_cont">
			<div id="viewall"></div>
		</div>
	</div>
	<input type="hidden" id="HCaddress1" value="">
	<input type="hidden" id="HCaddress2" value="">
	<input type="hidden" id="HClmark" value="">
	<input type="hidden" id="HCpincode" value="">
	<input type="hidden" id="Hcity" value="">
	<input type="hidden" id="Hstate" value="">
	<input type="hidden" id="cityId" value="">
	<input type="hidden" id="stateId" value="">
	<input type="hidden" id="cities" value="">
	<input type="hidden" id="states" value="">
</body>
</html>

