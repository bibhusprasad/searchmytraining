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
						
						$(document).ready(function() {
							$('#Fdate,#Tdate').datepicker();
							loadIndustries();
							loadCity();
							loadCalenderType();
							loadState();
						});
						
						function loadIndustries()
						{
							var industries = '${industries}';
							var jsonindustries = $.parseJSON(industries);
							$('#Itype').find('option').remove().end();
							$('#Itype').attr('enabled', 'true');
							$('#Itype').append(
									$("<option value='0'></option>").text("--Select--"));
							jQuery.each(jsonindustries, function(index, item) {
								$('#Itype').append(
									$("<option></option>").text(this.indstrName).val(this.trnIndstrId));
							});
						}

						function loadCity(){
							var cities = '${cities}';
							var jsoncities = $.parseJSON(cities);
							$('#place').find('option').remove().end();
							$('#place').attr('enabled','true');
							$('#place').append(
									$("<option value='0'></option>").text("--Select--"));
							jQuery.each(jsoncities, function(index, item) {
								$('#place').append(
									$("<option></option>").text(this.cityName).val(this.cityId));
							});
						}
						
						function loadCalenderType(){
							var calenderTypes = '${calenderTypes}';
							var jsoncalenderTypes = $.parseJSON(calenderTypes);
							$('#Ctype').find('option').remove().end();
							$('#Ctype').attr('enabled','true');
							$('#Ctype').append(
									$("<option value='0'></option>").text("--Select--"));
							jQuery.each(jsoncalenderTypes, function(index, item) {
								$('#Ctype').append(
									$("<option></option>").text(item).val(item));
							});
						}

						function loadState(){
							var states = '${states}';
							var jsonstates = $.parseJSON(states);
							$('#state').find('option').remove().end();
							$('#state').attr('enabled','true');
							$('#state').append(
									$("<option value='0'></option>").text("--Select--"));
							jQuery.each(jsonstates, function(index, item) {
								$('#state').append(
									$("<option></option>").text(this.stateName).val(this.stateId));
							});
						}
</script>

<script type="text/javascript">
function GetDateFormat(controlName) {
    if ($('#' + controlName).val() != "") {      
        var d1 = Date.parse($('#' + controlName).val());
        if (d1 == null) {
            alert('Date Invalid.');
            $('#' + controlName).val("");
        }
            var array = d1.toString('dd-MMM-yyyy');
            $('#' + controlName).val(array);
    }
}



function postCalender() {
	var flag = CalenderValidate();
	alert(flag);
	var trainingProviderCalenderDTO = null;
	var hour = $('#Chour').val();
	var min = $('#Cmin').val();
	var ampm = $('#Campm').val();
	var allTime = hour+":"+min+":"+ampm;

	if (true) {
		alert("hi");
		try {
			$.ajax({
						url : './calender/postCalender',
						type : 'post',
						dataType : 'json',
						stringify : true,
						data:JSON.stringify({
								"courseTitle" : $('#ctitle').val(),
								"calenderType" : $('#Ctype').val(),
								"industryId" : $('#Itype').val(),
								"price" : $('#cPrice').val(),
								"saveDraft" : false,
								"showPrice" :false,
								"fromDate" : $('#Fdate').val(),
								"toDate" : $('#Tdate').val(),
								"time" : allTime,
								"addressLine1" : $('#Caddress1').val(),
								"addressLine2" : $('#Caddress2').val(),
								"landmark" : $('#Clmark').val(),
								"city" : $('#place').val(),
								"state" : $('#state').val(),
								"country" : $('#Ccountry').val(),
								"pincode" : $('#Cpincode').val(),
								"trngQuickView" : $('#Qview').val(),
								"trngOverView" : $('#Pview').val(),
								"trngTakeAway" : $('#Taway').val(),
								"trngMethodology" : $('#Tmethod').val(),
								"trngAttandant" : $('#wsa').val(),
								"trainingKey" : $('#kword').val(),
								"facultyDetails" : $('#fdetails').val(),
								"howtoregister" : $('#helpregister').val(),
								"detailsOfProvider" : $('#TPdetails').val()
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

</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">ADD Calendar</h3>
		<div class="acord_cont">
			<form id="Add_calender" method="post" enctype="multipart/form-data">

				<div class="title">
					<label>Course Title:</label> <input type="text" id="ctitle"
						placeholder="Title" name="ctitle" maxlength="100"/>
				</div>
				<div class="Ctype">
					<label>Type Of Calendar:</label> <select id="Ctype" name="Ctype">
					</select>
				</div>
				<div class="Industry">
					<label>Industry Type:</label> <select id="Itype" name="Itype">
					</select>
				</div>
				
				<div class="price">
					<label>Price:</label> <input type="text" id="cPrice"
						placeholder="Price" name="cPrice" onkeypress="return isNumber(event)"/>
						<input type="checkbox" id="cpBox" name="cpBox" /><span>Click to Hide Price</span>
				</div>
				
				<div class="date">
				<label>From Date:</label> <input type="text" id="Fdate" name="Fdate"/> 
				<label>To Date:</label> <input type="text" id="Tdate" name="Tdate"/>
				</div>
								
				<div class="Ctime">
					<label>Time:</label><select id="Chour" name="Chour">
						<option>HH</option></select>
					<select id="Cmin" name="Cmin">
						<option>MM</option>
					</select>
					<select id="Campm" name="Campm">
						<option value="am">AM</option>
						<option value="am">PM</option>
					</select>
				</div>
				
				<div class="caddress1">
					<label>Address Line1:</label><input type="text" name="Caddress1" id="Caddress1" height="30"/>
				</div>
				
				<div class="caddress2">
					<label>Address Line2:</label><input type="text" name="Caddress2" id="Caddress2" height="30"/>
				</div>
				
				<div class="Clmark">
					<label>Landmark:</label><input type="text" name="Clmark" id="Clmark"/>
				</div>
				
				<div class="ccity">
					<label>City:</label> <select id="place" name="place">
					</select>
				</div>
				
				<div class="cstate">
					<label>State:</label> <select id="state" name="state">
					</select>
				</div>
				
				<div class="ccountry">
					<label>Country:</label><input type="text" name="Ccountry" id="Ccountry" value="India" readonly/> 
				</div>
				
				<div class="cpincode">
					<label>Pin Code:</label><input type="text" name="Cpincode" id="Cpincode" maxlength="6" onkeypress="return isNumber(event)"/> 
				</div>
				
				<div class="cquickview">
					<label>Programme brief for Quick View Section:</label>
					<input type="text" id="Qview" name="Qview"/>
				</div>
				
				<div class="cprogover">
					<label>Programme Overview:</label><input type="text" id="Pview" name="Pview"/>
				</div>
				
				<div class="ctakeaway">
					<label>Your take away from the programme:</label><input type="text" id="Taway" name="Taway"/>
				</div>
				
				<div class="cmethod">
					<label>Training Methodology:</label><input type="text" id="Tmethod" name="Tmethod"/>
				</div>
				
				<div class="cattend">
					<label>Who should attend:</label><input type="text" id="wsa" name="wsa"/>
				</div>
				
				<div class="ckeyword">
					<label>Keywords:</label><input type="text" id="kword" name="kword"/>
				</div>
								
				<div class="cfacdetails">
					<label>Faculty Details for this programme:</label><input type="text" id="fdetails" name="fdetails"/>
				</div>
				
				<div class="chowtoregi">
					<label>How to Register:</label><input type="text" id="helpregister" name="helpregister" onkeydown="isAlphaNumeric()"/>
				</div>
				
				<div class="ctrainprov">
					<label>Details of Training Providers:</label><input type="text" id="TPdetails" name="TPdetails"/>
				</div>
				
				<!-- <div class="description">
					<label>Description:</label> <input type="text" id="CDesc"
						placeholder="Description" name="CDesc" />
				</div>
				<div class="keyCode">
					<label>KeyCode:</label>
					<ul class="tags">

						<li class="tagAdd taglist"><input type="text" id="tags-field"
						name="tags-field" />
						</li>
					</ul>
				</div>
				
 -->				
 
 				<div class="browse">
					<label>Upload Calender:</label> <input id="uploadFile"
						placeholder="Choose File" disabled="disabled" />
					<span class="fileUpload btn btn-primary">
						<span>Brouchure</span> <input type="file" class="upload"
							id="fileupload" name="fileUpload" accept="application/pdf" />
					</span>
					<script type="text/javascript">
						document.getElementById("fileupload").onchange = function() {
							document.getElementById("uploadFile").value = this.value;
						};
					</script>
				</div>
				
				<div class="submit">
					<input type="button" id="PPC" value="Preview & Post Calendar"/>
					<input type="button" id="SPL" value="Save & Post Later" onclick="postCalender()"/>
				</div>
				
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
</body>
</html>