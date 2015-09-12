function loadLocationInfo(states,cities,state_value,city_value)
{
	if(state_value!=0)
	{
		jQuery.each(states, function(index, item) {
			if(this.stateId == state_value)
			{
				$('#stateid').append(
					$("<option selected></option>").text(this.stateName).val(
							this.stateId));
			}
			else
			{
				$('#stateid').append(
						$("<option></option>").text(this.stateName).val(
								this.stateId));	
			}
		});
	}
	if(city_value!=0)
	{
		jQuery.each(cities, function(index, item) {
			if(this.cityId == city_value)
			{
				$('#cityid').append(
					$("<option selected></option>").text(this.cityName).val(
							this.cityId));
			}
			else
			{
				$('#cityid').append(
						$("<option></option>").text(this.cityName).val(
								this.cityId));	
			}
		});
	}
}

function updateFlProfDet()
{
	var form = $('#flForm');
	if(form.valid())
	{
		var fd = new FormData();
		var picture = $('input[type="file"]')[0].files;
		if(picture[0]!=null)
			fd.append("picture",picture[0]);
		var other_data = form.serializeArray();
		$.each(other_data, function(key, input) {
            fd.append(input.name, input.value);
        });
	}
	 $.ajax({
         type : "POST",
         url : '/searchmytraining/freelancer/updateflprofdet',
         cache : false,
         contentType : false,
         processData : false,
         data : fd,
         success : function(data) {
             alert("in updateFlUpdateProfsuccess");

         }
     });
}

function checkDegree(degree)
{
	degree = degree.toLocaleLowerCase().trim();
	$("#fldegreetype option[value='0']").remove();
	var degreeName = $('#fldegreetype option:selected').text();
	degreeName = degreeName.toLocaleLowerCase().trim();
	if(degreeName == 'other')
	{
		$('#otherDegreeDivid').show();
		$('#otherDegree').attr('required',true);
	}
	else
	{
		$('#otherDegreeDivid').hide();
		if(degree != 'other')
			$('#otherDegree').val(null);
	}
}

function updalFLEduDetails(path)
{
	var flag = freeLancerValidate4();
	console.log(flag);
	if (flag) {
		try {
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				data : JSON.stringify({
					"degreeid" : $('#fldegreetype').val(),
					"degreeOther" : $('#otherDegree').val(),
					"university" : $('#university72').val(),
					"yop" : $('#flyearofpassing').val()
				}),
				contentType : "application/json",
				success : function(response) {
					console.log("in updalFLEduDetails ajax success: "+response);
					/*if (response.errorMsg) {
						$.map(response.errorMsg, function(val, key) {
						 if (key == "traineetype")
							$('#error1').text(val);
						 
						});
					} else {
						alert("Thank you for Your Registration, Please Update Your Profile:");
					}*/
				}
			});
		} catch (ex) {
			alert("Exception: " + ex);
		}
	}
	
	
}

