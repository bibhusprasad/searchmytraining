<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memory Utilized</title>
</head>
<body>
	<center>
		<h2>No. of Processors used: ${noofprocessors}</h2>
		<br>
		<h2>Total Heap Size: ${totalheapsize}</h2>
		<br>
		<h2>Max JVM Memory: ${maxjvmmemory}</h2>
		<br>
		<h2>Free JVM Memory: ${freejvmmemory}</h2>
		<br>
		<h2>Used JVM Memory: ${usedjvmmemory}</h2>
		<br>
		<br>
		<br>
		<h4>Thank You</h4>
	</center>
</body>
</html>