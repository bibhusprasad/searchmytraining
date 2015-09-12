<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="./resources/js/Canvas.js"></script>
<script type="text/javascript">
	var charttpf = '${chartstpf}';
	var charttpi = '${chartstpi}';
	abc(charttpf,charttpi);
	
</script>

</head>
<body>

	<div class="charts">
		<div class="pie_chart">
			<div class="chart_name">Bar Chart</div>
			<div id="chartContainer"></div>
		</div>
		<div class="pie_chart">
			<div class="chart_name">Spline Chart</div>
			<div id="chartContainer1"></div>
		</div>
		<div class="pie_chart">
			<div class="chart_name">Pie Chart</div>
			<div id="chartContainer2"></div>
		</div>
		<div class="pie_chart">
			<div class="chart_name">Doughnut Chart</div>
			<div id="chartContainer3"></div>
		</div>
	</div>
</body>
</html>