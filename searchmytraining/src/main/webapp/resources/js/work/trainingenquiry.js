function enquiry(path) {
	var flag = TEvalidate();
	console.log("from enquiry: " + flag);
	if (flag) {
		try {
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				contentType : "application/json",
				data : JSON.stringify({
					"name" : $('#firstname22').val(),
					"companyName" : "Individual",
					"coursetitle" : $('#title22').val(),
					"cityid" : $('#city22').val(),
					"phone" : $('#mob22').val(),
					"email" : $('#email22').val(),
					"trngneeds" : $('#requirements22').val(),
					"noOfParticipents" : "1"
					}),
				success : function(response) {
					console.log(":"+response.success);
					alert("Thank you for Your Enquiry\nWe will get back to you soon:");
					window.location.reload();
					},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
			} 
		catch (ex) {
			alert(ex);
		}
	}
}

function groupEnquiry(path) {
	alert("inside"+path);
	var flag = validation21();
	console.log("from groupEnquiry: " + flag);
	alert("flag1"+flag);
	if (flag) {
		alert("flag2"+flag);
		try {
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				contentType : "application/json",
				data : JSON.stringify({
					"name" : $('#name21').val(),
					"companyName" : $('#companyName21').val(),
					"coursetitle" : $('#title21').val(),
					"cityid" : $('#city21').val(),
					"phone" : $('#contact21').val(),
					"email" : $('#Email21').val(),
					"trngneeds" : $('#requirements21').val(),
					"noOfParticipents" : $('#participents21').val()
					}),
				success : function(response) {
					console.log(":"+response.success);
					alert("Thank you for Your Enquiry\nWe will get back to you soon:");
					window.location.reload();
					},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
			} 
		catch (ex) {
			alert(ex);
		}
	}
}