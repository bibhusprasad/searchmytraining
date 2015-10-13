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
		previewCalenderDietailsView();
		previewCalenderQuickView();
	});
	function previewCalenderDetailsView() {
			
			var calenderTypes = '${calenderTypes}';
			var calenderdetails = $.parseJSON(calenderTypes);
			console.log(calenderdetails[0])
			var calenderDetail = calenderdetails[0];
			
			$('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Course Title :-"))
	        .append($('<td/>').text(calenderDetail.courseTitle))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Type of Calender :-"))
	        .append($('<td/>').text(calenderDetail.calenderType.val))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Idustry Type :-"))
	        .append($('<td/>').text("${sessionScope.industryType}"))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Price :-"))
	        .append($('<td/>').text(calenderDetail.price))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("From Date :-"))
	        .append($('<td/>').text(calenderDetail.fromDate))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("To Date :-"))
	        .append($('<td/>').text(calenderDetail.toDate))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Address Line1 :-"))
	        .append($('<td/>').text(calenderDetail.addressLine1))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Address Line2 :-"))
	        .append($('<td/>').text(calenderDetail.addressLine2))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Landmark :-"))
	        .append($('<td/>').text(calenderDetail.landmark))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("City:-"))
	        .append($('<td/>').text(calenderDetail.city))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("State :-"))
	        .append($('<td/>').text("${sessionScope.stateName}"))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Country :-"))
	        .append($('<td/>').text(calenderDetail.country))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Pin Code:-"))
	        .append($('<td/>').text(calenderDetail.pincode))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Programme brief for Quick View Section :-"))
	        .append($('<td/>').text(calenderDetail.trngQuickView))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Programme Overview :-"))
	        .append($('<td/>').text(calenderDetail.trngOverView))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Your take away from the programme :-"))
	        .append($('<td/>').text(calenderDetail.trngTakeAway))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Training Methodology :-"))
	        .append($('<td/>').text(calenderDetail.trngMethodology))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Who should attend :-"))
	        .append($('<td/>').text(calenderDetail.trngAttandant))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Keywords :-"))
	        .append($('<td/>').text(calenderDetail.trainingKey))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Faculty Details for this programme :-"))
	        .append($('<td/>').text(calenderDetail.facultyDetails))
	        
	        $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("How to Register :-"))
	        .append($('<td/>').text(calenderDetail.howtoregister))
	        
	         $('<tr/>').appendTo($('#detailsViewTable'))
	        .append($('<td/>').text("Details of Training Providers :-"))
	        .append($('<td/>').text(calenderDetail.detailsOfProvider))

	}
	
	function previewCalenderQuickView() {
		
		var calenderTypes = '${calenderTypes}';
		var calenderdetails = $.parseJSON(calenderTypes);
		console.log(calenderdetails[0])
		var calenderDetail = calenderdetails[0];
		
		$('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Course Title :-"))
        .append($('<td/>').text(calenderDetail.courseTitle))
        
        $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Type of Calender :-"))
        .append($('<td/>').text(calenderDetail.calenderType.val))
        
        $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Idustry Type :-"))
        .append($('<td/>').text("${sessionScope.industryType}"))
        
        $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("From Date :-"))
        .append($('<td/>').text(calenderDetail.fromDate))
        
        $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("To Date :-"))
        .append($('<td/>').text(calenderDetail.toDate))
        
         $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("City:-"))
        .append($('<td/>').text(calenderDetail.city))
        
         $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("State :-"))
        .append($('<td/>').text("${sessionScope.stateName}"))
        
         $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Programme brief for Quick View Section :-"))
        .append($('<td/>').text(calenderDetail.trngQuickView))
        
        $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Programme Overview :-"))
        .append($('<td/>').text(calenderDetail.trngOverView))
        
         $('<tr/>').appendTo($('#quickViewTable'))
        .append($('<td/>').text("Keywords :-"))
        .append($('<td/>').text(calenderDetail.trainingKey))
        
}
	
</script>
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
</head>
<body>
	<div id="acord2" class="acord">
		<h3 class="acord_head">Details View</h3>
		<div class="acord_cont">
			<table id="detailsViewTable"></table>
		</div>
		<h3 class="acord_head">Quick View</h3>
		<div class="acord_cont">
			<table id="quickViewTable"></table>
		</div>
	</div>
</body>
</html>