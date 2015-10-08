$(document).ready(function() {
	
	$("#ctitle").on("keyup",function(e){
	
		if($("#ctitle").val()==""){
			
			$("#ctitle").focus();
			
			$("#c1").html("Please Enter Title");
			
		}
		
	})
	
	$("#Fdate,#Tdate").on("keyup",function(key) {
	// getting key code of pressed key
	var keycode = (key.which) ? key.which : key.keyCode;

	// comparing pressed keycodes
	if (!(keycode == 8 || keycode == 16) && (keycode < 48 || keycode > 57)) {
		return false;
	}
})

$("#cPrice").on("keyup",function(e){
	
	if($("#cPrice").val()==""){
	
		$("#cPrice").focus();
		
		$("#c6").html("Please Enter Price");
		
	}
	else{
		$("#c6").html(" ");
	}
	
})

$("#place").on("keyup",function(e){
	
	if($("#place").val()==""){
	
		$("#place").focus();
		
		$("#c7").html("Please Enter Place");
		
	}
	else{
		$("#c7").html(" ");
	}
	
})

$("#CDesc").on("keyup",function(e){
	
	if($("#CDesc").val()==""){

		$("#CDesc").focus();
		
		$("#c8").html("Please Enter Description");
		
	}
	else{
		$("#c8").html(" ");
	}
	
	
})

$("#fileupload").on("change",function(e){
	if($("#fileupload").val()==""){

		$("#fileupload").focus();
		
		$("#c1").html("Please Enter Title");
		
	}
	
	
})
	
});



