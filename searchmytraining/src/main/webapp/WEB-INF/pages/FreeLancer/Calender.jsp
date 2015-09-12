<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/AddDel.js"></script>
<script type="text/javascript">

$('#acord2').accordion({
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
   <div id="acord2" class="acord">
                        	<h3 class="acord_head">ADD Calender</h3>
                        	<div class="acord_cont">
                        	  <form action="#" method="get" class="addcalender">
                        	      <div class=ctitle>
                        	        <label>Title:</label><input type="text" name="ctitle" value=""/>
                        	      </div>
                        	  <div class="Start_date">
                        	     <label>From Date:</label><input type="text" class="datepicker">
                        	  </div>
                        	  <div class="To_date">
                        	     <label>From Date:</label><input type="text" class="datepicker">
                        	  </div>
                        	  <div class="c_type">
                        	  <label>Type:</label>
                        	  <select>
                        	   <option value="seminar">Seminar</option>
                        	   <option value="Workshop">Workshop</option>
                        	    <option value="Training">Training</option>
                        	  
                        	  </select>
                        	  
                        	  </div>
                        	  <div class="price">
                        	   <label>Price:</label>
                        	   <input type="text" value="" name="price"/>
                        	  
                        	  </div>
                        	  <div class="broucher">
                        	   <label>Brochure:</label>
                        	         <input id="uploadFile" placeholder="Choose File" disabled="disabled" />
                                       <div class="fileUpload btn btn-primary">
                                           <span>Upload</span>
                                         <input id="uploadBtn" type="file" class="upload" />
                                     </div>
                                     <script>
                                        document.getElementById("uploadBtn").onchange = function () {
	                                     document.getElementById("uploadFile").value = this.value;
	                                                                                };
                                      </script>
                        	  </div>
                        	  <div class="description">
                        	   <label>Description:</label>
                        	      <textarea rows="4" cols="39"></textarea>
                        	   </div>
                        	  <div class="save">
										<input type="button" value="Save" name="save" onclick="saveInstituteDetails();" /> 
										
									</div>
                        	  </form>
                        	  <input class="skip" type="submit" value="Save & Continue" name="save"/>
							    <input class="skip" type="button" value="Skip" name="skip" />
                      </div>
                      	<h3 class="acord_head">View & Modify Calendar</h3>
                        	<div class="acord_cont">
                        	  <form action="#" method="get" class="view">
                        	   <div class="sortBy">
                        	      <label>View By:</label>
                        
                        	        <select onchange="displaybox(this.value);">
                        	        <option>Select</option>
                        	        <option>Date</option>
                        	         <option>Calender Name</option>
                        	          <option>Course Name</option>
                        	      </select>
                        	      
                        	   </div>
                        	   <div class="hidevalue">
                        	      <input type="text" value="" name="Calendername" id="hide" />
                        	  </div>
                        	  <input type="button" value="Save" name="save2"  /> 
                        	  </form>
                        	  
                      </div>
					</div>
</body>
</html>