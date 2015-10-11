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
		loadPreviewCalenderType();
	});
	function loadPreviewCalenderType() {
		var calenderTypes = '${calenderTypes}';
		var jsoncalenderTypes = $.parseJSON(calenderTypes);
		console.log(jsoncalenderTypes);
	}
</script>
</head>
<body>
	populate preview calender as table 
	quick view and details view.
</body>
</html>