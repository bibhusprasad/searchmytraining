function require(script, path) {
	$.ajax({
		url : path + script,
		dataType : "script",
		async : false,
		success : function() {
			console.log(script + " is loaded successfully...");
		},
		error : function() {
			throw new Error("could not load script " + script);
		}
	});
}

function loadEmploymentData(jsonindustrycategories,jsonindustries,jsonindsubcat,industry_value,industry_cat_value,industry_subcat_value,employmenttype)
{
	console.log(industry_value+" "+industry_cat_value+" "+industry_subcat_value+" "+employmenttype);
	if(industry_value!= 0)
	{
		console.log("Registered user...");
		jQuery.each(jsonindustries, function(index, item) {
			if(this.trnIndstrId == industry_value)
			{
				$('#tindustry').append(
					$("<option selected></option>").text(this.indstrName).val(
							this.trnIndstrId));
			}
			else
			{
				$('#tindustry').append(
						$("<option></option>").text(this.indstrName).val(
								this.trnIndstrId));	
			}
		});
		jQuery.each(jsonindustrycategories, function(index, item) {
			if(this.trnIndstrCatId == industry_cat_value)
			{
				$('#industrycatid').append(
					$("<option selected></option>").text(this.indstrCatName).val(
							this.trnIndstrCatId));
			}
			else
			{
				$('#industrycatid').append(
						$("<option></option>").text(this.indstrCatName).val(
								this.trnIndstrCatId));	
			}
		});
		jQuery.each(jsonindsubcat, function(index, item) {
			if(this.trnIndstrSubCatId == industry_subcat_value)
			{
				$('#industrysubcatid').append(
					$("<option selected></option>").text(this.indstrSubCatName).val(
							this.trnIndstrSubCatId));
			}
			else
			{
				$('#industrysubcatid').append(
						$("<option></option>").text(this.indstrSubCatName).val(
								this.trnIndstrSubCatId));	
			}
		});
		if(employmenttype)
		{
			console.log(employmenttype);
			var isFullTime = "";
			var isPartTime = "";
			$('#employmenttype').find('option').remove().end();
			$('#employmenttype').append(
					$("<option value='0'></option>").text("--Select--"));
			if(employmenttype == "Full Time")
			{
				$('#employmenttype').append(
						$("<option selected></option>").text("Full Time").val(
								"Full Time"));
				$('#employmenttype').append(
						$("<option></option>").text("Part Time").val(
								"Part Time"));
			}
			else
			{
				$('#employmenttype').append(
						$("<option></option>").text("Full Time").val(
								"Full Time"));
				$('#employmenttype').append(
						$("<option selected></option>").text("Part Time").val(
								"Part Time"));
			}
		}
	}
	else
	{
		console.log("New user...");
		jQuery.each(jsonindustries, function(index, item) {
			$('#tindustry').append(
					$("<option></option>").text(this.indstrName).val(
							this.trnIndstrId));
		});
	}
}

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
