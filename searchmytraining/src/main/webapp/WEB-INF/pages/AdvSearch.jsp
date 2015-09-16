<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>

<%-- <script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script> --%>

<title>Advance Search</title>
</head>
<body>
	
		<div class="Advace_from">
			<div class="head">
				<img src="<%=request.getContextPath()%>/resources/images/search.jpg"
					alt="Search">
			</div>

			<form id="advace_search" name="asearch" action="#" method="post">
				<h1>Advance Search</h1>
				<div class="box">
					<label for="keyword">Keyword:</label> <input type="text" name="Key"
						value="" placeholder="     Keyword">
				</div>
				<div class="box">
					<label for="Country">Country:</label> <input type="text"
						name="Country" value="" placeholder="     Country">
				</div>
				<div class="box">
					<label for="City">City:</label> <input type="text" name="City"
						value="" placeholder="      City">
				</div>
				<div class="box">
					<label for="Frdate">From Date:</label> <input type="text"
						name="Frdate" value="" placeholder="     From Date">
				</div>
				<div class="box">
					<label for="Todate">To Date:</label> <input type="text"
						name="Todate" value="" placeholder="     To Date">
				</div>
				<div class="box">
					<label for="Price">Price Range:</label> <select>
						<option value="1">0-5000 Rs</option>
						<option value="2">5000-10,000 Rs</option>
						<option value="3">10,000-15,000 Rs</option>
						<option value="4">15,000-20,000 Rs</option>
						<option value="5">20,000-25,000 Rs</option>
						<option value="6">Above 25,000 </option>
						<option></option>

					</select>
				</div>
				<div class="box">
					<label for="Industries">Training By Industry:</label> 
					    <select>
						<option value="I1">IT Industry</option>
						<option value="I2">HR Management</option>
						<option value="I3">Health care</option>
						<option value="I4">IT Industry</option>
						<option value="I5">IT Industry</option>
						<option value="I6">IT Industry</option>
						<option></option>

					</select>
				</div>
				<div class="box">
					<label for="category">Training By Category:</label> 
					    <select>
						<option value="I1">Business Skill Training</option>
						<option value="I2">Finance Training</option>
						<option value="I3">Health care Training</option>
						<option value="I4">Human Resource Training</option>
						<option value="I5">Industrial Training</option>
						<option value="I6">Information Technology Training</option>
						<option></option>

					</select>
				</div>
               <div class="box">
					 <input type="Button"
						name="Search" value="Search">
				</div>


			</form>

		</div>

</body>
</html>