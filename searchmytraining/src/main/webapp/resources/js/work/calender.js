
function loadcalender(path){
	
	 $.ajax({
	        url: path+"/calenderdiv",  
	        type: "GET",            
	        cache: false,
	        success: function (html) {  
	            //place servicecall.php's content to the content div
	            $('#mid').html(html);   
	         //   alert("loaded sussesfull");
	        }       
	    });
	    }


/*function loadinstitute(path){
	
		document.getElementById("mid").style.display='none';
		var search_name=document.getElementById("search_name").value;
		$('#t').load("../pages/CodePages/institutediv.jsp?value="+ search_name + "#t");
		$.ajax({
	        url: path+"/institutediv", 
	        type: "GET",            
	        cache: false,
	        success: function (html) {  
	            //place servicecall.php's content to the content div
	            $('#mid').html(html); 
	          //  alert("loaded sussesfull");      
	        }       
	    });
		
	}*/

function loadinstitute(path) {
    
	var keyword=$('#w-input-search').val();
	var city = $('#loc').val();
   	
  	console.log("from loadinstitute keyword :"+keyword);
  	 
	console.log("from loadinstitute: "+path);

   	$("#mid").load("./institutediv",{inputkeyword:keyword,city:city},function(responseText, statusText, xhr) {
   					if (statusText == "success")
   						console.log("Successfully loaded the content!"); 
   						if (statusText == "error")
   							alert("An error occurred: " + xhr.status + " - "
   									+ xhr.statusText);
   				});

}

function loadfreelancer(path){
	
	/*	document.getElementById("mid").style.display='none';*/
	/*	var search_name=document.getElementById("search_name").value;
		$('#mid').load("../pages/CodePages/freelancerdiv.jsp?value="+ search_name + "#t");*/
	$.ajax({
        url: path+"/freelancerdiv",  
        type: "GET",            
        cache: false,
        success: function (html) {  
            //place page's.html content to the content div
            $('#mid').html(html); 
          //  alert("loaded sussesfull");
        }       
    });
		
	}

function loadseminar(path){
	
	/*	document.getElementById("mid").style.display='none';*/
	/*	var search_name=document.getElementById("search_name").value;
		$('#t').load("../pages/CodePages/seminardiv.jsp?value="+ search_name + "#t");*/
	$.ajax({
        url: path+"/seminardiv",  
        type: "GET",            
        cache: false,
        success: function (html) {  
            //place page's.html content to the content div
            $('#mid').html(html); 
            //alert("loaded sussesfull");
        }       
    });
		
	}




