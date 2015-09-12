$(document).ready(function() {
	
	$("#org_name").on('keyup',function(e){
		var no = /([0-9])/;
		if($("#org_name").val() == ""){
			$("#org_name").focus();
	
			$("#error73").html("Please Enter Organization Name")
			
		}
		else if ($("#org_name").val().match(no) || $("#org_name").val().length < 5) {
			$("#org_name").focus();
			$("#error73").html("Please Enter Valid Name")
		}
		else{
			$("#error73").html("")
		}
			});
	
	
	$("#yearofestablishment").on('keyup',function(e) {
		
		 if($("#yearofestablishment").val().match(/([0-9]){4}/)){
			 $("#error74").html("")
		return true
			 
		}
		else{
			$("#yearofestablishment").focus()
			 $("#error74").html("Please Enter valid Year")
			
		}
	});
	
	$("#training_methodology").on('keyup',function(e){
		
		if($("#training_methodology").val() == ""){
			$("#training_methodology").focus();
	
			$("#error75").html("Please Enter the Methodology")
			
		}
				else{
			$("#error75").html("")
		}
			});
	
	var number=/([0-9])/;
	$("#hrsofoperations").on('keyup',function(e) {
		
		 if($("#hrsofoperations").val().match(number)){
			 $("#error76").html("")
		return true
			 
		}
		else{
			$("#hrsofoperations").focus()
			 $("#error76").html("Please Enter digits only")
			
		}
	});
	
$("#instituteEmail").on('keyup',function(e){
		
		var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var mail     =  $("#instituteEmail").val();
		
		if(!Cmail.test(mail)){			
			$("#instituteEmail").focus();		
			 $("#error77").html("Please Enter valid mail.")			
		}		
		else  {
			 $("#error77").html("")			
		}
		});
	
	$("#instituteLocPincode").on('keyup',function(e) {
		
		 if($("#instituteLocPincode").val().match(/([0-9]){6}/)){
			 $("#error84").html("")
		return true
			 
		}
		else{
			$("#instituteLocPincode").focus()
			 $("#error84").html("Please Enter valid Pincode")
			
		}
	});
	
	$("#institutewebsitename").on('keyup', function(e){
		var myVariable = "http://www.google.com/";
		if($("#institutewebsitename").val() == "")
		{
			 $("#error78").html("Please Enter Website.")
			 return true
		}
		else{
			$("#institutewebsitename").focus()
			$("#error78").html("")
		}
	});
	
	$("#contactpersonname").on('keyup', function(e) {
		var no = /([0-9])/;
		if ($("#contactpersonname").val() == "" || $("#contactpersonname").val().match(/([0-9])/)) {
			$("#contactpersonname").focus();

			$("#error79").html("Please Enter Name")

		}  else {
			$("#error79").html("")
		}
	});
	
	$("#phonetypeid").on('change',function(e){
		if($("#phonetypeid").val() != '0'){
		$("#errorphonetypeid").html('');
			return true;
		}
			});
	
$("#institutecontact85").on('keyup',function(e){
	
	if( $("#institutecontact85").val().length < 10){
		$("#institutecontact85").focus();	
		$("#error85").html("Please Enter Valid Number.")			
	}
	else{
		  $("#error85").html("")
	    }
		});

$("#bldng_flatno").on('keyup', function(e) {
	
	if ($("#bldng_flatno").val() == "") {
		$("#bldng_flatno").focus();

		$("#error81").html("Please Enter Building no/Flat no.")

	}  else {
		$("#error81").html("")
	}
});

$("#street82").on('keyup', function(e) {						
	if ($("#street82").val() == "") {
	$("#street82").focus();
	$("#error82").html("Please Enter Street")
	}  else {
	$("#error82").html("")
	}
	});

$("#landmark83").on('keyup', function(e) {

	if ($("#landmark83").val() == "") {
	$("#landmark83").focus();

	$("#error83").html("Please Enter Landmark")

	}  else {
	$("#error83").html("")
	}
	});

$("#instituteLocPincode").on('keyup',function(e) {
	
	 if($("#instituteLocPincode").val().match(/([0-9]){6}/)){
		 $("#error84").html("")		
	return true	  
	}
	else {
		$("#instituteLocPincode").focus()
		 $("#error84").html("Please Enter valid Pincode")
		return false
	}
});

$("#tpcountry").on('change',function(e){
	if($("#tpcountry").val() != '0'){
	$("#errortpcountry").html('');
		return true;
	}
		});

$("#tpstate").on('change',function(e){
	if($("#tpstate").val() != '0'){
	$("#errortpstate").html('');
		return true;
	}
		});

$("#tpcity").on('change',function(e){
	if($("#tpcity").val() != '0'){
	$("#errortpcity").html('');
		return true;
	}
		});

$("#assocName86").on('keyup', function(e) {						
	if ($("#assocName86").val() == "") {
	$("#assocName86").focus();
	$("#error86").html("")
	}  else {
	$("#error86").html("")
	}
	});

$("#clientName87").on('keyup', function(e) {						
	if ($("#clientName87").val() == "") {
	$("#clientName87").focus();
	$("#error87").html("")
	}  else {
	$("#error87").html("")
	}
	});
});

function validate15(key) {
	// getting key code of pressed key
	var keycode = (key.which) ? key.which : key.keyCode;

	// comparing pressed keycodes
	if (!(keycode == 8 || keycode == 16) && (keycode < 48 || keycode > 57)) {
		return false;
	}
}


function trainingProValidate(){
	
	if ($("#org_name").val() == "" || $("#org_name").val().match(/([0-9])/)) {
		$("#org_name").focus();
		$("#error73").html("Please Enter Valid Name4.")

		return false;
	}
	 else if($("#yearofestablishment").val()=="" || $("#yearofestablishment").val().length < 4 || $("#yearofestablishment").val().length > 4)
	 {
		 $("#error74").html("")
		 $("#yearofestablishment").focus();
		 $("#error74").html("Please Enter Valid Year.")
		 return false;
	 }
	 else if($("#training_methodology").val()=="")
	 {
		 $("#error75").html("")
		 $("#training_methodology").focus();
		 $("#error75").html("Please Enter the Methodology")
		 return false;
	 }
	 else if($("#hrsofoperations").val()=="")
	 {
		 $("#error76").html("")
		 $("#hrsofoperations").focus();
		 $("#error76").html("Please Enter Only in Digits")
		 return false;
	 }
	 else{
			
						var $nextContent = jQuery('.skipbtn4').parent().next()
								.next();
						jQuery(".acord .acord_cont").slideUp("fast",
								function() {

									$nextContent.show()
								});
						jQuery(".acord .acord_cont").hasClass().next()
								.slideDown("fast", function() {

									$nextContent.show()
								});
	 }
	
	
}
function trainingProValidate1(){
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail     =  $("#instituteEmail").val();
	var i=2;
	var k=document.getElementById("rowtot").value;
	
	k=k-1;
	for(var j=0; j<=k; j++){
			while(k!=0){
			if($("#phonetypeid"+j).val() == "" || $("#phonetypeid"+j).val() == '0') {	
			
				 $("#phonetypeid"+j).focus();
				 $("#errortpContact"+j).html("Please Select Type of Contact Number")
				
				 return false;
				 }
			k--;
		}
		
		
	 
}
	
	if($("#instituteEmail").val() == "" || !Cmail.test(mail)){
		 $("#instituteEmail").focus();
		 $("#error77").html("Please Enter Email Id")
		 return false;
	 }
	else if ($("#institutewebsitename").val() == "" ) {
		$("#institutewebsitename").focus();
		$("#error78").html("Please Enter Website.")
		return false;
	}
	
	else if ($("#contactpersonname").val() == "" || $("#contactpersonname").val().match(/([0-9])/)) {
		$("#contactpersonname").focus();
		$("#error79").html("Please Enter Valid Name.")
		return false;
	}
	
	 
	
	
	else if ($("#institutecontact85").val() == "" || $("#institutecontact85").val().length < 10) {
		$("#institutecontact85").focus();
		$("#error85").html("Please Enter Institute Contact Number")
		return false;
	}
	
	/* else if($("#tpContact").val() == "" || $("#tpContact").val() == '0') {			
		 $("#tpContact").focus();
		 $("#errortpContact").html("Please Select Type of Contact Number")
		 return false;
	 }*/
	else if ($("#p_scnt").val() == "" ) {
		$("#p_scnt").focus();
		$("#error '+ i +").html("Please Enter Contact No.")
		i++;
		return false;
	}

	else{
		
			var $nextContent = jQuery('.skipbtn5').parent().next()
					.next();
			jQuery(".acord .acord_cont").slideUp("fast",
					function() {

						$nextContent.show()
					});
			jQuery(".acord .acord_cont").hasClass().next()
					.slideDown("fast", function() {

						$nextContent.show()
							});

	}
	
}

function trainingProValidate2(){
	 if($("#bldng_flatno").val() == "" ){
		   $("#bldng_flatno").focus();
		   $("#error81").html("Please Enter information.")
		    return false;
		  }
	 else if($("#street82").val() == "" ){
		   $("#street82").focus();
		   $("#error82").html("Please Enter Street Name.")
		    return false;
		  }
	 else if($("#landmark83").val() == "" ){
		   $("#landmark83").focus();
		   $("#error83").html("Please Enter Landmark Name.")
		    return false;
		  }
	 else if($("#instituteLocPincode").val().length < 6 || $("#instituteLocPincode").val().length > 6)
	 {
		 $("#error84").html("")
		 $("#instituteLocPincode").focus();
		 $("#error84").html("Please Enter Valid Pincode.")
		 
		 return false;
	 }
	 else if($("#tpcountry").val() == "" || $("#tpcountry").val() == '0') {
			
		 $("#tpcountry").focus();
		 
		 $("#errortpcountry").html("Please Select Your Country")
		 return false;
	 }
	 else if($("#tpstate").val() == "" || $("#tpstate").val() == '0') {
			
		 $("#tpstate").focus();
		 
		 $("#errortpstate").html("Please Select Your State")
		 return false;
	 }
	 else if($("#tpcity").val() == "" || $("#tpcity").val() == '0') {
			
		 $("#tpcity").focus();
		 
		 $("#errortpcity").html("Please Select Your City")
		 return false;
	 }
	 else{
		
				var $nextContent = jQuery('.skipbtn6').parent().next()
						.next();
				jQuery(".acord .acord_cont").slideUp("fast",
						function() {

							$nextContent.show()
						});
				jQuery(".acord .acord_cont").hasClass().next()
						.slideDown("fast", function() {

							$nextContent.show()
						});
			 }
}

function trainingProValidate3(){
	if($("#assocName86").val() == "" ){
		   $("#assocName86").focus();
		   $("#error86").html("Please Enter Association Name.")
		    return false;
		  }
	else{
		
			var $nextContent = jQuery('.skipbtn8').parent().next()
					.next();
			jQuery(".acord .acord_cont").slideUp("fast",
					function() {

						$nextContent.show()
					});
			jQuery(".acord .acord_cont").hasClass().next()
					.slideDown("fast", function() {

						$nextContent.show()
					});
	}
}

function trainingProValidate4(){
	if($("#clientName87").val() == "" ){
		   $("#clientName87").focus();
		   $("#error87").html("Please Enter Association Name.")
		    return false;
		  }
	else{
		return true;
	}
}

function contactValidation(){
	$("#tpContact2").on('change',function(e){
		
		if($("#tpContact2").val() != '0'){
		$("#errortpContact").html("");
			return true;
		}
			});
}