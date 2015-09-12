$(document).ready(function() {
//Password Strength checker code	

	$('#password12').on('keyup', function(e) {
		
		 
		 
		 
        // Must have capital letter, numbers and lowercase letters
        var strongRegex = new RegExp("^(?=.{6,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
 
        // Must have either capitals and lowercase letters or lowercase and numbers
        var mediumRegex = new RegExp("^(?=.{6,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
 
        // Must be at least 6 characters long
        var okRegex = new RegExp("(?=.{6,}).*", "g");
        
 
        if (okRegex.test($(this).val()) === false) {
            // If ok regex doesn't match the password
        	
        	$('#meter12').removeClass();
        	$('#meter13').removeClass();
        	$('#meter14').removeClass();
        	
        	$('#error15').html(" ")
            $('#meter12').html(" ")
        	$('#meter13').html("")
        	$('#meter14').html("")
        	
 
        } else if (strongRegex.test($(this).val())) {
            // If reg ex matches strong password
        	$('#meter12').removeClass();
        	$('#meter12').addClass("strong");
        	$('#meter13').removeClass();
        	$('#meter13').addClass("strong");
        	$('#meter14').removeClass();
        	$('#meter14').addClass("strong");
        	$('#meter12').html("")
            $('#meter13').html("")
            $('#meter14').html("Strong")
           
        } else if (mediumRegex.test($(this).val())) {
            // If medium password matches the reg ex
        	$('#meter12').removeClass();
        	$('#meter12').addClass("good");
        	$('#meter13').removeClass();
        	$('#meter13').addClass("good");
        	$('#meter14').removeClass();
       
        	$('#meter12').html("")
            $('#meter13').html("Good")
            $('#meter14').html("")
        	
        } else {
            // If password is ok
        	$('#meter12').removeClass();
        	$('#meter12').addClass("weak");
        	$('#meter13').removeClass();
        	$('#meter14').removeClass();
        
        	$('#meter12').html("Weak")
            $('#meter13').html("")
            $('#meter14').html("")
        
        }
        if($('#password12').val() == '' && $('#cnfpassword12').val() == '')
        {
        	$('#error15').html(" ")
            $('#Match').html(" ")
            return false;
        }
 
     if($('#password12').val() != '' && $('#cnfpassword12').val() != '' && $('#password12').val() != $('#cnfpassword12').val())
    	{
    	 $('#error15').html("Password Not Match")
    	 $('#error15').css('color','red')
    	
        	return false;
    	}
     else if($('#password12').val() == $('#cnfpassword12').val())
     { 
    	 $('#error15').css('color','green')
    	  $('#error15').html("Password Match")
    	
    	 }
        
        return true;
	});
// Password match Code 
	$('#cnfpassword12').on('keyup', function(e) {
		
		 
        if($('#password12').val() == '' || $('#cnfpassword12').val() == '')
        {
        	 $('#error15').html(" ")
        	 $('#error15').css('color','red')
            return false;
        }
 
     if($('#password12').val() != '' && $('#cnfpassword12').val() != '' && $('#password12').val() != $('#cnfpassword12').val())
    	{
    	 $('#error15').html("Password Not Match")
    	 $('#error15').css('color','red')
        	return false;
    	}
     else if($('#password12').val() == $('#cnfpassword12').val())
     { 
    	 $('#error15').css('color','green')
   	     $('#error15').html("Password Match")
    	 }
	
	})


$("#name12").on ('keyup ', function(e) {
	var Number = /([0-9])/;
	var img = '<img src ="resources/images/error.png">'
	if($("#name12").val() == "" )
		{
		
	 $("#error11").html(img).append("  Please Enter Valid Name.")
		    return false;
		}
	else if ($("#name12").val().match(Number)) {
		 $("#name12").focus();
		  $("#error11").html(img).append(" Please Enter Only Characters.")
	    return false;
	}
	else{
		
		$("#error11").html("")
		 return true;}
	
})

$("#City_name12").on('change keyup',function(e) {
	
	var img = '<img src ="resources/images/error.png">'
		if($("#City_name12").val() == " " || $("#City_name12").val() == 0) {
			 
			 $("#City_name12").focus();
			 
			 $("#error12").html(img).append("  Please Select Any Option.")
			 return false;
		}
		else{
			 $("#error12").html(" ")
			 return true;
		}
})


$("#contact12").on('keyup',function(e) {
	var img = '<img src ="resources/images/error.png">'
		
	 if($("#contact12").val().match(/^((\\+91-?)|0)?[0-9]{10}$/)){
		 $("#error13").html("")
	return true
		 
	}
	else{
		$("#contact12").focus()
		 $("#error13").html(img).append("  Please Enter valid Contact")
		
	}
})



$("#email12").on('keyup',function(e){
	var img = '<img src ="resources/images/error.png">'
		
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail     =  $("#email12").val();
	
	if(!Cmail.test(mail)){
		
		$("#email12").focus();
		
		 $("#error14").html(img).append("  Please Enter valid mail.")
		
	}
	
	else  {
		 $("#error14").html("")
		
	}
	
	
	
})







});

function validate12(key)
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
function validation12() {
	
	var img = '<img src ="resources/images/error.png">'
	
	var Number = /([0-9])/;
	var letter = /^[A-Za-z]+$/;
	var mob    = /^[1-9]{1}[0-9]{9}$/;
	var Cmail1 = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var name1 = $("#name12").val();
	var city1     =  $("#name12").val();
	var contact1  =  $("#contact12").val();
	var mail1     =  $("#email12").val();
	var pass     =   $("#password").val();
	var captcha = $('#captchf').html();
	var rcaptcha = $('#frcapch').val();

	
	 if($("#name12").val() == ""  || $("#name12").val().length < 3 || $("#name12").val().match(Number)){
		   $("#name12").focus();
		   $("#error11").html(img).append("  Please Enter Valid Name.")
		    return false;
		  }
    else if($("#City_name12").val() == " " || $("#City_name12").val() == 0) {
		 
		 $("#City_name12").focus();
		 
		 $("#error12").html(img).append("  Please Select Any Option.")
		 return false;
	}
	 
	 else if($("#contact12").val() == "" || $("#contact12").val().length < 10 || $("#contact12").val().length > 10 )
	 {
		 $("#error12").html("  ")
		 $("#contact12").focus();
		 $("#error13").html(img).append("  Please Enter Contact.")
		 return false;
	 }
	
	 else if($("#email12").val() == "" || !Cmail1.test(mail1)){
		 $("#email12").focus();
		 $("#error14").html(img).append("  Please Enter Email Id")
		 return false;
	 }
	
	 else if($("#password12").val() == "" || $("#password12").val().length < 6){
		 $("#password12").focus();
		 $('#error15').html(img).append("  Please Enter Password")
		
		 return false;
	 }
	 else if($("#cnfpassword12").val() == "" || $('#password12').val() !== $('#cnfpassword12').val()){
		 $("#cnfpassword12").focus();
		 $('#error15').html(img).append("  Please Enter Password Same Above")
		 return false;
	 }
	 else if(String(captcha).trim().localeCompare(String(rcaptcha).trim())!=0){
			$('#frcapch').focus();
			return false;
		}
	return true;
}

