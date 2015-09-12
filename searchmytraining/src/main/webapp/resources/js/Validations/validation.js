$(document).ready(function() {
//Password Strength checker code	
	
	$('#pass1').on('keyup', function(e) {
        // Must have capital letter, numbers and lowercase letters
        var strongRegex = new RegExp("^(?=.{6,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
 
        // Must have either capitals and lowercase letters or lowercase and numbers
        var mediumRegex = new RegExp("^(?=.{6,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
 
        // Must be at least 6 characters long
        var okRegex = new RegExp("(?=.{6,}).*", "g");
 
        if (okRegex.test($(this).val()) === false) {
            // If ok regex doesn't match the password
        	
        	$('#meter01').removeClass();
        	$('#meter02').removeClass();
        	$('#meter03').removeClass();
        	
        	$('#error04').html(" ")
            $('#meter01').html(" ")
        	$('#meter02').html("")
        	$('#meter03').html("")
        	
 
        } else if (strongRegex.test($(this).val())) {
            // If reg ex matches strong password
        	$('#meter01').removeClass();
        	$('#meter01').addClass("strong");
        	$('#meter02').removeClass();
        	$('#meter02').addClass("strong");
        	$('#meter03').removeClass();
        	$('#meter03').addClass("strong");
        	$('#meter01').html("")
            $('#meter02').html("")
            $('#meter03').html("Strong")
           
        } else if (mediumRegex.test($(this).val())) {
            // If medium password matches the reg ex
        	$('#meter01').removeClass();
        	$('#meter01').addClass("good");
        	$('#meter02').removeClass();
        	$('#meter02').addClass("good");
        	$('#meter03').removeClass();
       
        	$('#meter01').html("")
            $('#meter02').html("Good")
            $('#meter03').html("")
        	
        } else {
            // If password is ok
        	$('#meter01').removeClass();
        	$('#meter01').addClass("weak");
        	$('#meter02').removeClass();
        	$('#meter03').removeClass();
        
        	$('#meter01').html("Weak")
            $('#meter02').html("")
            $('#meter03').html("")
        
        }
        if($('#pass1').val() == '' && $('#cpass').val() == '')
        {
        	$('#error04').html(" ")
            $('#Match').html(" ")
            return false;
        }
 
     if($('#pass1').val() != '' && $('#cpass').val() != '' && $('#pass1').val() != $('#cpass').val())
    	{
    	 $('#error04').html("Password Not Match")
    	 $('#error04').css('color','red')
    	
        	return false;
    	}
     else if($('#pass1').val() == $('#cpass').val())
     { 
    	 $('#error04').css('color','green')
    	  $('#error04').html("Password Match")
    	
    	 }
        
        return true;
    });


	$('#cpass').on('keyup', function(e) {
		
		 
        if($('#pass1').val() == '' || $('#cpass').val() == '')
        {
        	 $('#error04').html(" ")
        	 $('#error04').css('color','red')
            return false;
        }
 
     if($('#pass1').val() != '' && $('#cpass').val() != '' && $('#pass1').val() != $('#cpass').val())
    	{
    	 $('#error04').html("Password Not Match")
    	 $('#error04').css('color','red')
        	return false;
    	}
     else if($('#pass1').val() == $('#cpass').val())
     { 
    	 $('#error04').css('color','green')
   	     $('#error04').html("Password Match")
    	 }
	
	})
	
$('#selType').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#selType').val()=='' || $('#selType').val() == '0'){
		
		$('#selType').focus();
		  $('#error00').html(img).append("   Please Select Type");
                      return false;
	}
	else{
		$('#error00').html("")
	}
	
})

	
	
$("#fname").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	var Number = /([0-9])/;
	
	if($("#fname").val() == "" )
		{
		   $('#fname').focus()
		   $('#error01').html(img).append(" Please Enter Name")
    
		    return false;
		}
	else if ($("#fname").val().match(Number)) {
		   $('#fname').focus()
		   $('#error01').html(img).append(" Please Enter Valid Name")
		  
	    return false;
	}
	else{
		
		$("#error01").html("")
		 return true;}
	
})

$("#mob").on('keyup',function(e) {
	var img = '<img src ="resources/images/error.png">'
		
	 if($("#mob").val().match(/^((\\+91-?)|0)?[0-9]{10}$/)){
		 
		 $('#error02').html("").append(" ")
		
	        return true
		 
	}
	else{
		$("#mob").focus()
		 
		  $('#error02').html(img).append(" Please Enter Valid Contact")
	}
})



$("#email").on('keyup',function(e){
	
	var img = '<img src ="resources/images/error.png">'
		
	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail     =  $("#email").val();
	
	if(!Cmail.test(mail)){
		
		$("#email").focus();
		
		   $('#error03').html(img).append(" Please Enter Valid Email")
	}
	
	else  {
		
		 $("#error03").html("")
		
	}
	
})
});

function validate02(key)
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
function validation01() {
	
	
	var img = '<img src ="resources/images/error.png">'
	var Number = /([0-9])/;
	var letter = /^[A-Za-z]+$/;
	var mob1    = /^[1-9]{1}[0-9]{9}$/;
	var Cmail1 = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail01 = $('#email').val();
	var captcha = $('#captch').html();
	var rcaptcha = $('#rcapcthar').val();
	

	
		if($('#selType').val()=='' || $('#selType').val() == '0'){
			
			$('#selType').focus();
			  $('#error00').html(img).append("   Please Select Type");
                          return false;
		}
		else if ($('#selType').val( )=="Corporate" && $('#name2').val()=='') {
			
			  $('#error00').html(img).append("   Please Enter Name");
			    	
			          $('#name2').focus();
                                  return false;
			   
		} 
	else if ($('#fname').val() == "" || $('#fname').val().length <3 || $('#fname').val().match(Number) ) {
		$('#fname').focus();
		
		   $('#error00').html("  ");
		   $('#error01').html(img).append(" Please Enter Valid Name");
                   return false;
		  
		
	}
	else if ($('#mob').val() == '' || $('#mob').val().length<10) {
		$('#mob').focus();

		   $('#error02').html(img).append(" Please Enter Valid Contact");
                   return false;
		  
		
	}
	else if($("#email").val() == "" || !Cmail1.test(mail01))
{
		$('#email').focus();

		   $('#error03').html(img).append(" Please Enter Valid Email");
                   return false;
		  

}
	else if ($("#pass1").val() == "" || $("#pass1").val().length < 6) {
		$('#pass1').focus();
		 $('#error04').css('color','red');
		  $('#error04').html(img).append("  Please Enter Password");
                  return false;
	}
	else if ($("#cpass").val() == "" || $('#pass1').val() !== $('#cpass').val()) {
		$('#cpass').focus();
		 $('#error04').html(img).append(" Please Enter Password Same Above");
                 return false;
	}
	else if(String(captcha).trim().localeCompare(String(rcaptcha).trim())!=0){
		$('#rcapcthar').focus();
		return false;
	}
		
	else 
		
	return true;
       
		
}

