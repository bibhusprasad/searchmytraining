$(document).ready(
		function() {

			$("#fname61").on(
					'keyup',
					function(e) {
						var no = /([0-9])/;
						if ($("#fname61").val() == " ") {
							$("#fname61").focus();

							$("#error61").html("Please Enter First Name")

						} else if ($("#fname61").val().match(no)
								|| $("#fname61").val().length < 3) {
							$("#fname61").focus();
							$("#error61").html("Please Enter Valid Name")

						} else {
							$("#error61").html(" ")
						}
					});

			$("#mname62").on('keyup', function(e) {
				var no = /([0-9])/;
				if ($("#mname62").val() == " ") {
					$("#mname62").focus();

					$("#error62").html("Please Enter Middle Name")

				} else if ($("#mname62").val().match(no)) {
					$("#mname62").focus();
					$("#error62").html("Please Enter Valid Name")

				} else {
					$("#error62").html("")
				}
			});

			$("#lname63").on(
					'keyup',
					function(e) {
						var no = /([0-9])/;
						if ($("#lname63").val() == " ") {
							$("#lname63").focus();

							$("#error63").html("Please Enter Last Name")

						} else if ($("#lname63").val().match(no)
								|| $("#lname63").val().length < 3) {
							$("#lname63").focus();
							$("#error63").html("Please Enter Valid Name")

						} else {
							$("#error63").html(" ")
						}
					});

			$("#email64").on('keyup', function(e) {

				var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				var mail = $("#email64").val();

				if (!Cmail.test(mail)) {
					$("#email64").focus();
					$("#error64").html("Please Enter valid mail.")
				} else {
					$("#error64").html(" ")
				}
			});

			$("#builNo65").on('keyup', function(e) {

				if ($("#builNo65").val() == "") {
					$("#builNo65").focus();

					$("#error65").html(" ")

				} else {
					$("#error65").html(" ")
				}
			});

			$("#streetName66").on('keyup', function(e) {
				if ($("#streetName66").val() == " ") {
					$("#streetName66").focus();
					$("#error66").html(" ")
				} else {
					$("#error66").html(" ")
				}
			});

			$("#landmark67").on('keyup', function(e) {

				if ($("#landmark67").val() == " ") {
					$("#landmark67").focus();

					$("#error67").html(" ")

				} else {
					$("#error67").html(" ")
				}
			});

			$("#pin68").on('keyup', function(e) {

				if ($("#pin68").val().match(/([0-9]){6}/)) {
					$("#error68").html(" ")
					return true
				} else {
					$("#pin68").focus()
					$("#error68").html("Please Enter valid Pincode")
					return false
				}
			})

			$("#flcountry").on('change', function(e) {
				if ($("#flcountry").val() != '0') {
					$("#errorflcountry").html('');
					return true;
				}
			});

			$("#flstate").on('change', function(e) {
				if ($("#flstate").val() != '0') {
					$("#errorflstate").html('');
					return true;
				}
			});

			$("#cityid").on('change', function(e) {
				if ($("#cityid").val() != '0') {
					$("#errorflcity").html('');
					return true;
				}
			});

			$("#phonetypeid1").on('change', function(e) {
				if ($("#phonetypeid1").val() != '0') {
					$("#errorflcontact").html('');
					return true;
				}
			});

			var number = /([0-9])/;
			$("#contactNo69").on(
					'keyup',
					function(e) {

						if ($("#contactNo69").val() == ""
								|| $("#contactNo69").val().match(number)) {
							$("#error69").html(" ")
							return true
						} else {
							$("contactNo69").focus()
							$("#error69").html("Please Enter Valid Number")
						}
					});

			$("#web70").on('keyup', function(e) {

				if ($("#web70").val() == " ") {
					$("#web70").focus();
					$("#error70").html(" ")
				} else {
					$("#error70").html(" ")
				}
			});

			$("#fldegreetype").on('change', function(e) {
				if ($("#fldegreetype").val() != '0') {
					$("#errorfldegreetype").html('');
					return true;
				}
			});

			$("#flspec").on('change', function(e) {
				if ($("#flspec").val() != '0') {
					$("#errorflspec").html('');
					return true;
				}
			});

			$("#flyearofpassing").on('change', function(e) {
				if ($("#flyearofpassing").val() != '0') {
					$("#errorflyearofpassing").html('');
					return true;
				}
			});

			$("#qualification71").on('keyup', function(e) {

				if ($("#qualification71").val() == "") {
					$("#qualification71").focus();
					$("#error71").html(" ")
				} else {
					$("#error71").html(" ")
				}
			});

			$("#university72").on('keyup', function(e) {

				if ($("#university72").val() == " ") {
					$("#university72").focus();
					$("#error72").html("")
				} else {
					$("#error72").html("")
				}
			});
		});

function validate14(key) {
	// getting key code of pressed key
	var keycode = (key.which) ? key.which : key.keyCode;

	// comparing pressed keycodes
	if (!(keycode == 8 || keycode == 16) && (keycode < 48 || keycode > 57)) {
		return false;
	}
}

function validateFLName(key) {
	var keycode = (key.which) ? key.which : key.keycode;
	if (!(keycode == 8 || keycode == 32) && (keycode < 65 || keycode > 90)
			&& (keycode < 61 || keycode > 122)) {
		return false;
	}
}
function freeLancerValidate() {

	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail = $("#email64").val();

	if ($("#fname61").val().match(/([0-9])/) || $("#fname61").val().length < 3) {
		$("#fname61").focus();
		$("#error61").html("Please Enter Valid FirstName.")

		return false;
	}  else if ($("#email64").val() == "" || !Cmail.test(mail)) {
		$("#email64").focus();
		$("#error64").html("Please Enter Email Id")
		return false;
	} else {

		var $nextContent = jQuery('.skipbtn9').parent().next().next();
		jQuery(".acord .acord_cont").slideUp("fast", function() {

			$nextContent.show()
		});
		return true;
		jQuery(".acord ").next().slideDown("fast", function() {

			$nextContent.show()
		});
	}
}

function freeLancerValidate2() {

	if ($("#builNo65").val() == "") {
		$("#builNo65").focus();
		$("#error65").html("Please Enter Valid Name.")
		return false;
	} else if ($("#streetName66").val() == "") {
		$("#streetName66").focus();
		$("#error66").html("Please Enter Valid Name.")
		return false;
	} else if ($("#landmark67").val() == "") {
		$("#landmark67").focus();
		$("#error67").html("Please Enter Valid Name.")
		return false;
	} else if ($("#pin68").val().length < 6 || $("#pin68").val().length > 6) {
		$("#error68").html("")
		$("#pin68").focus();
		$("#error68").html("Please Enter Valid Pincode.")

		return false;
	} else if ($("#countryid").val() == "" || $("#countryid").val() == '0') {
		$("#countryid").focus();
		$("#errorflcountry").html("Please Select Your Country")
		return false;
	} else if ($("#stateid").val() == "" || $("#stateid").val() == '0') {
		$("#errorflcountry").html("");
		$("#stateid").focus();
		$("#errorflstate").html("Please Select Your State")
		return false;
	} else if ($("#cityid").val() == "" || $("#cityid").val() == '0') {
		$("#errorflstate").html("");
		$("#cityid").focus();
		$("#errorflcity").html("Please Select Your City")
		return false;
	} else {
		var $nextContent = jQuery('.skipbtn10').parent().next().next();
		jQuery(".acord .acord_cont").slideUp("fast", function() {

			$nextContent.show()
		});
		return true;
		jQuery(".acord ").next().slideDown("fast", function() {

			$nextContent.show()
		});
	}
}

function freeLancerValidate3() {

	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail = $("#smail60").val();

	if ($("#phonetypeid1").val() == "" || $("#phonetypeid1").val() == '0') {
		$("#phonetypeid1").focus();
		$("#errorflcontact").html("Please Select Type of Contact Number.")
		return false;
	} else if ($("#phonevalue1").val() == ""
			|| $("#phonevalue1").val().length < 10) {
		$("#error69").html("")
		$("#phonevalue1").focus();
		$("#error69").html("Please Enter Contact Number")

		return false;
	} else if ($("#web70").val() == "") {
		$("#web70").focus();
		$("#error70").html("Please Enter Website")
		return false;
	} else {

		var $nextContent = jQuery('.skipbtn11').parent().next().next();
		jQuery(".acord .acord_cont").slideUp("fast", function() {

			$nextContent.show()
		});
		return true;
		jQuery(".acord ").next().slideDown("fast", function() {

			$nextContent.show()
		});
	}
}
function freeLancerValidate4() {

	var Cmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mail = $("#smail60").val();

	if ($("#fldegreetype").val() == "" || $("#fldegreetype").val() == '0') {

		$("#fldegreetype").focus();

		$("#errorfldegreetype").html("Please Select Your Degree Type.")
		return false;
	} else if ($("#qualification71").val() == "") {
		$("#error71").html("")
		$("#qualification71").focus();
		$("#error71").html("Please Enter your qualification")

		return false;
	} else if ($("#flspec").val() == "" || $("#flspec").val() == '0') {

		$("#flspec").focus();

		$("#errorflspec").html("Please Select Your Specification.")
		return false;
	} else if ($("#flyearofpassing").val() == ""
			|| $("#flyearofpassing").val() == '0') {

		$("#flyearofpassing").focus();

		$("#errorflyearofpassing")
				.html("Please Select Year Of Passing.")
		return false;
	} else if ($("#university72").val() == "") {
		$("#university72").focus();
		$("#error72").html("Please Enter University Name")
		return false;
	} else {

		var $nextContent = jQuery('.skipbtn12').parent().next().next();
		jQuery(".acord .acord_cont").slideUp("fast", function() {

			$nextContent.show()
		});
		return true;
		jQuery(".acord ").next().slideDown("fast", function() {
			$nextContent.show()
		});
	}
}

function freelProfDet(path)
{
	console.log("in freelProfDet...");
	var flag=freeLancerValidate();
	console.log(flag);
	if(flag)
		$('#flForm').submit();
}
function freelLocDetails(path) {

	console.log("in freelcontactdetails...");
	var flag = freeLancerValidate2();
	console.log("flag: " + flag);
	if (flag) {
		try {
			$.ajax({
				url : path+'/updatelocinfo',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"bldng_flatno" : $('#builNo65').val(),
					"street" : $('#streetName66').val(),
					"landmark" : $('#landmark67').val(),
					"pincode" : $('#pin68').val(),
					"country" : $('#countryid').val(),
					"state" : $('#stateid').val(),
					"city" : $('#cityid').val(),
					"userid" : $('#userid').val()
				}),
				contentType : "application/json",
				success : function(response) {

				},
				error : function() {
					console.log("in error msg...");
				}
			});
		} catch (ex) {
			alert(ex);
		}
	} else
		console.log("in else...");
}

function flContactDet(path)
{
	var flag = freeLancerValidate3();
	if (flag) {
		var phones = [];
		var phonetypeids = [];
		for (i = 1; i <= 5; i++) {
			if ($('#phonetypeid' + i).val())
				phonetypeids.push($('#phonetypeid' + i).val());
			if ($('#phonevalue' + i).val())
				phones.push($('#phonevalue' + i).val());
		}
		try {
			$.ajax({
				url : path + '/updatecontactinfo',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"userid" : $('#userid').val(),
					"email" : $('#email64').val(),
					"website" : $('#web70').val(),
					"contactpersonname" : $('#fname61').val(),
					"phonetypeid" : phonetypeids,
					"phone" : phones
				}),
				contentType : "application/json",
				success : function(response) {
				},
				error : function() {
					console.log("in error msg...");
				}
			});
		} catch (ex) {
			alert(ex);
		}
	}
	else
		console.log("in else...");
}

function freelCertificationAwardDet(path) {
	console.log("in freelCertificationAwardDet...");
	var flag = true; 	//freeCrtfctDetails();
	console.log("flag: " + flag);
	if (flag) {
		try {
			$.ajax({
				url : path + '/freelancer/freelcertiawardDet',
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"awrdDetails" : $('#awrdDetails').val(),
					"userid" : $('#userid').val()
				}),
				contentType : "application/json",
				success : function(response) {
					console.log("in success msg...");
				},
				error : function() {
					console.log("in error msg...");
				}
			});
		} catch (ex) {
			alert(ex);
		}
	} else
		console.log("in else...");
}