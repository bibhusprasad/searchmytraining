<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table{
    border-collapse: collapse;
}
.firstLine td{
    border-bottom: 2px solid black;
}
.hoverTable
{
	
	border-collapse: collapse;
}
.hoverTable td:hover
{
	background-color: #5CADFF;
}
</style>
<link rel="stylesheet" href="./css/screen.css" type="text/css"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TPI Reports</title>
</head>
<body>
	<a href="./AdminPages">Back</a> <br>
	<center> <h1>SearchMyTraining.com</h1> 
		<display:table id="trngId" name="callist" export="true" pagesize="15" requestURI="" defaultsort="1" defaultorder="ascending">
		<display:setProperty name="export.pdf.filename" value="TrainingProviderDetails.pdf"/>
			<display:column property="trngId" title="Training Id" sortable="true" headerClass="sortable" autolink="true"/>
	    	<display:column property="title" title="Title" sortable="true" headerClass="sortable" autolink="true"/>
	    	<display:column property="start_date" title="Start Date" sortable="true" headerClass="sortable" autolink="true"/>
	    	<display:column property="end_date" title="End Date"/>
	    	<display:column property="city.cityName" title="Place" sortable="true"/>
	    	<display:column property="createdOn" title="Uploaded On" sortable="true"/>
	    	<display:column property="status" title="Status"/>
	    	
		</display:table>	
	</center>
</body>
</html>