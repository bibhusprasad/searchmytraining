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

function verifyEmail()
{
	var email = $('#instituteEmail').val();
	console.log(email);
	$.ajax({
		url : 'request/verify/sendemail',
		type : 'post',
		data : {data:email},
		success : function(response) {
			 alert(response); 
		}
	});
	
	
	
	
	
}