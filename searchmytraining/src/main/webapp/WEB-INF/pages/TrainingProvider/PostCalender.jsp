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
	$(document).ready(function() {
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
						$('#Fdate,#Tdate').datepicker();
						loadIndustries();
						loadCalenderType();
						loadState();
						loadAddress();
						var editflag='${isEditFlag}';
						if (editflag) {
							populateCalendarDetails();
						}
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
							$('#states').val(JSON.stringify(jsonstates));
							$('#state').find('option').remove().end();
							$('#state').attr('enabled','true');
							$('#state').append(
									$("<option value='0'></option>").text("--Select--"));
							jQuery.each(jsonstates, function(index, item) {
								$('#state').append(
									$("<option></option>").text(this.stateName).val(this.stateId));
							});
						}
						function loadAddress(){
							var jTpaddress = '${address}';
							var jsonTpaddress = $.parseJSON(jTpaddress);
							$('#HCaddress1').val(jsonTpaddress[0].buildingNo);
							$('#HCaddress2').val(jsonTpaddress[0].street);
							$('#HClmark').val(jsonTpaddress[0].landmark);
							$('#HCpincode').val(jsonTpaddress[0].pincode);
							$('#Hcity').val(jsonTpaddress[0].city.cityName);
							$('#Hstate').val(jsonTpaddress[0].city.state.stateName);
							$('#cityId').val(jsonTpaddress[0].city.cityId);
							$('#stateId').val(jsonTpaddress[0].city.state.stateId);
						}

						function loadStatelist(){
							var oldstates=JSON.parse($('#states').val());
							$('#state').find('option').remove().end();
							$('#state').attr('enabled','true');
							$('#state').append($("<option value='0'></option>").text("--Select--"));
							$.each(oldstates, function (index, field) {
								$('#state').append($("<option></option>").text(field.stateName).val(field.stateId));
							});
							
						}
						
						function formatDate(dateObject){
							var d = new Date(dateObject);
							var day = d.getDate();
							var month = d.getMonth()+1;
							var year = d.getFullYear();
							if (day < 10) {
								day = "0" + day;
							}
							if (month < 10) {
								month = "0" + month;
							}
							var date = day + "/" + month + "/" + year;
							return date;
						}
						
						function populateCalendarDetails(){
							var calenderList = '${calenderList}';
							var editflag = '${isEditFlag}';
							var calenders = $.parseJSON(calenderList);
							var calender = calenders[0];
							console.log(editflag);
							$('#ctitle').val(calender.courseTitle);
							$('#Ctype').val(calender.calenderType);
							
							$('#Itype').val(calender.industryId.trnIndstrId);
							$('#cPrice').val(calender.price);
							//"saveDraft" : false;
							$('#cpBox').val(calender.showPrice);
							$('#Fdate').val(formatDate(calender.fromDate));
							$('#Tdate').val(formatDate(calender.toDate));
							
							$('#isEdit').val(editflag);

							var time = calender.time;
							var timeString = time.split(":");
							$('#Chour').val(timeString[0]);
							$('#Cmin').val(timeString[1]);
							$('#Campm').val(timeString[2]);
							
							$('#Caddress1').val(calender.addressLine1);
							$('#Caddress2').val(calender.addressLine2);
							$('#Clmark').val(calender.landmark);
							$('#place').val(calender.cityName);
							$("#state").val(calender.stateId.stateId);
							$('#Ccountry').val(calender.countryId.countryName);
							$('#Cpincode').val(calender.pincode);
							$('#Qview').val(calender.trngQuickView);
							$('#Pview').val(calender.trngOverView);
							$('#Taway').val(calender.trngTakeAway);
							$('#Tmethod').val(calender.trngMethodology);
							$('#wsa').val(calender.trngAttandant);
							$('#kword').val(calender.trainingKey);
							$('#fdetails').val(calender.facultyDetails);
							$('#helpregister').val(calender.howtoregister);
							$('#TPdetails').val(calender.detailsOfProvider);
							 
							
						}
						
</script>

<script type="text/javascript">
$('body').on('click', '#autoPopulateAddress', function (e) {	 
if($('#autoPopulateAddress').attr('checked')){
	$('#Caddress1').val($('#HCaddress1').val());
	$('#Caddress2').val($('#HCaddress2').val());
	$('#Clmark').val($('#HClmark').val());
	$('#Cpincode').val($('#HCpincode').val());
	$("#place").val($('#Hcity').val());
	$("#state").html("<option value="+$('#stateId').val()+">"+$('#Hstate').val()+"</option>");
}else{
	$('#Caddress1').val('');
	$('#Caddress2').val('');
	$('#Clmark').val('');
	$('#place').val('');
	$('#Cpincode').val('');
	loadStatelist();
}
	
});
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

function previewC() {
	var flag = validatePostCalenderOnSubmit();
	var hour = $('#Chour').val();
	var min = $('#Cmin').val();
	var ampm = $('#Campm').val();
	var allTime = hour+":"+min+":"+ampm;
	console.log($('#isEdit').val());
	if (flag) {
		try {
			$.ajax({
						url : './calender/previewCalender',
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
								"detailsOfProvider" : $('#TPdetails').val(),
								"isEdit" :$('#isEdit').val()
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
								if(response.previewCal){
									PreviewCal();
								}
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

function postCalender() {
	var flag = validatePostCalenderOnSubmit();
	var hour = $('#Chour').val();
	var min = $('#Cmin').val();
	var ampm = $('#Campm').val();
	var allTime = hour+":"+min+":"+ampm;
	if (flag) {
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
								"detailsOfProvider" : $('#TPdetails').val(),
								"isEdit" :$('#isEdit').val()
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
								uploadCalender();
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
function PreviewCal() {
	$("#home-content").load("./Pcalender", function(responseText, statusText, xhr){
	                if(statusText == "success"){
						console.log("manage calender loaded successfully");
			        }
	                if(statusText == "error"){
	                	console.log("manage calender loading failed");   
		            }
	        });
}

function uploadCalender() {
	$("#home-content").load("./success/calender", function(responseText, statusText, xhr){
	                if(statusText == "success"){
						console.log("manage calender loaded successfully");
			        }
	                if(statusText == "error"){
	                	console.log("manage calender loading failed");   
		            }
	        });
}

function getIndSubCat() {
		var id = $("#Itype").val();
		$.ajax({
			type : "POST",
			url : "/searchmytraining/common/getIndustryCategory",
			dataType : 'json',
			data : "id=" + id,
			success : function(response) {
				$('#indSubCat').html('');
				jQuery.each(response, function(index, item) {
					$('#indSubCat').append(this.trnIndstrCatId+" "+this.indstrCatName+"<div></div>");
				});
				$('#indSubCat').attr("style", "display:block;");
			},
		});
	}

/* function industrySubCategory() {
	var subid = $('#industrycatid').val();
	$.ajax({
		type : "POST",
		url : "/searchmytraining/common/getIndustrySubCategory",
		dataType : 'json',
		data : "subid=" + subid,
		success : function(response) {
			$('#industrysubcatid').find('option').remove().end();
			$('#industrysubcatid').attr('enabled', 'true');
			$('#industrysubcatid').append(
					$("<option value='0'></option>").text("--Select--"));
			jQuery.each(response, function(index, item) {
				$('#industrysubcatid').append(
						$("<option></option>").text(this.indstrSubCatName).val(
								this.trnIndstrSubCatId));
			});
		},
	});
} */
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
				<div class="Industry" onchange="getIndSubCat();">
					<label><b>Industry Type</b><font color="red">*</font></label> <select id="Itype" name="Itype">
					</select>
					<span id="errorItype" class="errorm"></span>
				</div>
				<div>
				<textarea rows="4" cols="7" id="indSubCat" style="display: none;"></textarea>
				</div>
				<div>
				<textarea rows="4" cols="7" id="indSubsubCat" style="display: none;"></textarea>
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
					<label><b>Time</b><font color="red">*</font></label>
					<select id="Chour" name="Chour">
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
	<input type="hidden" id="isEdit" value="">
	 
</body>
</html>

