<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/cdate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/Validations/calender_validation.js"></script>

<script type="text/javascript">
	$('#Sdate').datepicker();

	$('#acord2').accordion({
		collapsible : true
	});
	$.get('Resent', function(data) {
		$('#resent').append(data);
	});
	$.get('View', function(data) {
		$('#viewall').append(data);
	});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.tagRemove').click(function(event) {
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
	$(document).ready(function() {
		loadCalenderType();
		$('#Sdate').datepicker();
	});
	function loadCalenderType() {
		var calenderTypes = '${calenderTypes}';
		var jsoncalenderTypes = $.parseJSON(calenderTypes);
		$('#Calendertype').find('option').remove().end();
		$('#Calendertype').attr('enabled', 'true');
		$('#Calendertype').append(
				$("<option value='0'></option>").text("--Select--"));
		jQuery.each(jsoncalenderTypes, function(index, item) {
			$('#Calendertype').append(
					$("<option></option>").text(item).val(item));
		});
	}
	function manageCalender() {
		try {
			$.ajax({
				url : './calender/getCalender',
				type : 'post',
				dataType : 'json',
				stringify : true,
				data : JSON.stringify({
					"detailsOfProvider" : $('#TPdetails').val(),
					"detailsOfProvider" : $('#TPdetails').val(),
					"detailsOfProvider" : $('#TPdetails').val()
				}),
				contentType : "application/json",
				success : function(response) {
					if (response.errorMsg) {
						$.map(response.errorMsg, function(val, key) {
							if (key == "traineetype")
								$('#error00').text(val);
						});
					} else if (response.successMessage) {
						dologin($('#email').val(), $('#pass1').val());
					} else {
						console.log(response);
					}
				}
			});
		} catch (ex) {
		}
	}
</script>
</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">Manage Calendar</h3>
		<div class="acord_cont">
			<form id="Get_calender" method="post">
				<div class="Ctype">
					<label><b>Type Of Calendar</b><font color="red">*</font></label> <select
						id="Calendertype" name="Calendertype">
					</select> <span id="errorCtype" class="errorm"></span>
				</div>
				<div class="date">
					<label><b>Start Date</b><font color="red">*</font></label> <input
						type="text" id="Sdate" name="Sdate" /> <span id="errorTdate"
						class="errorm"></span>
				</div>
				<div class="Ctype">
					<label><b>Status</b><font color="red">*</font></label> <select
						id="Status" name="Status">
						<option value="-1">--Select Type--</option>
						<option value="0">posted and published calendars</option>
						<option value="1">Draft Calendars</option>
					</select> <span id="errorCtype" class="errorm"></span>
				</div>
				<div class="submit">
					<input type="button" id="getCalender" value="getCalender" />
				</div>
				<input type="hidden" name="userType" value="trainer">
			</form>
		</div>
		<h3 class="acord_head">Manage Calendar</h3>
		<div class="acord_cont">
			<div id="tabcontent">
				<div id="home-content" class="contentblock">
					<div class="Calender_wrapar">
						<div id="calender_show" class="tablesorter">
							<div>
								<span style="padding: 2px;">Title</span> <span>Calendar
									Type</span> <span>Start Date</span> <span>End Date</span> <span>Posted
									Date</span> <span>Status</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="template" style="display: none;">
			<div>
				<span id="CTitle"></span> <span id="Calendar_Type"></span> <span
					id="Start_Date"></span> <span id="End_Date"></span> <span
					id="Posted_Date"></span> <span id="Status"></span>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//OnReady();
		});
	</script>
</body>
</html>