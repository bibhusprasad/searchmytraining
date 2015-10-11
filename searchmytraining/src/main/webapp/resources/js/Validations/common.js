/**
 * 
 */

function CalenderValidate() {
	var image = document.getElementById("fileupload").value;
	if (typeof image === 'undefined' && image == '' && image == null) {
		alert("Please enter Image Path");
		document.getElementById("image").focus();
		return false;
	}
}
$("#ctitle").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#ctitle").val() == "" )
		{
		   $('#ctitle').focus();
		   $('#errorctitle').html(img).append(" please enter Course Title");
    
		    return false;
		}
	else{
		$("#errorctitle").html("");
		 return true;}
	
});

$('#Ctype').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Ctype').val()=='' || $('#Ctype').val() == '0'){
		
		$('#Ctype').focus();
		  $('#errorCtype').html(img).append("   please enter type Of Calendar");
                      return false;
	}
	else{
		$('#errorCtype').html("");
	}
	
});


$('#Itype').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Itype').val()=='' || $('#Itype').val() == '0'){
		
		$('#Itype').focus();
		  $('#errorItype').html(img).append("   please enter Industry Type");
                      return false;
	}
	else{
		$('#errorItype').html("");
	}
	
});

$("#Fdate").on ('change keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#Fdate").val() == "" )
		{
		   $('#Fdate').focus();
		   $('#errorFdate').html(img).append(" please enter From Date");
    
		    return false;
		}
	else{
		$("#errorFdate").html("");
		 return true;}
	
});


$("#Tdate").on ('change keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#Tdate").val() == "" )
		{
		   $('#Tdate').focus();
		   $('#errorTdate').html(img).append(" please enter to Date");
    
		    return false;
		}
	else{
		$("#errorTdate").html("");
		 return true;}
	
});

$('#Chour').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Chour').val()=='' || $('#Chour').val() == "HH" ){
		
		$('#Chour').focus();
		  $('#errorChour').html(img).append("   please enter Time");
                      return false;
	}
	else{
		$('#errorChour').html("");
	}
	
});

$('#place').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#place').val()=='' || $('#place').val() == '0' ){
		
		$('#place').focus();
		  $('#errorplace').html(img).append("   please enter City");
                      return false;
	}
	else{
		$('#errorplace').html("");
	}
	
});


$('#state').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#state').val()=='' || $('#state').val() == '0' ){
		
		$('#state').focus();
		  $('#errorstate').html(img).append("   please enter State");
                      return false;
	}
	else{
		$('#errorstate').html("");
	}
	
});

$("#Qview").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#Qview").val() == "" )
		{
		   $('#Qview').focus();
		   $('#errorQview').html(img).append(" please enter Programme brief for Quick View Section");
    
		    return false;
		}
	else{
		$("#errorQview").html("");
		 return true;}
	
});

$("#Pview").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#Pview").val() == "" )
		{
		   $('#Pview').focus();
		   $('#errorPview').html(img).append(" please enter Programme Overview");
    
		    return false;
		}
	else{
		$("#errorPview").html("");
		 return true;}
	
});


$("#kword").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">';
	
	if($("#kword").val() == "" )
		{
		   $('#kword').focus();
		   $('#errorkword').html(img).append(" please enter Keyword");
    
		    return false;
		}
	else{
		$("#errorkword").html("");
		 return true;}
	
});
function validatePostCalenderOnSubmit(){
	
	var img = '<img src ="resources/images/error.png">';
		
		if ($('#ctitle').val() == "" ) {
			$('#ctitle').focus();
			   $('#errorctitle').html(img).append(" please enter Course Title");
	              return false;
			  
		}
	else if ($('#Ctype').val() == ""  || $('#Ctype').val() == 0) {
		$('#Ctype').focus();
		
		   $('#errorCtype').html(img).append(" please enter type Of Calendar");
                   return false;
		  
	}
	else if ($('#Itype').val() == ""  || $('#Itype').val() == 0) {
		$('#Itype').focus();
		
		   $('#errorItype').html(img).append(" please enter Industry Type");
                   return false;
		  
	}
	else if ($('#Fdate').val() == "" ) {
		$('#Fdate').focus();
		
		   $('#errorFdate').html(img).append(" please enter From Date");
                   return false;
		  
	}
	else if ($('#Tdate').val() == "" ) {
		$('#Tdate').focus();
		
		   $('#errorTdate').html(img).append(" please enter to Date");
                   return false;
		  
	}
	else if ($('#Chour').val() == "" || $('#Chour').val() == "HH" ) {
		$('#Chour').focus();
		
		   $('#errorChour').html(img).append(" please enter time");
                   return false;
		  
	}
	else if ($('#place').val() == "" || $('#place').val() == 0 ) {
		$('#place').focus();
		
		   $('#errorplace').html(img).append(" please enter City");
                   return false;
		  
	}
	else if ($('#state').val() == "" || $('#state').val() == 0 ) {
		$('#state').focus();
		
		   $('#errorstate').html(img).append("please enter state");
                   return false;
		  
	}
	else if ($('#Qview').val() == "" ) {
		$('#Qview').focus();
		
		   $('#errorQview').html(img).append("please enter Programme brief for Quick View Section");
                   return false;
		  
	}
	else if ($('#Pview').val() == "" ) {
		$('#Pview').focus();
		
		   $('#errorPview').html(img).append("please enter Programme Overview");
                   return false;
		  
	}
	else if ($('#kword').val() == "" ) {
		$('#kword').focus();
		
		   $('#errorkword').html(img).append("please enter Keyword");
                   return false;
		  
	}
	else
	
	return true;
}


function checkEmail() {

    var email = document.getElementById('txtEmail');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 }
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

(function() {
    var elm = document.getElementById('Chour'),
        df = document.createDocumentFragment();
    for (var i = 1; i <= 12; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.appendChild(document.createTextNode(i));
        df.appendChild(option);
    }
    elm.appendChild(df);
}());
(function() {
    var elm = document.getElementById('Cmin'),
        df = document.createDocumentFragment();
    for (var i = 01; i <60; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.appendChild(document.createTextNode(i));
        df.appendChild(option);
    }
    elm.appendChild(df);
}());

