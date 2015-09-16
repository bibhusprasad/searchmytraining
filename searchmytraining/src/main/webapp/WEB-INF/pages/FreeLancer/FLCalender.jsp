<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/FreeLancerProfile.css"
	type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/date.js"></script>

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
<%--  function recenAddedCalender() {

	$("#viewall").load("<%=request.getContextPath()%>/View",function(responseText, statusText, xhr) {
					if (statusText == "success")
					 alert("Successfully loaded the content!"); 
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});
	
	}  --%>
function userAllCalender() {
	$("#abc").load("<%=request.getContextPath()%>/getUserCalender",
				function(responseText, statusText, xhr) {
					if (statusText == "success")
						/* alert("Successfully loaded the content!"); */
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});

	}
</script>

<script type="text/javascript">
	$(document).ready(function() {

		function Validate() {
			var image = document.getElementById("file").value;
			if (image == '') {
				alert("Please enter Image Path");
				document.getElementById("image").focus();
				return false;
			}

		}
		$('#Fdate,#Tdate').datepicker();
		loadIndustries();
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
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('.tagRemove').click(function(event) {
							alert("see you");
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
</head>
<body >
	<div id="acord2" class="acord">
		<h3 class="acord_head">ADD Calender</h3>
		<div class="acord_cont">
			<form id="Add_calender" name="frm" method="post"
				enctype="multipart/form-data" action="uploadFile"
				onSubmit="return Validate();">

				<div class="title">
					<label>Title:</label> <input type="text" id="ctitle"
						placeholder="Title" autocomplete="off" name="ctitle" />
						<span id="c1"></span>
				</div>
				<div class="fdate">
					<label>From Date:</label> <input type="text" id="Fdate"
						placeholder="Start Date" autocomplete="off" name="Fdate" /> 
						<span id="c2"></span>
				</div>
				<div class="Tdate">
					<label>To Date:</label> <input type="text" id="Tdate"
						placeholder="End Date" autocomplete="off" name="Tdate" /> 
						<span id="c3"></span>
				</div>
				<div class="Industry">
					<label>Industry Type:</label> 
					<select id="Itype" name="Itype">
						<!-- <option value="1">Industry Types</option>
						<option value="1">Technology</option>
						<option value="2">Business & Management</option>
						<option value="3">Engineering & Manufacturing</option>
						<option value="4">Health & Safety</option>
						<option value="5">Art & Craft & Sports</option>
						<option value="6">Certifications</option>
						<option value="7">Other</option> -->
					</select>
					<span id="c4"></span>
				</div>
				<div class="Ctype">
					<label>Type Of Calendar:</label> <select id="Ctype" name="Ctype">
						<option>Calendar Type</option>
						<option value="Seminar">Seminar</option>
						<option value="Workshop">Workshop</option>
						<option value="Etc">Etc</option>
					</select>
					<span id="c5"></span>
				</div>
				<div class="price">

					<label>Price:</label> <input type="text" id="cPrice"
						placeholder="price" autocomplete="off" name="cPrice" />
						<span id="c6"></span>
				</div>
				<div class="price">
					<label>Place:</label> <input type="text" id="place" name="place" />
					<span id="c7"></span>
				</div>
				<div class="description">
					<label>Description:</label> <input type="text" id="CDesc"
						placeholder="Description" autocomplete="off" name="CDesc" />
						<span id="c8"></span>
				</div>
				<div class="keyCode">
					<label>KeyCode:</label>
					<ul class="tags">

						<li class="tagAdd taglist"><input type="text" id="tags-field">
						</li>
					</ul>

				</div>
				<div class="browse">
					<label>Upload Calender:</label> <input id="uploadFile" 
						placeholder="Choose File" disabled="disabled" />
					<div class="fileUpload btn btn-primary">
						<span>Brouchure</span> <input type="file" class="upload"
							id="fileupload" name="fileUpload" accept="application/pdf" />
					</div>
					<script type="text/javascript">
						document.getElementById("fileupload").onchange = function() {
							document.getElementById("uploadFile").value = this.value;
						};
					</script>


				</div>
				<div class="submit">
					<input type="submit" id="Cadd" value="Add" >
				</div>
				<input type="hidden" name="userType" value="freelancer">
			</form>
		</div>
		

		<h3 class="acord_head" onclick="recenAddedCalender();">Recentely Added Calendar</h3>
		<div class="acord_cont" >
		<div id="resent">
		
			
			</div>
</div>

	
	<h3 class="acord_head" onclick="recenAddedCalendera();"  >View All Calendar</h3>
		<div class="acord_cont">
			<div id="viewall">
		
			
			</div>
		
		</div>
	

</div>
</body>
</html>