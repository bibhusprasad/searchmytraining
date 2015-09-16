<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function recenAddedCalenderat() {

	$("#viewall_calender").load("<%=request.getContextPath()%>/getUserCalender",function(responseText, statusText, xhr) {
					if (statusText == "success")
					// alert("Successfully loaded the content!"); 
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});
	
	}

</script>
<script type="text/javascript">
$(document).ready(function()
		{
			$('#search2').keyup(function()
			{
				searchTable($(this).val());
			});
		});

		function searchTable(inputVal)
		{
			var table = $('#tblData2');
			table.find('tr').each(function(index, row)
			{
				var allCells = $(row).find('td');
				if(allCells.length > 0)
				{
					var found = false;
					allCells.each(function(index, td)
					{
						var regExp = new RegExp(inputVal, 'i');
						if(regExp.test($(td).text()))
						{
							found = true;
							return false;
						}
					});
					if(found == true)$(row).show();else $(row).hide();
				}
			});
		}









</script>
</head>
<body>

<div id=viewall_calender>
<div class="table_search2">
<label for="search">
<strong>Search For Result:</strong>

</label>
<input type="text"  id="search2"/>

</div>
		
		
		 <table class="viewcalender" id="tblData2">
				<tr>
					<th>Title</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Price</th>
					<th>Brochure</th>
					<th>Description</th>
				</tr>
				<c:forEach var="calender1" items="${userAllCalender}">
					<tr>
						<td>${calender1.title}</td>
						<td>${calender1.start_date}</td>
						<td>${calender1.end_date}</td>
						<td>${calender1.price}</td>
						<td><a href="<%=request.getContextPath()%>/downloadFile?path=${calender1.brochure}">Brouchure</a></td>
						<td>${calender1.description}</td>
					</tr>
				</c:forEach>


			</table> 

		</div>
</body>
</html>