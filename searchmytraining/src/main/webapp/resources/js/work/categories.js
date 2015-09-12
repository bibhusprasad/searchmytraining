function industryCategory() {
	var id = $("#tindustry").val();
	$.ajax({
		type : "POST",
		url : "/searchmytraining/common/getIndustryCategory",
		dataType : 'json',
		data : "id=" + id,
		/* data: JSON.stringify({"tid" : id,"fname":"Softinfology"}), */
		success : function(response) {
			/* alert(response); */
			$('#industrycatid').find('option').remove().end();
			$('#industrysubcatid').find('option').remove().end();
			$('#industrycatid').attr('enabled', 'true');
			$('#industrycatid').append(
					$("<option value='0'></option>").text("--Select--"));
			$('#industrysubcatid').append(
					$("<option value='0'></option>").text("--Select--"));
			jQuery.each(response, function(index, item) {
				$('#industrycatid').append(
						$("<option></option>").text(this.indstrCatName).val(
								this.trnIndstrCatId));
			});
		},
	});
}

function industrySubCategory() {
	var subid = $('#industrycatid').val();
	$.ajax({
		type : "POST",
		url : "/searchmytraining/common/getIndustrySubCategory",
		dataType : 'json',
		data : "subid=" + subid,
		success : function(response) {
			$('#industrysubcatid').find('option').remove().end();
			$('#industrysubcatid').attr('enabled', 'true');
			$('#industrysubcatid').append(
					$("<option value='0'></option>").text("--Select--"));
			jQuery.each(response, function(index, item) {
				$('#industrysubcatid').append(
						$("<option></option>").text(this.indstrSubCatName).val(
								this.trnIndstrSubCatId));
			});
		},
	});
}

function getStates() {
	var countryid = $("#countryid").val();
	console.log("in getstates method...cntid: " + countryid);
	$.ajax({
		type : "POST",
		url : "/searchmytraining/common/getstates",
		dataType : 'json',
		data : "countryid=" + countryid,
		success : function(response) {
			$('#stateid').find('option').remove().end();
			$('#cityid').find('option').remove().end();
			$('#stateid').attr('enabled', 'true');
			$('#stateid').append(
					$("<option value='0'></option>").text("--Select--"));
			$('#cityid').append(
					$("<option value='0'></option>").text("--Select--"));
			jQuery.each(response, function(index, item) {
				$('#stateid').append(
						$("<option></option>").text(this.stateName).val(
								this.stateId));
			});
		},
	});
}

function getCities() {
	var stateid = $('#stateid').val();
	$.ajax({
		type : "POST",
		url : "/searchmytraining/common/getCities",
		dataType : 'json',
		data : "stateid=" + stateid,
		success : function(response) {
			$('#cityid').find('option').remove().end();
			$('#cityid').attr('enabled', 'true');
			$('#cityid').append(
					$("<option value='0'></option>").text("--Select--"));
			jQuery.each(response, function(index, item) {
				$('#cityid').append(
						$("<option></option>").text(this.cityName).val(
								this.cityId));
			});
		},
	});
}

function getDegreeType(path) {

}