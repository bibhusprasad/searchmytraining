<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">Upload Calendar</h3>
		<div class="acord_cont">
			<form action="${pageContext.request.contextPath}/uploadCalender"
				method="post" id="form1" enctype="multipart/form-data">
				<div>Your Course Details saved Successfully.Please upload a Calender.</div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div class="browse" style="height: 200px;">
					<label>Upload Calender:</label><input id="fileUpload"
						placeholder="Choose File" disabled="disabled" /> <span
						class="fileUpload btn btn-primary"> <span>Brouchure</span>
						<input type="file" class="upload" id="fileUpload"
						name="fileUpload" accept="application/pdf" />
					</span>
					<script type="text/javascript">
						document.getElementById("fileUpload").onchange = function() {
							document.getElementById("fileUpload").value = this.value;
						};
					</script>
					<div class="submit">
						<input type="submit" value="Upload Calendar" />
					</div>
				</div>

			</form>

		</div>

	</div>
</body>
</html>