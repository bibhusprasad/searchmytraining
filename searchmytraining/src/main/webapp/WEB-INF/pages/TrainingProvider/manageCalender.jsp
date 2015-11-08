<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/cdate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/jquery.tinyscrollbar.min.js"></script>

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
						<option value="true">posted and published calendars</option>
						<option value="false">Draft Calendars</option>
					</select> <span id="errorCtype" class="errorm"></span>
				</div>
				<div class="submit">
					<input type="button" id="getCalender" value="getCalender" onclick="LoadCalenderDetails();"/>
				</div>
				<input type="hidden" name="userType" value="trainer">
			</form>
			<br><br><br><br>
			<div id="tabcontent" style="height: 300px;">
				<div id="home-content" class="contentblock">
					<div class="Calender_wrapar">
						<div id="calender_show" class="tablesorter">
							<div style="margin-right: 400px;">
								<span style="padding: 3px;">Title</span> <span style="padding: 3px;">Calendar
									Type</span> <span style="padding: 3px;">Start Date</span> <span style="padding: 3px;">End Date</span> 
									<span style="padding: 3px;">Posted
									Date</span> <span style="padding: 3px;">Status</span>
									
							</div>
						</div>
					</div>
				</div>
				<div class="panelContent" id="homeCalenderScroll">
					<div class="scrollbar">
						<div class="track">
							<div class="thumb">
								<div class="end"></div>
							</div>
						</div>
					</div>
					<div class="viewport">
						<div class="overview" id="calList"></div>
					</div>
				</div>
			</div>
			
		</div>

	</div>
	<div id="template" style="display: none;">
		<div>
			<span id="ctitle"></span> <span id="caltype"></span> <span
				id="startDate"></span> <span id="EndDate"></span> <span
				id="PostedDate"> </span> <span id="Status"></span>
				<span id="Edit" class="editcal" onclick="editCalender($(this));"><a href="#">EDIT</a></span>
				<span id="Delete" class="deletecal"><input type="checkbox" id="cpBox" name="cpBox" />Delete</span>
		</div>

	</div>
	<script type="text/javascript">
	function editCalender(caller){
		try {
			$.ajax({
						url : './calender/editCalender',
						type : 'post',
						dataType : 'json',
						data:caller.attr("calId"),									
						stringify : true,
						contentType : "application/json",
						success : function(response) {
							if(response.successMessage) {
								alert("hi");
								TCload();								
							}
						}
					});
		} catch (ex) {
			alert("Exception: " + ex);
		}
	}
	
	function TCload() {
		$("#home-content").load("./TPcalender", function(responseText, statusText, xhr)
		        {
		                if(statusText == "success")
		                        /* alert("Successfully loaded the content!"); */
		                if(statusText == "error")
		                        alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
		        });
		
	}
	
	$('body').on('click', '.deletecal', function (e){
		try {
			$.ajax({
						url : './calender/deleteCalender/'+$(this).attr("calId"),
						type : 'post',
						dataType : 'json',
						stringify : true,
						contentType : "application/json",
						success : function(response) {
							$('div[id=' +$(this).attr("calId")+']').remove();
						}
					});
		} catch (ex) {
			alert("Exception: " + ex);
		}
	});
	
		function LoadCalenderDetails() {
			try {
					$.ajax({
								url : './calender/getCalenderDetails',
								type : 'post',
								dataType : 'json',
								stringify : true,
								data:JSON.stringify({
										"calenderType" : $('#Calendertype').val(),
										"fromDate" : $('#Sdate').val(),
										"saveDraft" : $('#Status').val()									
										}),
								contentType : "application/json",
								success : function(response) {
									if(response.successMessage) {
										if(!isEmpty(response.data) && response.data.length>0){
											tempMarkup = $("#homeCalenderScroll #calList").clone();
									        tempMarkup.empty();
									        $('#calList').append(populateCalender(tempMarkup, response.data).html());
										}else{
											tempMarkup = $("#homeCalenderScroll #calList").clone();
									        tempMarkup.empty();
									        $('#calList').append("No result Found");
										}
										
									}else{
									}
								}
							});
				} catch (ex) {
					alert("Exception: " + ex);
				}
		}
		function isEmpty(value){
			return (value == null || value == 'undefined' || value =="");
		}
		function prettyDate(date) {
		    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
		                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

		    return months[date.getUTCMonth()] + ' ' + date.getUTCDate()+' '+date.getUTCyear();
		}
		function convertDate(value){
			var pubDate = new Date(value);
			var weekday=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
			var monthname=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
			var formattedDate = weekday[pubDate.getDay()] + ' ' + monthname[pubDate.getMonth()] + ' ' 
			                    + pubDate.getDate() + ', ' + pubDate.getFullYear()
			return formattedDate;
		}
				
		populateCalender = function (tempMarkup,response) {
			$.each(response,function(index,element) {
			var markup = $($("#template").html());
			$(markup).attr("id", element.calenderId);
			if(!isEmpty(element.courseTitle)){
				$(markup).find('#ctitle').html(element.courseTitle);
			}
			$(markup).find('#Edit').attr("calId", element.calenderId);
			$(markup).find('#Delete').attr("calId", element.calenderId);
			
			if(!isEmpty(element.calenderType)){
				$(markup).find('#caltype').html(element.calenderType);
			}
			if(!isEmpty(element.fromDate)){
				$(markup).find('#startDate').html(convertDate(element.fromDate));
			}
			if(!isEmpty(element.toDate)){
				$(markup).find('#EndDate').html(convertDate(element.toDate));
			}
			if(!isEmpty(element.updatedOn)){
				$(markup).find('#PostedDate').html(convertDate(element.updatedOn));
			}
			if(element.saveDraft){
				$(markup).find('#Status').html("Posted");
			}else{
				$(markup).find('#Status').html("Saved As Draft");
			}
			tempMarkup.append(markup);
		});
		return tempMarkup;
		};
	</script>
</body>
</html>