<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/date.js"></script>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/screen.css"
	type="text/css"> --%>

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


$('#fdate,#Tdate').datepicker();
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
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
						function Validate() {
							var image = document.getElementById("fileupload").value;
							if (typeof image === 'undefined' && image == '' && image == null) {
								alert("Please enter Image Path");
								document.getElementById("image").focus();
								return false;
							}

						}
						$(document).ready(function() {
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


</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">ADD Calendar</h3>
		<div class="acord_cont">
			<form id="Add_calender" method="post" enctype="multipart/form-data"
				action="uploadFile" onSubmit="return Validate();">

				<div class="title">
					<label>Title:</label> <input type="text" id="ctitle"
						placeholder="Title" name="ctitle" /> <span id="c1"></span>
				</div>
				<div class="fdate">
					<label>From Date:</label> <input type="text" id="Fdate"
						placeholder="Start Date" name="Fdate" />

				</div>
				<div class="Tdate">
					<label>To Date:</label> <input type="text" id="Tdate"
						placeholder="End Date" name="Tdate" />
				</div>
				<div class="Industry">
					<label>Industry Type:</label> <select id="Itype" name="Itype">
					</select>
				</div>
				<div class="Ctype">
					<label>Type Of Calendar:</label> <select id="Ctype" name="Ctype">
						<option>Calendar Type</option>
						<option value="Seminar">Seminar</option>
						<option value="Workshop">Workshop</option>
						<option value="Etc">Etc</option>
					</select>
				</div>
				<div class="price">
					<label>Price:</label> <input type="text" id="cPrice"
						placeholder="price" name="cPrice" />
				</div>
				<div class="price">
					<label>Place:</label> <input type="text" id="place" name="place" />
				</div>
				<div class="description">
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
					<input type="submit" id="Cadd" value="Add">
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