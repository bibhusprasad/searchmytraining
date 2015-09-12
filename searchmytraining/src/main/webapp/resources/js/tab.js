/**
  Author:Prashant Maskar
  Company Name:Softinfology Pvt Ltd.
 */
  
var containerId = '#tabcontent';
var tabId = '#tabmenu';
$(document).ready(function(){
	if($(tabId + 'li.current a').length>0){
		loadTab($(tabId + 'li.current a'));
	}
	
	
	$(tabId + 'a').click(function() {
		if($(this).parent().hasClass('current')){return false;}
		$(tabId +'li.current').removeClass('current');
		$(this).parent().addClass('current');
		loadTab($(this));
		return false;
		
	});
	
});


function loadCalenderTab() {
	alert("hello");
	var search_name="";
	$('tabcontent').load("../../pages/CodePages/calenderdiv.jsp?value="+ search_name + "#tabcontent");
	}

