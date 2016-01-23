<%@ include file="includes.jspf"%>
<spring:url value="/css/bootstrap.css" var="bootstrap_css" />
<spring:url value="/css/font-awesome.css" var="fontawesome_css" />
<spring:url value="/css/styles.css" var="styles_css" />

<spring:url value="/js/jquery.js" var="jquery_url" />
<spring:url value="js/bootstrap.js" var="bootstrap_url" />
<spring:url value="js/icheck.js" var="icheck_url" />
<spring:url value="js/ionrangeslider.js" var="ionrangeslider_url" />
<spring:url value="js/jqzoom.js" var="jqzoom_js" />
<spring:url value="js/card-payment.js" var="cardpayment_js" />
<spring:url value="js/owl-carousel.js" var="owlcarousel_js" />
<spring:url value="js/magnific.js" var="magnific_js" />
<spring:url value="js/custom.js" var="custom_js" />

<tilesx:useAttribute name="title" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="utf-8" http-equiv="encoding">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<title><spring:message code="${title}" /></title>
<link rel="stylesheet" href="${bootstrap_css}" />
<link rel="stylesheet" href="${fontawesome_css}" />
<link rel="stylesheet" href="${styles_css}" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:500,300,700,400italic,400'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,600'
	rel='stylesheet' type='text/css'>

<script src="${jquery_url}"></script>
<script src="${bootstrap_url}"></script>
<script src="${icheck_url}"></script>
<script src="${ionrangeslider_url}"></script>
<script src="${jqzoom_js}"></script>
<script src="${cardpayment_js}"></script>
<script src="${owlcarousel_js}"></script>
<script src="${magnific_js}"></script>
<script src="${custom_js}"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input[type="checkbox"]').click(function() {
			if ($(this).attr("value") == "red") {
				$(".red").toggle();
			}
			if ($(this).attr("value") == "green") {
				$(".green").toggle();
			}
			if ($(this).attr("value") == "blue") {
				$(".blue").toggle();
			}
		});
	});
	function toggleChevron(e) {
		$(e.target).prev('.panel-heading').find("i.indicator").toggleClass(
				'glyphicon-chevron-down glyphicon-chevron-up');
	}
	$('#accordion').on('hidden.bs.collapse', toggleChevron);
	$('#accordion').on('shown.bs.collapse', toggleChevron);
</script>
</head>
<body>

	<div class="global-wrapper clearfix" id="global-wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="bodysection" />
		<tiles:insertAttribute name="footer" />
		<tiles:insertAttribute name="copyright" />
	</div>
	<tilesx:useAttribute id="list" name="jsfilesList"
		classname="java.util.List" />
	<c:forEach var="jsfileName" items="${list}">
		<script
			src="<%=request.getContextPath()%><c:out value='${jsfileName}' />"></script>
	</c:forEach>
	<div id="loader" class="popupContainerx">
		<div class="popupBox panel">
			<div class="loading" style="display: block"></div>
		</div>
	</div>
</body>
</html>