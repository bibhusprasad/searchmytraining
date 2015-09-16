<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
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
}); 

</script>
</head>
<body>
<div id="home-content" class="contentblock">
	<div id="acord1" class="acord">
							<h3 class="acord_head">Profile Details</h3>
							<div class="acord_cont">
								<form action="#">
									<div class="name">
										<label>First Name :</label> <input type="text" name="name" />
									</div>
									<div class="name">
										<label>Middle Name :</label> <input type="text" name="name" />
									</div>
									<div class="name">
										<label>Last Name :</label> <input type="text" name="name" />
									</div>
									<div class="Email">
										<label>Email(Login Id) :</label> <input type="email"
											name="email" />
									</div>
								</form>
								<input class="skip" type="submit" value="Save & Continue" name="save"/>
							    <input class="skip" type="button" value="Skip" name="skip" />

							</div>

							<h3 class="acord_head">Contact Information</h3>
							<div class="acord_cont">
								<form action="" class="multi">
																
								 <fieldset>
								  <legend><b>Address Info </b></legend> 
									<div class="flatNo">
										<label>Building No./Flat No./Society No. :</label> <input
											type="text" name="name" />
									</div>
									<div class="street">
										<label>Street :</label> <input type="text" name="name" />
									</div>
									<div class="landmark">
										<label>Landmark :</label> <input type="text" name="name" />
									</div>
									<div class="pin">
										<label>Pincode :</label> <input type="text" name="name" />
									</div>
									<div class="country">
										<label>Country :</label> <select>
											<option value="con1">India</option>
											<option value="con2">B</option>
											<option value="con3">C</option>
										</select>
									</div>
									<div class="state">
										<label>State :</label> <select>
											<option value="state1">Maharashtra</option>
											<option value="state2">B</option>
											<option value="state3">C</option>
										</select>
									</div>
									<div class="city">
										<label>City :</label> <select>
											<option value="city1">Pune</option>
											<option value="city2">Mumbai</option>
											<option value="city3">Nagpur</option>
										</select>
									</div>
									</fieldset>
									<div id="cont">
										<p>
											<label>Contact No : </label> <select>
												<option value="Phone">Phone</option>
												<option value="Phone">Land Line</option>
												<option value="Phone">Fax</option>
											</select> <input type="text" name="website" value="">
										</p>
										<div class="btn">
									<img src="<%=request.getContextPath()%>/resources/images/14056.png" alt="add"" id="addcontact" />
									</div>
									</div>
									
									
									
									<div class="website">
										<label>Website :</label> <input type="text" name="name" />
									</div><br></br>
									<div class=save>
										
									</div>
								</form>
                                <input class="skip" type="submit" value="Save & Continue" name="save"/>
							    <input class="skip" type="button" value="Skip" name="skip" />
   
							</div>

							<h3 class="acord_head">Education Details</h3>
							<div class="acord_cont">
								<form class="multi">
									<div class="name">
										<label>Degree Type :</label> <select
											style="width: 100px;">
											<option value="qua">Diploma</option>
											<option value="qua">Graduate</option>
											<option value="qua">Post Graduate</option>
										</select>
									</div>
									<div class="qua">
										<label>Qualification :</label> <input type="text"
											name="website" value="">
									</div>
									<div class="spec">
										<label>Specification :</label> <select style="width: 100px;">
											<option value="spe">A</option>
											<option value="spe">B</option>
											<option value="spe">C</option>
										</select>
									</div>
									<!--<div class="seperate">-->
									<div class="university">

										<label>University: </label> <input type="text" name="website"
											value="">
									</div>

									<div class="year">

										<label>Year Of Passing : </label> <select>
											<option value="Phone">2000</option>
											<option value="Phone">2001</option>
											<option value="Phone">2002</option>
											<option value="Phone">2003</option>
											<option value="Phone">2004</option>
											<option value="Phone">2005</option>
											<option value="Phone">2006</option>
											<option value="Phone">2007</option>
										</select>

									</div>
									
								</form>
								<input class="skip" type="submit" value="Save & Continue" name="save"/>
							    <input class="skip" type="button" value="Skip" name="skip" />

							</div>


							<h3 class="acord_head">Certification/Awards/Achievements</h3>
							<div class="acord_cont">
								<form action="" class="multi">
									<div id="client">
										<p>
											<label >Achievements/Awards/Certification :</label> 
											<textarea type="text" > </textarea> 
										</p>
										<h3>(Max 250 characters)</h3>
									</div>
																	
									<input type="submit" value="Save" name="save" /> 
								</form>
                                   
							</div>
						</div>
						</div>
</body>
</html>