<%@ include file="includes.jspf"%>
<spring:url value="/js/libs/jquery.js" var="jquery_url" />
<!-- CONTENTS LAYOUT START -->
<!DOCTYPE html>
<html class="no-js">
<head>
<meta content="utf-8" http-equiv="encoding">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<tilesx:useAttribute name="title" />
</head>
<body>
		<tiles:insertAttribute name="body" />
	<tilesx:useAttribute id="list" name="jsfilesList"
		classname="java.util.List" />
	<c:forEach var="jsfileName" items="${list}">
		<script
			src="<%=request.getContextPath()%><c:out value='${jsfileName}' />"></script>
	</c:forEach>
</body>
</html>