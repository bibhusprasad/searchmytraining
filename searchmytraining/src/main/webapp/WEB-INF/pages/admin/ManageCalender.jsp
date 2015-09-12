<%@page
	import="com.searchmytraining.dto.FreelancerDTO,com.searchmytraining.entity.UserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/date.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/tooltip.css"
	type="text/css">
	
<script type="text/javascript">
	$('#Fdate,#Tdate').datepicker();
</script>
<script	src="<%=request.getContextPath()%>/resources/js/work/categories.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/work/manageCalendar.js"></script>

</head>
<body>
	<div class="calender">
		<form action="">
			<div class="ctype">
				<label class="a">Select Calender Detail Type :</label>&nbsp;&nbsp; 
				<select>
					<option>Newest</option>
					<option>Oldest</option>
				</select>
			</div>
			<div class="industry">
				<label class="a">Industry :</label>&nbsp;&nbsp; 
				<select id="tindustry" onchange="industryCategory()">
					<option value="0">--Select--</option>
						 <c:forEach var="industry" items="${industries}">
							<option value="${industry.trnIndstrId}">${industry.indstrName}</option>
						</c:forEach>
				</select>
			</div>
			<div class="industry">
				<label class="a">Category :</label>&nbsp;&nbsp;
				<select id="industrycatid" onchange="industrySubCategory()">
					<option value="0">--Select--</option>
				</select>
			</div>
			<div class="industry">
				<label class="a">Sub-Category :</label>&nbsp;&nbsp; 
				<select id="industrysubcatid">
					<option value="0">--Select--</option>
				</select>
			</div>
			<div class="citynew">
				<label class="a">Country :</label> 
				<select id="countryid" onchange="getStates();">
					<option value="0">--Select--</option>
					<c:forEach var="country" items="${countries}">
						<option value="${country.countryId}">${country.countryName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="citynew">
				<label class="a">State :</label> 
				<select id="stateid" onchange="getCities()">
					<option value="0">--Select--</option>
				</select>
			</div>
			<div class="citynew">
				<label class="a">City :</label> 
				<select id="cityid">
					<option value="0">--Select--</option>
				</select>
			</div>
			<div class="date-range">
				<label class="a">Select Date Range :</label>
				<text>From </text>
				<input type="text" id="Fdate" placeholder="Start Date"
					autocomplete="off" name="Fdate" /> <span><img
					src="<%=request.getContextPath()%>/resources/images/calender/calendar.png" /></span>

				<text>To </text>
				<input type="text" id="Tdate" placeholder="End Date"
					autocomplete="off" name="Tdate" /> <span><img
					src="<%=request.getContextPath()%>/resources/images/calender/calendar.png" /></span>
			</div>
			<div class="search1">
				<input type="button" value="Search" onclick="searchCalendars();">
			</div>
		</form>
		<div class="result_section">
			<div class="sort_by">	
				<select>
					<option value="Ascending" selected>Ascending</option>
					<option value="Descending">Descending</option>
				</select>
				<select>
					<option value="bydate" selected >Recently Uploaded</option>
					<option value="bydate">By Date</option>
					<option value="bylocation">By Location</option>
				</select>
				<h4>Sort By</h4>
			</div>
			<div class="calender_display">
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			<div>
			<h3>Training Provider Name<br>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pune</h3>
			
			<input type="button" Value="View Calender">
			</div>
			</div>
		</div>
	</div>

</body>

</html>