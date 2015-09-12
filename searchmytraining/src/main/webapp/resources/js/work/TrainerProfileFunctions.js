function trainerRegistration() {
		try {
			$.ajax({
				url : '<%=request.getContextPath()%>/trainingprovider_reg',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"org_name" : $('#org_name').val(),
					"city" : $('#city').val(),
					"contact" : $('#contact').val(),
					"email" : $('#email').val(),
					"password" : $('#password').val(),
					"cnfpassword" : $('#cnfpassword').val()
					
				}),
				contentType : "application/json",
				success : function(response) {
					alert("Thank you for Your Registration, Please Update Your Profile:");
					window.location.href="<%=request.getContextPath()%>/trainingprovider_updateprofile";
				}
			});
		} catch (ex) {
			alert(ex);
		}
	}