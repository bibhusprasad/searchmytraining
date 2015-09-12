                  $(document).ready(function() {
                	  $("#name").on('keyup',function(e){
                			var no = /([0-9])/;
                			if($("#name").val() == " "){
                				$("#name").focus();
                		
                				$("#error51").html("Please Enter First Name")
                				
                			}
                			else if ($("#name").val().match(no) || $("#name").val().length < 3) {
                				$("#name").focus();
                				$("#error51").html("Please Enter Valid Name")
                				
                			}
                			else{
                				$("#error51").html(" ")
                			}
                				});

					$("#email")
							.on(
									'keyup',
									function(e) {

										var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
										var mail = $("#email").val();

										if (!Cmail.test(mail)) {

											$("#email").focus();

											$("#error52").html(
													"Please Enter valid mail.")

										}

										else {
											$("#error52").html("")

										}
									});
					
					  var number = /([0-9])/; 
					  $("#contact").on('keyup',function(e) {
					  
					  if ($("#contact").val().match(number) || $("#contact").val().length > 10)
					  {
					  $("#error53").html("") 
					  return true
					   } else 
					   {
						   $("#contact").focus();
					  $("#error53").html("Please Enter valid Contact")
					   } });
					 
					  $("#employmenttype").on('change',function(e){
						if($("#employmenttype").val() != '0'){
							$("#erroremp").html('');
							return true;
						}
					  });
					  
					  $("#tindustry").on('change',function(e){
							if($("#tindustry").val() != '0'){
								$("#errorindustry").html('');
								return true;
							}
						  });
					  
					  $("#industrycatid").on('change',function(e){
							if($("#industrycatid").val() != '0'){
								$("#errorspecialization").html('');
								return true;
							}
						  });
					  
					  $("#employer").on('keyup', function(e) {
							
							if ($("#employer").val() == "") {
								
								$("#employer").focus();

								$("#error506").html("Please Enter Employer")

							}  else {
								$("#error506").html("")
							}
						});
								});
                  
                  $("#flatno54").on('keyup', function(e) {
						
						if ($("#flatno54").val() == "") {
							$("#flatno54").focus();

							$("#error54").html("Please Enter Building no/Flat no.")

						}  else {
							$("#error54").html("")
						}
					});
					
$("#street55").on('keyup', function(e) {						
	if ($("#street55").val() == "") {
	$("#street55").focus();
			$("#error55").html("Please Enter Street Name")
				}  else {
				$("#error55").html("")
				}
			});

$("#landm56").on('keyup', function(e) {
	
	if ($("#landm56").val() == "") {
		$("#landm56").focus();

		$("#error56").html("Please Enter Your Lamdmark")

	}  else {
		$("#error56").html("")
	}
});

$("#pin57").on('keyup',function(e) {
	
	 if($("#pin57").val().match(/([0-9]){6}/)){
		 $("#error57").html("")
	return true
	}
	else {
		$("#pin57").focus()
		 $("#error57").html("Please Enter valid Pincode")
		return false
	}
})

     $("#countryid").on('change',function(e){
			if($("#countryid").val() != '0'){
			$("#errorcountry").html('');
				return true;
			}
				});

$("#stateid").on('change',function(e){
	if($("#stateid").val() != '0'){
	$("#errorstate").html('');
		return true;
	}
		});

$("#cityid").on('change',function(e){
	if($("#cityid").val() != '0'){
	$("#errorcity").html('');
		return true;
	}
		});

var number = /([0-9])/;
					$("#traineephone1").on('keyup', function(e) {

						if ($("#traineephone1").val()== "" ) {
							$("#error58").html("Please Enter Contact Number")
							return true
						} else {
							$("traineephone1").focus()
							$("#error58").html("")
						}
					});
                  
					$("#traineephoneid1").on('change',function(e){
						if($("#traineephoneid1").val() != '0'){
						$("#errortcontact").html('');
							return true;
						}
							});

							$("#smail60").on('keyup',function(e) {

							var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
							var mail = $("#smail60").val();

							if (!Cmail.test(mail)) {

								$("#smail60").focus();

								$("#error60").html("Please Enter valid mail")
										}
										else {
											$("#error60").html("")
										}
									});
					
$("#web59").on('keyup', function(e) {
	var reg=/^\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/;
	if ($("#web59").val() == " " || $("#web59").val().match(reg)) {
		$("#web59").focus();

		$("#error59").html("Please Enter Website")

	}  else {
		$("#error59").html(" ")
	}
});



 function validate13(key)
              {
                  //getting key code of pressed key
                  var keycode = (key.which) ? key.which : key.keyCode;

                  //comparing pressed keycodes
                  if (!(keycode==8 || keycode==16)&&(keycode < 48 || keycode > 57))
                  {
                  return false;
                  }
                  }

 function validateName(key){
	 var keycode = (key.which) ? key.which : key.keycode;
	 if(!(keycode== 8 || keycode== 32) && (keycode < 65 || keycode > 90) && (keycode < 61 || keycode > 122))
		 {
		 return false;
		 }
 }
function validationTProf() {

	var Number = /([0-9])/;
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail = $("#email").val();
    
	 if($("#name").val() == "" || $("#name").val().length < 3 || $("#name").val().match(Number) ){
		   $("#name").focus();
		   $("#error51").html("Please Enter Valid Name.")
		    return false;
		  }

	else if ($("#email").val() == " " || !Cmail.test(mail)) {
		$("#email").focus();
		$("#error52").html("Please Enter Email Id")
		
		return false;		
	} 
	
	else if($("#contact").val() == " " || $("#contact").val().length < 10  )
	 {
		 
		 $("#error53").html("")
		 $("#contact").focus();
		 $("#error53").html("Please Enter Contact Number")
		 return false;
	 }
	 
	else{
				  
		        var $nextContent = jQuery('.skipbtn1').parent().next().next();
		        jQuery(".acord .acord_cont").slideUp("fast", function () {
		       
		            $nextContent.show()
		        });
		        jQuery(".acord .acord_cont").hasClass().next().slideDown("fast", function () {
		            
		            $nextContent.show()
		        });
	}
}

function tProf2(){
	
	 if($("#flatno54").val() == "" ){
		   $("#flatno54").focus();
		   $("#error54").html("Please Enter Valid Name.")
		    return false;
		  }
	 else if($("#street55").val() == "" ){
		   $("#street55").focus();
		   $("#error55").html("Please Enter Valid Name.")
		    return false;
		  }
	 else if($("#landm56").val() == "" ){
		   $("#landm56").focus();
		   $("#error56").html("Please Enter Valid Name.")
		    return false;
		  }
	 else if($("#pin57").val().length < 6 || $("#pin57").val().length > 6)
	 {
		 $("#error505").html("")
		 $("#pin57").focus();
		 $("#error57").html("Please Enter Valid Pincode.")
		 
		 return false;
		 }
        else if($("#countryid").val() == "" || $("#countryid").val() == '0') {
		
		 $("#countryid").focus();
		 
		 $("#errorcountry").html("Please Select Your Country")
		 return false;
	 }
         else if($("#stateid").val() == "" || $("#stateid").val() == '0') {
	 
	     $("#stateid").focus();
	 
	     $("#errorstate").html("Please Select Your State")
	     return false;
     }
         else if($("#cityid").val() == "" || $("#cityid").val() == '0') {
	 
	     $("#cityid").focus();
	 
	     $("#errorcity").html("Please Select Your State")
	     return false;
     }
	 
	 else  {
		        var $nextContent = jQuery('.skipbtn3').parent().next().next();
		        jQuery(".acord .acord_cont").slideUp("fast", function () {
		       
		            $nextContent.show()
		        });
		        return true;
		        jQuery(".acord .acord_cont").hasClass().next().slideDown("fast", function () {
		            $nextContent.show()
		        });
		   
	 }
}

function tProf4(){
	 if($("#employmenttype").val() == '0' || $("#employmenttype").val() == ' ') {
		 
	     $("#employmenttype").focus();
	
	     $("#erroremp").html("Please Select Any Option")
	     return false;
    }
	 else if($("#tindustry").val() == '0' || $("#tindustry").val() == ' ') {
		 
	     $("#tindustry").focus();
	    
	     $("#errorindustry").html("Please Select Any Option")
	     return false;
    }
     else if($("#industrycatid").val() == '0' || $("#industrycatid").val() == ' ') {
		 
	     $("#industrycatid").focus();
	    
	     $("#errorfunarea").html("Please Select Any Option")
	     return false;
    }
     else if($("#industrysubcatid").val() == '0' || $("#industrysubcatid").val() == ' ') {
		 
	     $("#industrysubcatid").focus();
	    
	     $("#errorspecialization").html("Please Select Any Option")
	     return false;
    }
	 else if($("#employer").val() == "" ){
		   $("#employer").focus();
		   $("#error506").html("Please Enter Valid Name.")
		   return false;
		  }
	 
	else{
		        var $nextContent = jQuery('.skipbtn2').parent().next().next();
		        jQuery(".acord .acord_cont").slideUp("fast", function () {
		       
		            $nextContent.show()
		        });
		        updateempdet();
		        jQuery(".acord .acord_cont").hasClass().next().slideDown("fast", function () {
		            
		            $nextContent.show()
		        });
	}
	
}
function tProf3(){
	console.log("in traineeContactDet");
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail = $("#smail60").val();
	var reg=/^\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/;
	
       if($("#traineephoneid1").val() == '0' || $("#traineephoneid1").val() == ' ') {
	     $("#traineephoneid1").focus();
	    
	     $("#errortcontact").html("Please Select Type of Contact")
	     return false;
    }
       else if($("#traineephone1").val() == "" || $("#traineephone1").val().length < 10)
	 {
		 $("#error58").html("")
		 $("#traineephone1").focus();
		 $("#error58").html("Please Enter Contact Number")
		 
		 return false;
	 }
	
	  else if($("#web59").val() == "" || $("#web59").val().match(reg)){
		   $("#web59").focus();
		   $("#error59").html("Please Enter Website")
		    return false;
		  }
	
	else if ($("#smail60").val() == " " || !Cmail.test(mail)) {
		$("#smail60").focus();
		$("#error60").html("Please Enter Email Id")
		
		return false;		
	} 
    return true;
}


function updateempdet() {

	console.log("in updateempdet...");
	try {
		$.ajax({
			url : "./updateempdet",
			dataType : "json",
			type : "post",
			data : JSON.stringify({
				"employmentType" : $("#employmenttype").val(),
				"industrysubcatid" : $("#industrysubcatid").val(),
				"employer" : $("#employer").val(),
				"jobProfile" : $("#jobprofileid").val(),
				"userid" : $('#userid').val()
			}),
			contentType : "application/json",
			success : function(response) {
				console.log("in success...updateempdet");
				if (response.errorMsg) {
					$.map(response.errorMsg, function(val, key) {
						if (key == "employmentType")
							$('#erroremp').text(val);
						else if (key == "industrysubcatid")
							$('#errorspecialization').text(val);
						else if (key == "employer")
							$('#error506').text(val);
						else if (key == "jobProfile")
							$('#errorjobprofile').text(val);
					});
				} 
			},
			error : function(response) {
				alert("in error...: "+response);
			}
		});

	} catch (ex) {
		console.log(ex);
	}
}

function saveTraineeLocationDetails(path) {
	console.log("In saveInstituteLocationDetails()...");
	var flag = tProf2();
	console.log(flag);
	if (flag) {

		try {
			$.ajax({
				url : path + '/updatelocinfo',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"bldng_flatno" : $('#flatno54').val(),
					"street" : $('#street55').val(),
					"landmark" : $('#landm56').val(),
					"pincode" : $('#pin57').val(),
					"country" : $('#countryid').val(),
					"state" : $('#stateid').val(),
					"city" : $('#cityid').val(),
					"userid" : $('#userid').val()
				}),
				contentType : "application/json",
				success : function(response) {
					/* alert("hey... you are in success congratz :-)"); */
				},
				error : function() {
					console.log("in error msg...");
				}
			});
		} catch (ex) {
			alert(ex);
		}
	}
	else
		console.log("in else...");
}

function traineeContactDet(path)
{
	var flag = tProf3();
	console.log("in traineeContactDet... flag:"+flag);
	if (flag) {
		var phones = [];
		var phonetypeids = [];
		for (i = 1; i <= 5; i++) {
			if ($('#traineephoneid' + i).val())
				phonetypeids.push($('#traineephoneid' + i).val());
			if ($('#traineephone' + i).val())
				phones.push($('#traineephone' + i).val());
		}
		try {
			$.ajax({
				url : path + '/updatecontactinfo',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"userid" : $('#userid').val(),
					"email" : $('#smail60').val(),
					"website" : $('#web59').val(),
					"contactpersonname" : $('#name').val(),
					"phonetypeid" : phonetypeids,
					"phone" : phones
				}),
				contentType : "application/json",
				success : function(response) {
					 alert("hey... you are in success congratz :-)"); 
				},
				error : function() {
					console.log("in error msg...");
				}
			});
		} catch (ex) {
			alert(ex);
		}
	}
	else
		console.log("in else...");
}
