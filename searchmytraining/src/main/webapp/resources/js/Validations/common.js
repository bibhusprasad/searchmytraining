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
	/*var title = document.forms["Add_calender"]["ctitle"].value;
    if (title == null || title == "") {
        alert("Name must be filled out");
        return false;
    }*/
}


/*function validatePostCalenderOnSubmit(){
	
	if(document.getElementById('ctitle').value ==''){
		alert("please enter Course Title");
		document.getElementById('ctitle').focus(); 
		return false;
	}
	if(document.getElementById('Ctype').value  =='' || document.getElementById('Ctype').value == 0){
		alert("please enter type Of Calendar");
		document.getElementByName('Ctype')[0].focus(); 
		return false;
	}
	if(document.getElementById('Itype').value  =='' || document.getElementById('Itype').value == 0){
		alert("please enter Industry Type");
		document.getElementByName('Itype')[0].focus(); 
		return false;
	}
	if(document.getElementById('Fdate').value ==''){
		alert("please enter From Date");
		document.getElementById('Fdate').focus(); 
		return false;
	}
	if(document.getElementById('Tdate').value ==''){
		alert("please enter to Date");
		document.getElementById('Tdate').focus(); 
		return false;
	}
	if(document.getElementById('Chour').value =='' || document.getElementById('Chour').value == 'HH'){
		alert("please enter time");
		alert(document.getElementById('state').value);
		alert(document.getElementById('place').value);
		document.getElementById('Chour').focus(); 
		return false;
	}
	if(document.getElementById('place').value =='' || document.getElementById('place').value == 0){
		alert("please enter City");
		document.getElementById('place').focus(); 
		return false;
	}
	if(document.getElementById('state').value =='' || document.getElementById('state').value == 0){
		alert("please enter state");
		alert(document.getElementById('Qview').value);
		document.getElementById('state').focus(); 
		return false;
	}
	if(document.getElementById('Qview').value == ''){
		alert("please enter Programme brief for Quick View Section");
		document.getElementById('Qview').focus(); 
		return false;
	}
	if(document.getElementById('Pview').value ==''){
		alert("please enter Programme Overview");
		document.getElementById('Pview').focus(); 
		return false;
	}
	if(document.getElementById('kword').value ==''){
		alert("please enter Keyword");
		document.getElementById('kword').focus(); 
		return false;
	}

	return true;
}*/
$("#ctitle").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#ctitle").val() == "" )
		{
		   $('#ctitle').focus()
		   $('#errorctitle').html(img).append(" please enter Course Title")
    
		    return false;
		}
	else{
		$("#errorctitle").html("")
		 return true;}
	
})

$('#Ctype').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Ctype').val()=='' || $('#Ctype').val() == '0'){
		
		$('#Ctype').focus();
		  $('#errorCtype').html(img).append("   please enter type Of Calendar");
                      return false;
	}
	else{
		$('#errorCtype').html("")
	}
	
})


$('#Itype').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Itype').val()=='' || $('#Itype').val() == '0'){
		
		$('#Itype').focus();
		  $('#errorItype').html(img).append("   please enter Industry Type");
                      return false;
	}
	else{
		$('#errorItype').html("")
	}
	
})

$("#Fdate").on ('change keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#Fdate").val() == "" )
		{
		   $('#Fdate').focus()
		   $('#errorFdate').html(img).append(" please enter From Date")
    
		    return false;
		}
	else{
		$("#errorFdate").html("")
		 return true;}
	
})


$("#Tdate").on ('change keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#Tdate").val() == "" )
		{
		   $('#Tdate').focus()
		   $('#errorTdate').html(img).append(" please enter to Date")
    
		    return false;
		}
	else{
		$("#errorTdate").html("")
		 return true;}
	
})

$('#Chour').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#Chour').val()=='' || $('#Chour').val() == HH ){
		
		$('#Chour').focus();
		  $('#errorChour').html(img).append("   please enter Time");
                      return false;
	}
	else{
		$('#errorChour').html("")
	}
	
})

$('#place').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#place').val()=='' || $('#place').val() == '0' ){
		
		$('#place').focus();
		  $('#errorplace').html(img).append("   please enter City");
                      return false;
	}
	else{
		$('#errorplace').html("")
	}
	
})


$('#state').on('change keyup',function(e){
	var img = '<img src ="resources/images/error.png">';
	if($('#state').val()=='' || $('#state').val() == '0' ){
		
		$('#state').focus();
		  $('#errorstate').html(img).append("   please enter State");
                      return false;
	}
	else{
		$('#errorstate').html("")
	}
	
})

$("#Qview").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#Qview").val() == "" )
		{
		   $('#Qview').focus()
		   $('#errorQview').html(img).append(" please enter Programme brief for Quick View Section")
    
		    return false;
		}
	else{
		$("#errorQview").html("")
		 return true;}
	
})

$("#Pview").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#Pview").val() == "" )
		{
		   $('#Pview').focus()
		   $('#errorPview').html(img).append(" please enter Programme Overview")
    
		    return false;
		}
	else{
		$("#errorPview").html("")
		 return true;}
	
})


$("#kword").on ('keyup', function(e) {
	var img = '<img src ="resources/images/error.png">'
	
	if($("#kword").val() == "" )
		{
		   $('#kword').focus()
		   $('#errorkword').html(img).append(" please enter Keyword")
    
		    return false;
		}
	else{
		$("#errorkword").html("")
		 return true;}
	
})






















function validatePostCalenderOnSubmit(){
	
	var img = '<img src ="resources/images/error.png">'
		
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
	else if ($('#Chour').val() == "" || $('#Chour').val() == HH ) {
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

function isAlphaNumeric(str) {
	  var code, i, len;
	  for (i = 0, len = str.length; i < len; i++) {
	    code = str.charCodeAt(i);
	    if (!(code > 47 && code < 58) && // numeric (0-9)
	        !(code > 64 && code < 91) && // upper alpha (A-Z)
	        !(code > 96 && code < 123)) { // lower alpha (a-z)
	      return false;
	    }
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

