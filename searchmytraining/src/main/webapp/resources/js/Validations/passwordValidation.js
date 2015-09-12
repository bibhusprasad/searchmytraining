
function passChk(){
	var pass=document.registerFrm.pass1.value;
	var spass=document.getElementById("iconpass");
	if(pass.length<6){
		  spass.style.background="url('resources/images/notok.png')";  
			 return false;
	}
	
	else{
		 spass.style.background="url('resources/images/ok.png')";
		 return true;
	}
	
	return false;
	
}

function rpassChk(){
	var pass=document.registerFrm.pass1.value;
	var rpass=document.registerFrm.cpass.value;
	var spass=document.getElementById("iconcpass");
	if(pass==rpass){
		 spass.style.background="url('resources/images/ok.png')";
		 return true;
	}
	else{
		spass.style.background="url('resources/images/notok.png')"; 
		return false;
	}
	
	return false;
}
