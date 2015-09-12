$(document).ready(function() {
	var img = '<img src ="resources/images/error.png">'
		
	$("#firstname22").on('keyup',function(e){
		var no = /([0-9])/;
		if($("#firstname22").val() == ""){
			$("#firstname22").focus();
	
			$("#error29").html(img).append("  Please Enter Name")
			
		}
		else if ($("#firstname22").val().match(no)) {
			$("#firstname22").focus();
			$("#error29").html(img).append("  Please Enter Valid Name")
			
		}
		else{
			$("#error29").html("")
		}
		
		
		
	});
	
	
	/*$("#lname22").on('keyup',function(e){
		var no = /([0-9])/;
		if($("#lname22").val() == ""){
			
			$("#lname22companyName21").focus();
	
			$("#error30").html(img).append("  Please Enter Last Name")
			
		}
		else if ($("#lname22").val().match(no)) {
			$("#lname22").focus();
			$("#error30").html(img).append("  Please Enter Valid Last Name")
			
		}
		else{
			$("#error30").html("")
		}
		
		
		
	});*/
	
	$("#title22").on('keyup',function(e){
		var no = /([0-9])/;
		if($("#title22").val() == ""){
			$("#title22").focus();
			
			$("#error31").html(img).append("  Please Enter Name")
			
		}
		else if ($("#title22").val().match(no)) {
			$("#title22").focus();
			$("#error31").html(img).append("  Please Enter Valid Name")
			
		}
		else{
			$("#error31").html("")
		}
		
		
		
	});
	
	
	$("#city22").on('keyup',function(e){
		var no = /([0-9])/;
		if($("#city22").val() == ""){
			$("#city22").focus();
			
			$("#error32").html(img).append("  Please Enter Name")
			
		}
		
		else{
			$("#error32").html("")
		}
		
		
		
	});
		
	$("#email22").on('keyup',function(e){
		
		var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var mail     =  $("#email22").val();
		
		if(!Cmail.test(mail)){
			
			$("#email22").focus();
		
			 $("#error33").html(img).append("  Please Enter valid mail.")
			
		}
		
		else  {
			 $("#error33").html("")
			
		}
		});
	
	$("#mob22").on('keyup',function(e) {
		
		 if($("#mob22").val().match(/^((\\+91-?)|0)?[0-9]{10}$/)){
			 $("#error34").html("")
		return true
			 
		}
		else{
			$("#mob22").focus()
			 $("#error34").html(img).append("  Please Enter valid Contact")
			
		}
	});

	
});

function TEValidate(key)
{
//getting key code of pressed key
var keycode = (key.which) ? key.which : key.keyCode;

//comparing pressed keycodes
if (!(keycode==8 || keycode==9 || keycode==46)&&(keycode < 48 || keycode > 57))
{
return false;
}
}



function TEvalidate(){
	var img = '<img src ="resources/images/error.png">'
	/*var lname = $("#lname22").val();*/
	var Number = /([0-9])/;
	var letter = /^[A-Za-z]+$/;
	var mob1    = /^[1-9]{1}[0-9]{9}$/;
	var Cmail22 = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail22 = $('#email22').val();
	
	
	 if($("#firstname22").val() == "" || $("#firstname22").val().length < 3 || $("#firstname22").val().match(/([0-9])/) ){
		   $("#firstname22").focus();
		   $("#error29").html(img).append("   Please Enter  Name.")
		    return false;
		  }
	 /*else if($("#lname22").val() == "" || $("#lname22").val().length < 3 || $("#lname22").val().match(/([0-9])/)){
		 $("#lname22").focus();
		   $("#error30").html(img).append("  Please Enter Last Name.")
		    return false;
	 }
	 */
	 else if($('#title22').val() == '' || $('#title22').val().length <3 || $('#title22').val().match(/([0-9])/))
	 {
		 $("#error2").html("")
		 $("#title22").focus();
		 $("#error31").html(img).append("  Please Enter Title.")
		 return false;
	 }
	
	 else if($("#city22").val() == "0"){
		 $("#city22").focus();
		 $("#error32").html(img).append("  Please Enter City Name")
		 return false;
	 }
	
	 else if($("#email22").val() == "" || !Cmail22.test(mail22) ){
		 $("#email22").focus();
		 $("#error33").html(img).append("  Please Enter Email Id")
		 return false;
	 }
	 else if($("#mob22").val() == "" || $("#mob22").val().match(/^[A-Za-z]+$/) ){
		 $("#mob22").focus();
		 $("#error34").html(img).append("  Please Enter Contact")
		 return false;
	 }
	 return true;
}
