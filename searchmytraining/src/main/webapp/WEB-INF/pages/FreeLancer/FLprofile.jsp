<%@page	import="com.searchmytraining.dto.FreelancerDTO,com.searchmytraining.entity.UserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/Validations/FreeLProfile.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/work/categories.js"></script>
<%-- <script	src="<%=request.getContextPath()%>/resources/js/work/freelance.js"></script> --%>
<script	src="${pageContext.request.contextPath}/resources/js/work/updatefreelancerprofile.js"></script>
<script type="text/javascript">
$('#acord1').accordion({
	collapsible : true
});

jQuery(document).ready(function () {
    jQuery(".acord .skip").click(function () {
        var $nextContent = jQuery(this).parent().next().next();
        jQuery(".acord .acord_cont").slideUp("fast", function () {
            $nextContent.show()
        });
        jQuery(".acord ").next().slideDown("fast", function () {
            $nextContent.show()
        });
    });
    otherDegree
    var education = '${education.degree.degree}';
    var degreeOtherValue = '${education.degreeOther}';
    var education = education.toLocaleLowerCase().trim();
    if(education == 'other' && degreeOtherValue != "")
    	$('#otherDegreeDivid').show();
    else
    	$('#otherDegreeDivid').hide();
});
var jsonstates = '${states}';
	var jsoncities = '${cities}';
	var states = $.parseJSON(jsonstates);
	var cities = $.parseJSON(jsoncities);
	var country_value = '${location.city.state.country.countryId}';
	var state_value = '${location.city.state.stateId}';
	var city_value = '${location.city.cityId}';
	loadLocationInfo(states,cities,state_value,city_value);

	function changeImage(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			var phototgraph = '${flProfEntity.photograph}';
			reader.onload = function(e) {
			if(phototgraph)
				$('#profilepic_curr').attr('src', e.target.result);
			else
				$('#profilepic_avtar').attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
<input id="userid" type="hidden" value="${flProfEntity.user.userId}">
	<div id="acord1" class="acord">
		<h3 class="acord_head">
		Profile Details <span></span></h3>
		<div class="acord_cont">
			<form id="flForm" action="${pageContext.request.contextPath}/freelancer/updateflprofdet" method="post" name="myform" enctype="multipart/form-data">
				<div class="name">
					<label>Full Name <text>*</text> :</label> 
					<input id="fname61" name="fname61" value='${flProfEntity.fullname}' onkeypress="return validateFLName(event);"/> 
					<span id="error61"></span>
				</div>
				<div class="Email">
					<label>Email(Login Id) <text>*</text> :</label> <input type="email" id="email64"
						name="email64" value="${flProfEntity.email}" /> <span
						id="error64"></span>
				</div>
				 <div class="photo">
				 <c:if test="${!empty flProfEntity.photograph}">
				 	<img src="${pageContext.request.contextPath}/common/downloadPicture/${flProfEntity.user.userId}" id="profilepic_curr" name="profilepic" width="140" height="160" border="0" alt="PROFILE PICTURE" onError="this.src= ${pageContext.request.contextPath}/resources/images/avtar.jpg ;" />
				 </c:if>
				 <c:if test="${empty flProfEntity.photograph}">
				 	<img src="${pageContext.request.contextPath}/resources/images/avtar.jpg" id="profilepic_avtar" name="profilepic" width="140" height="160" border="0" alt="PROFILE PICTURE" onError="this.src=${pageContext.request.contextPath}/resources/images/avtar.jpg ;" />
				 </c:if>
				
				
				<div class="fileUpload btn btn-primary">
                	<span>Upload Photo</span>
                		<input type="file" id="fileupload" class="upload" name="picture" style="visibility: visible" onchange="changeImage(this);"/>         
                </div>
				</div>
			</form>
			<input class="skipbtn9" type="button" value="Save & Continue" name="save" form="flForm" onclick="return freelProfDet('<%=request.getContextPath()%>');"/>
			<input class="skip" type="button" id="skip1" value="Skip" name="skip" />
		</div>
		<h3 class="acord_head">
		<span></span>
		Location Details</h3>
		<div class="acord_cont">
			<form name="" class="multi" id="freeContact">
				<div class="flatNo">
					<label>Building No./Flat No./Society No.<text>*</text> :</label> 
					<input
						type="text" name="builNo65" id="builNo65" value="${location.buildingNo}"/>
						<span id="error65"></span>
				</div>
				<div class="street">
					<label>Street :</label> 
					<input type="text" name="streetName66"
						id="streetName66" value="${location.street}"/>
						<span id="error66"></span>
				</div>
				<div class="landmark">
					<label>Landmark :</label> 
					<input type="text" name="landmark67"
						id="landmark67" value="${location.landmark}"/>
						<span id="error67"></span>
				</div>
				<div class="pin">
					<label>Pincode <text>*</text> :</label> <input type="text" name="pin68" id="pin68" onkeypress="return validate14(event)" value="${location.pincode}"/>
				<span id="error68"></span>
				</div>
				
				<c:set var="cntid"/>
				
				<div class="country">
					<label>Country <text>*</text> :</label> 
					<select id="countryid" onchange="getStates();">
						<option value="0">--Select--</option>
						<c:forEach var="country" items="${countries}">
							<c:choose>
								<c:when test="${country_value == country.countryId}">
									<option value="${country.countryId}" selected>${country.countryName}</option>
								</c:when>
								<c:otherwise>
									<option value="${country.countryId}">${country.countryName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<span id="errorflcountry"></span>
				<div class="state">
					<label>State <text>*</text> :</label> 
					<select id="stateid" onchange="getCities()">
						<option value="0">--Select--</option>
					</select>
	     		</div>
				<span id="errorflstate"></span>
				<div class="city">
					<label>City <text>*</text> :</label> 
					<select id="cityid">
						<option value="0">--Select--</option>
					</select>
				</div>
				<span id="errorflcity"></span>
				<br>
				<br>

			</form>
			<input class="skipbtn10" type="button" value="Save & Continue" name="save" form="freeLocation" onclick="freelLocDetails('<%=request.getContextPath()%>');" /> 
			<input class="skip" type="button" id="skip1" value="Skip" name="skip" />
		</div>

		<h3 class="acord_head">
		<span></span>
		Contact Information</h3>
		<div class="acord_cont">
			<form action="" class="multi" id="frmLocDetails">
				<div id="cont">
					<p>
						<label>Contact No : </label> 
						<select id="phonetypeid1">
							<option value="0">--Select--</option>
							<c:if test="${phones[0].phonetype.phnTypeId eq 3}">
								<option value="3" selected>PERSONAL-MOBILE</option>
							</c:if>
							<c:if test="${phones[0].phonetype.phnTypeId ne 3}">
								<option value="3">PERSONAL-MOBILE</option>
							</c:if>
							<c:if test="${phones[0].phonetype.phnTypeId eq 4}">
								<option value="4" selected>PERSONAL-LANDLINE</option>
							</c:if>
							<c:if test="${phones[0].phonetype.phnTypeId ne 4}">
								<option value="4">PERSONAL-LANDLINE</option>
							</c:if>
						</select> 
						<input type="text" name="contactNo69" id="phonevalue1" onkeypress="return validate14(event)" value="${phones[0].phoneValue}"/>
						<!-- <input type="button" value="+" class="addcontact"> -->
					</p>
					<p style="margin-left:253px;">
					<select id="phonetypeid2">
							<option value="0">--Select--</option>
							<c:if test="${phones[1].phonetype.phnTypeId eq 3}">
								<option value="3" selected>PERSONAL-MOBILE</option>
							</c:if>
							<c:if test="${phones[1].phonetype.phnTypeId ne 3}">
								<option value="3">PERSONAL-MOBILE</option>
							</c:if>
							<c:if test="${phones[1].phonetype.phnTypeId eq 4}">
								<option value="4" selected>PERSONAL-LANDLINE</option>
							</c:if>
							<c:if test="${phones[1].phonetype.phnTypeId ne 4}">
								<option value="4">PERSONAL-LANDLINE</option>
							</c:if>
					</select>
					<input type="text" id="phonevalue2" size="20" name="phonevalue2" value="${phones[1].phoneValue}"/>
				<br>
				<span id="errorflcontact"></span>
					<span id="error69"></span>
				</div>
				<div class="website">
					<label>Website :</label> <input type="text" name="web70" id="web70" value="${contactwebdetails.website}"/>
					<span id="error70"></span>
				</div>
			</form>
			<input class="skipbtn11" type="button" value="Save & Continue" name="save" onclick="flContactDet('<%=request.getContextPath()%>');" /> 
			<input class="skip" type="button" id="skip1" value="Skip" name="skip"/>
		</div>

		<h3 class="acord_head">
		<span></span>
		Education Details</h3>
		<div class="acord_cont">
			<form class="multi" id="frmEduDetails">
				<div class="dtype">
					<label>Degree Type :</label> 
					<select id="fldegreetype" onchange="checkDegree('${education.degree.degree}');">
						<option value="0" name="degreeType"	id="degreeType">--Degree Type--</option>
						<c:forEach var="edu" items="${Educations}">
						<c:choose>
							<c:when test="${edu.eduid eq education.degree.eduid}">
								<option value="${edu.eduid}" selected>${edu.degree}</option>
							</c:when>
							<c:otherwise>
								<option value="${edu.eduid}">${edu.degree}</option>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</select>
					<span id="errorfldegreetype"></span> 
				</div>
				
				
				<!-- <div class="qua">
					<label>Qualification :</label> <input type="text"
						name="qualification71" id="qualification71">
						<span id="error71"></span>
				</div><br><br> -->
				
				<div id="otherDegreeDivid" class="spec">
					<input type="text" id="otherDegree" placeholder="Enter Degree Name" style="margin-left:256px;" value="${education.degreeOther}"/>
					<span id="errorflspec"></span> 
				</div>
				<!--<div class="seperate">-->
				
				<br><br>
				<div class="year">
					<label>Year Of Passing : </label> 
					<select id="flyearofpassing">
						<option value="0" name="yop" id="yop">--Select Year--</option>
						<c:set var="year" value="2015"/>
						<c:forEach var="i" begin="1960" end="2015">
						<c:choose>
							<c:when test="${year eq education.yop}">
								<option value="${year}" selected>${year}</option>
							</c:when>
							<c:otherwise>
								<option value="${year}">${year}</option>
							</c:otherwise>
						</c:choose>
						<c:set var="year" value="${year-1}"/>
						</c:forEach>
					</select>
					 <span id="errorflyearofpassing"></span> 
				</div>
				<div class="university">

					<label>University: </label> 
					<input type="text" name="university72" id="university72" value="${education.university}"/>
					<span id="error72"></span>
				</div>

			</form>
			<input class="skipbtn12" type="button" value="Save & Continue" name="save" form="frmEduDetails" onclick="updalFLEduDetails('${pageContext.request.contextPath}/freelancer/updateedudetails/${flProfEntity.user.userId}');" /> <input
				class="skip" type="button" id="skip1" value="Skip" name="skip" />
		</div>


		<h3 class="acord_head">Certification/Awards/Achievements</h3>
		<div class="acord_cont">
			<form action="" class="multi" id="frmCerfDetails">
				<div id="client">
					<p>
						<label>Achievements/Awards/Certification :</label>
						<textarea rows="5" cols="50" name="awrdDetails" id="awrdDetails">${certification.certfctName}</textarea>
					</p>
					
				</div><br><br>
					<h3>(Max 250 characters)</h3>
				<input class="skipbtn13" type="button" value="Save" name="save"
					form="frmCerfDetails"
					onclick="freelCertificationAwardDet('${pageContext.request.contextPath}');" />
			</form>

		</div>
	</div>
</body>
</html>