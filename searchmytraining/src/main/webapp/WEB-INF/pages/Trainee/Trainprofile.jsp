<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
		<script
	src="<%=request.getContextPath()%>/resources/js/Validations/TraineeProfile.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/work/categories.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/work/InstituteJS.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/work/updatetraineeprofile.js"></script>
<script type="text/javascript">
jQuery(document).ready(function () {
  
	 // filling of Industry Categories
	
    jQuery(".acord .skip").click(function () {
        var $nextContent = jQuery(this).parent().next().next();
        jQuery(".acord .acord_cont").slideUp("fast", function () {
            $nextContent.show()
        });
        jQuery(".acord .acord_cont").hasClass().next().slideDown("fast", function () {
            $nextContent.show()
        });
    });
	 
	//Employement Details
    var industriescat = '${industrycategories}';
	var jsonindustrycategories = $.parseJSON(industriescat);
	var industries = '${industries}';
	var jsonindustries = $.parseJSON(industries);
	var indsubcat = '${industrysubcat}';
	var jsonindsubcat = $.parseJSON(indsubcat);
	var industry_value = '${employmentdetails.indsubcat.industrycategory.industry.trnIndstrId}';
	var industry_cat_value = '${employmentdetails.indsubcat.industrycategory.trnIndstrCatId}';
	var industry_subcat_value = '${employmentdetails.indsubcat.trnIndstrSubCatId}';
	var employmenttype = '${employmentdetails.employmentType}';
	var employmentdetails = '${employmentdetails}';
    loadEmploymentData(jsonindustrycategories,jsonindustries,jsonindsubcat,industry_value,industry_cat_value,industry_subcat_value,employmenttype);
    
 	//Location Details
 	
 	var jsonstates = '${states}';
 	var jsoncities = '${cities}';
 	var states = $.parseJSON(jsonstates);
 	var cities = $.parseJSON(jsoncities);
 	var country_value = '${locentity.city.state.country.countryId}';
 	var state_value = '${locentity.city.state.stateId}';
 	var city_value = '${locentity.city.cityId}';
 	loadLocationInfo(states,cities,state_value,city_value);
    
});
</script>
<script type="text/javascript">

$('#acord1').accordion({
	collapsible : true
});

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
	<input id="userid" type="hidden" value="${trainee.user.userId}">
	<div id="acord1" class="acord">
		<h3 class="acord_head">
		<span></span>
		Personal Details</h3>
		<div class="acord_cont">
			<form action="#">
				<div class="name">
					<label>Full Name <text>*</text> :</label> <input id="name" type="text" name="name"
						value="${trainee.fullName}" onkeypress="return validateName(event);"/>
						<span id="error51"></span>
				</div>
				<!-- 									<div class="name">
										<label>Middle Name :</label> <input id="midname" type="text" name="name" />
									</div>
									<div class="name">
										<label>Last Name :</label> <input id="lname" type="text" name="name" />
									</div>
 -->
				<div class="email">
					<label>Email Id <text>*</text> :</label> <input id="email" type="text"
						name="email" value="${trainee.emailid}" />
						<span id="error52"></span>
				</div>
				<div class="contact">
					<label>Phone No <text>*</text> :</label> <input id="contact" type="text"
						name="phone" value="${trainee.phone}" onkeypress="return validate13(event);"/>
				<span id="error53"></span>
				</div>
				 <div class="photo">
				 <c:if test="${!empty flProfEntity.photograph}">
				 	<img src="${pageContext.request.contextPath}/freelancer/downloadFLPhotograph/${flProfEntity.user.userId}" id="profilepic_curr" name="profilepic" width="140" height="160" border="0" alt="PROFILE PICTURE" onError="this.src= ${pageContext.request.contextPath}/resources/images/avtar.jpg ;" />
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
			<input class="skipbtn1" type="button" value="Save & Continue" name="save" onclick="return validationTProf();"/>
			<input class="skip" type="button" value="Skip" name="skip" id="skip1"/>
		</div>

		<h3 class="acord_head">
		<span></span>
		Employment Details</h3>
		<div class="acord_cont">
			<form class="multi" name="employmentdet">
				<div class="emptype">
					<label>Employment Type :</label> 
					<select id="employmenttype">
						<option value="0">--Select--</option>
						<option value="Full Time" ${isFullTime}>Full Time</option>
						<option value="Part Time" ${isPartTime}>Part Time</option>
					</select>
					<span id="erroremp"></span>
				</div>
				<div class="industry">
					<label> Industry :</label> 
					<select id="tindustry" onchange="industryCategory()">
						<option value="0">--Select--</option>
						 <%--<c:forEach var="industry" items="${industries}">
							<option value="${industry.trnIndstrId}">${industry.indstrName}</option>
						</c:forEach> --%>
					</select>
					<span id="errorindustry"></span>
				</div>
				<div class="funArea">
					<label>Functional Area  :</label>
					<select id="industrycatid" onchange="industrySubCategory()">
						<option value="0">--Select--</option>
					</select>
					<span id="errorfunarea"></span>
									
				</div>
				<div id="industrycatid1" class="employer">
					<label>Specialization  :</label> 
					<select id="industrysubcatid">
						<option value="0">--Select--</option>
					</select>
					<span id="errorspecialization"></span>
				</div>
				<div class="employer">
					<label>Employer:</label> <input type="text" name="employer"
						id="employer" value="${employmentdetails.employer}">
						<span id="error506"></span>
				</div>
				<div class="jobProf">
					<label>Job Profile </label>
					<textarea id="jobprofileid" type="text" name="jobprof">${employmentdetails.jobProfile}</textarea>
					<span id="errorjobprofile"></span>
				</div>
			</form>
			<input class="skipbtn2" type="button" value="Save & Continue" name="save" onclick="tProf4('<%=request.getContextPath()%>')"/>
			<input class="skip" type="button" value="Skip" name="skip" id="skip1"/>
		</div>


		<h3 class="acord_head">
		<span></span>
		Location Details</h3>
		<div class="acord_cont">
			<form action="" class="multi">
				<div class="flatNo">
					<label>Building No./Flat No./Society No. :</label> <input
						type="text" id="flatno54" name="name" value='${locentity.buildingNo}'/>
						<span id="error54"></span>	
				</div>
				<div class="street">
					<label>Street :</label> <input type="text" id="street55" name="name" value='${locentity.street}'/>
					<span id="error55"></span>
				</div>
				<div class="landmark">
					<label>Landmark :</label> <input type="text" id="landm56" name="name" value='${locentity.landmark}'/>
					<span id="error56"></span>
				</div>
				<div class="pin">
					<label>Pincode <text> * </text> :</label> <input type="text" id="pin57" name="name" value='${locentity.pincode}' onkeypress="return validate13(event)"/>
				    <span id="error57"></span>
				</div>
				
				<div class="country">
					<label>Country :</label> 
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
				<span id="errorcountry"></span>
				<div class="state">
					<label>State :</label> 
					<select id="stateid" onchange="getCities()">
						<option value="0">--Select--</option>
					</select>
	     		</div>
	     		<span id="errorstate"></span>
				<div class="city">
					<label>City :</label> 
					<select id="cityid">
						<option value="0">--Select--</option>
					</select>
				</div>
				<span id="errorcity"></span>
                               
			</form>
			<input class="skipbtn3" type="button" value="Save & Continue" name="save" onclick="saveTraineeLocationDetails('<%=request.getContextPath()%>');"/>
			<input class="skip" type="button" value="Skip" name="skip" id="skip1"/>

		</div>

		<h3 class="acord_head">
		<span></span>
		Contact Details</h3>
		<div class="acord_cont">
			<form name="traineecontactdet">
				<div id="cont">
					<p>
						<label>Contact No : </label> <select id="traineephoneid1">
							<option value="0">--Select--</option>
							<option value="1">OFFICE-MOBILE</option>
							<option value="2">OFFICE-LANDLINE</option>
							<option value="3">PERSONAL-MOBILE</option>
							<option value="4">PERSONAL-LANDLINE</option>
						</select> <input type="text" name="contdetails58" id="traineephone1" onkeypress="return validate13(event)" value="${sessionScope.trainee.phone}">
					<input class="addcontact1" type="button" value="+" >
					
					</p>
					<span id="errortcontact"></span>
				<span id="error58"></span>

				</div>
				<div class="website">
					<label>Website :</label> <input type="text" id="web59" name="web59" />
					<span id="error59"></span>
				</div>
				<br></br>

				<div class="secmail">
					<label>Secondary Mail :</label> <input type="text" id="smail60"
						name="smail60" /> <span id="error60"></span>
				</div>
				<br></br>
			</form>
			<input type="button" form="traineecontactdet" value="Save & Continue" name="save" onclick="traineeContactDet('<%=request.getContextPath()%>');"/>
		</div>
	</div>
</body>
</html>