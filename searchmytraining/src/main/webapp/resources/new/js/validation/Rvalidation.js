$(document).ready(function() {
//Password Strength checker code	
	
	$('#password').on('keyup', function(e) {
		
        // Must have capital letter, numbers and lowercase letters
        var strongRegex = new RegExp("^(?=.{6,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
 
        // Must have either capitals and lowercase letters or lowercase and numbers
        var mediumRegex = new RegExp("^(?=.{6,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
 
        // Must be at least 6 characters long
        var okRegex = new RegExp("(?=.{6,}).*", "g");
        
 
        if (okRegex.test($(this).val()) === false) {
            // If ok regex doesn't match the password
        	
        	$('#meter1').removeClass();
        	$('#meter2').removeClass();
        	$('#meter3').removeClass();
        	
        	$('#error4').html(" ");
            $('#meter1').html('<span style="color:red">Minimun password legth should be 6 </span>');
            
        	$('#meter2').html("");
        	$('#meter3').html("");
        	
 
        } else if (strongRegex.test($(this).val())) {
            // If reg ex matches strong password
        	$('#meter1').removeClass();
        	$('#meter1').addClass("strong");
        	$('#meter2').removeClass();
        	$('#meter2').addClass("strong");
        	$('#meter3').removeClass();
        	$('#meter3').addClass("strong");
        	$('#meter1').html("");
            $('#meter2').html("");
            $('#meter3').html("Strong")
           
        } else if (mediumRegex.test($(this).val())) {
            // If medium password matches the reg ex
        	$('#meter1').removeClass();
        	$('#meter1').addClass("good");
        	$('#meter2').removeClass();
        	$('#meter2').addClass("good");
        	$('#meter3').removeClass();
       
        	$('#meter1').html("");
            $('#meter2').html("Good");
            $('#meter3').html("");
        	
        } else {
            // If password is ok
        	$('#meter1').removeClass();
        	$('#meter1').addClass("weak");
        	$('#meter2').removeClass();
        	$('#meter3').removeClass();
        
        	$('#meter1').html("Weak");
            $('#meter2').html("");
            $('#meter3').html("");
        
        }
        if($('#password').val() == '' && $('#cnfpassword').val() == '')
        {
        	$('#error5').html(" ")
            $('#Match').html(" ")
            return false;
        }
 
     if($('#password').val() != '' && $('#cnfpassword').val() != '' && $('#password').val() != $('#cnfpassword').val())
    	{
    	 $('#error5').html("Password Not Match")
    	 $('#error5').css('color','red')
    	
        	return false;
    	}
     else if($('#password').val() == $('#cnfpassword').val())
     { 
    	 $('#error5').css('color','green')
    	  $('#error5').html("Password Match")
    	
    	 }
        
        return true;
	});

// Password match Code 
	$('#cnfpassword').on('keyup', function(e) {
		
		 
        if($('#password').val() == '' || $('#cnfpassword').val() == '')
        {
        	 $('#error5').html(" ")
        	 $('#error5').css('color','red')
            return false;
        }
 
     if($('#password').val() != '' && $('#cnfpassword').val() != '' && $('#password').val() != $('#cnfpassword').val())
    	{
    	 $('#error5').html("Password Not Match")
    	 $('#error5').css('color','red')
        	return false;
    	}
     else if($('#password').val() == $('#cnfpassword').val())
     { 
    	 $('#error5').css('color','green')
   	     $('#error5').html("Password Match")
    	 }
	
	})

$("#org_name").on ('keyup', function(e) {	
	var img = '<img src ="resources/images/error.png">'
	var Number = /([0-9])/;
	
	if($("#org_name").val() == "" )
		{
		 $("#error1").html(img).append(   "   Please Enter Valid Name.")
		    return false;
		}
	else if ($("#org_name").val().match(Number)) {
		 $("#org_name").focus();
		  $("#error1").html(img).append(  "   Please Enter Only Characters.")
	    return false;
	}
	else{
		
		$("#error1").html("")
		 return true;}
	
})

$("#city").on('change keyup',function(e) {
	var img = '<img src ="resources/images/error.png">'
	
		if($("#city").val() == " " || $("#city").val() == '0') {
			 
			 $("#city").focus();
			 
			 $("#error2").html(img).append(   "   Please Select Any Option.")
			 return false;
		}
		else{
			 $("#error2").html( " ")
		}
	 
})


$("#phone").on('keyup',function(e) {
	var img = '<img src ="resources/images/error.png">'
	var patt = /^((\\+91-?)|0)?[0-9]{10}$/;

	
	 if($("#phone").val().match(/^((\\+91-?)|0)?[0-9]{10}$/)){
		 $("#error3").html("")
		
	return true
	
	}
	else {
		$("#phone").focus()
		 $("#error3").html(img).append(  "   Please Enter valid Contact no")
		return false
	}
	 
})



$("#email1").on('keyup',function(e){
	var img = '<img src ="resources/images/error.png">'
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail     =  $("#email1").val();
	
	if(!Cmail.test(mail)){
		$("#email1").focus();
		
		 $("#error4").html(img).append(  "  Please Enter valid mail.")
		
	}
	
	else  {
		 $("#error4").html("")
		
	}
		
})

});

function validate(key)
{
//getting key code of pressed key
var keycode = (key.which) ? key.which : key.keyCode;

//comparing pressed keycodes
if (!(keycode==8 || keycode==9 || keycode==46)&&(keycode < 48 || keycode > 57))
{
return false;
}
}

//form validation code
function validation(path) {
	var img = '<img src ="resources/images/error.png">'
		
	var Number = /([0-9])/;
	var letter = /^[A-Za-z]+$/;
	var mob    = /^((\\+91-?)|0)?[0-9]{10}$/;
	var contact  =  $("#contact1").val();
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail     =  $("#email1").val();
	var captcha = $('#captch').html();
	var rcaptcha = $('#prcaptch').val();
	
	
	
	 if($("#org_name").val() == "" || $("#org_name").val().length < 5 || $("#org_name").val().match(Number) ){
		   $("#org_name").focus();
		   $("#error1").html(img).append(   "  Please Enter Valid Name.")
		    return false;
		  }
	 else if($("#cityid").val() == " " || $("#cityid").val() == '0') {
		 
		 $("#cityid").focus();
		 
		 $("#error2").html(img).append(   "   Please Select Any Option.")
		 return false;
	}
	 
	 else if($("#phone").val() == "" || $("#phone").val().length < 10 || $("#phone").val().length > 10)
	 {
		 $("#error2").html("")
		 $("#phone").focus();
		 $("#error3").html(img).append(   "    Please Enter Contact no")
		 return false;
	 }
	
	 else if($("#email1").val() == "" || !Cmail.test(mail)){
		 $("#email1").focus();
		 $("#error4").html(img).append(  "   Please Enter Email Id")
		 return false;
	 }
	
	 else if($("#password").val() == "" || $("#password").val().length < 6){
		 $("#password").focus();
		 $('#error5').html(img).append(  "   Please Enter Password")
		 
		 return false;
	 }
	 else if($("#cnfpassword").val() == "" || $('#password').val() !== $('#cnfpassword').val()){
		 $("#cnfpassword").focus();
		 $("#error5").html(img).append("Please Enter Password Same Above")
		 return false;
	 }
	 else if(String(captcha).trim().localeCompare(String(rcaptcha).trim())!=0){
			$('#prcaptch').focus();
			return false;
		}
	 return true;	 
}