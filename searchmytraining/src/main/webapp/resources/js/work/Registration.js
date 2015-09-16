function traineeRegistration(path) {
	alert("hi chetan...")
	var flag = validation01();
	alert(flag);
	if (flag) {
		try {
			$
					.ajax({
						url : path + '/trainee_reg',
						type : 'post',
						dataType : 'json',
						data : JSON.stringify({
							"traineetype" : $('#selType').val(),
							"corporatename" : $('#name2').val(),
							"name" : $('#fname').val(),
							"contact" : $('#mob').val(),
							"email" : $('#email').val(),
							"password" : $('#pass1').val(),
							"cnfpassword" : $('#cpass').val()
						}),
						contentType : "application/json",
						success : function(response) {
							if (response.errorMsg) {
								$.map(response.errorMsg, function(val, key) {
									/* if (key == "traineetype")
										$('#error1').text(val);
									else if (key == "corporatename")
										$('#error2').text(val);
									else if (key == "name")
										$('#error3').text(val);
									else if (key == "contact")
										$('#error4').text(val);
									else if (key == "email")
										$('#error5').text(val);
									else if (key == "password")
										$('#error6').text(val); */
								});
							} else {
								alert("Thank you for Your Registration, Please Update Your Profile:");
								window.location.href = path
										+ "/registration/trainee/fetchUserDetails";
							}

						}
					});
		} catch (ex) {
			alert("Exception: " + ex);
		}
	}
}