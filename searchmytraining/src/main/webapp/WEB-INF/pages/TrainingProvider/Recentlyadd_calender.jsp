<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">

function recenAddedCalendert() {

	$("#recentadd_Calender").load("<%=request.getContextPath()%>/getRecentelyAdded",function(responseText, statusText, xhr) {
					if (statusText == "success")
					/*  alert("Successfully loaded the content!"); */
						if (statusText == "error")
							alert("An error occurred: " + xhr.status + " - "
									+ xhr.statusText);
				});
	
	}

</script>
<script type="text/javascript">
$(document).ready(function()
		{
			$('#search').keyup(function()
			{
				searchTable($(this).val());
			});
		});

		function searchTable(inputVal)
		{
			var table = $('#tblData');
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

		 $(document).ready(function() {
             $('#tableData').paging({limit:5});
         });


</script>
</head>
<body>

<div id=recentadd_Calender>
<div class="table_search">
<label for="search">
<strong>Search For Result:</strong>

</label>
<input type="text"  id="search"/>

</div>
		
		 <table class="viewcalender" id="tblData">
				<tr>
					<th>Title</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Price</th>
					<th>Brochure</th>
					<th>Description</th>
				</tr>
				<c:forEach var="calender" items="${recentelyAdded}">
					<tr>
						<td>${calender.title}</td>
						<td>${calender.start_date}</td>
						<td>${calender.end_date}</td>
						<td>${calender.price}</td>
						<td><a href="<%=request.getContextPath()%>/downloadFile?path=${calender.brochure}">Brouchure</a></td>
						<td>${calender.description}</td>
					</tr>
				</c:forEach>


			</table> 

		</div>
		
	
</body>
</html>