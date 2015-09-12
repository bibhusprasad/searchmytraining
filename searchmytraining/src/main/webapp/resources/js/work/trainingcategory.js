function addTrainingCategory(path)
{
	var exp = $('#exp').val();
	var trainingcategory = $('#combobox').val();
	var flag = true;
	if (flag) {
		try {
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				contentType : "application/json",
				data : JSON.stringify({
					"trainingcategory" : trainingcategory,
					"exp" : exp
					}),
				success : function(response) {
					console.log("in success: "+response.subcatentity.indstrSubCatName);
					console.log("in success: "+response.exp);
					var table = document.getElementById("myTable");
					var row = table.insertRow(-1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					cell1.innerHTML = response.subcatentity.indstrSubCatName;
					cell2.innerHTML = response.exp;
					cell3.innerHTML = "<a href='#'>edit</a>|<a href='#'>delete</a>";
					/*window.location.reload();*/
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