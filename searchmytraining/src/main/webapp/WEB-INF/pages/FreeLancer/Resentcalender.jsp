<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function recenAddedCalender() {

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
					if(found == true)$(row).slice(0,5).show();else $(row).hide();
				}
			});
		}
	



		$('table.viewcalender').each(function() {
		    var currentPage = 0;
		    var numPerPage = 5;
		    var $table = $(this);
		    $table.bind('repaginate', function() {
		        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
		    });
		    $table.trigger('repaginate');
		    var numRows = $table.find('tbody tr').length;
		    var numPages = Math.ceil(numRows / numPerPage);
		    var $pager = $('<div class="pager"></div>');
		    for (var page = 0; page < numPages; page++) {
		        $('<span class="page-number"></span>').text(page + 1).bind('click', {
		            newPage: page
		        }, function(event) {
		            currentPage = event.data['newPage'];
		            $table.trigger('repaginate');
		            $(this).addClass('active').siblings().removeClass('active');
		        }).appendTo($pager).addClass('clickable');
		    }
		    $pager.insertAfter($table).find('span.page-number:first').addClass('active');
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
		 <thead>
				<tr>
					<th>Title</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Price</th>
					<th>Brochure</th>
					<th>Description</th>
				</tr>
				</thead>
				<tbody>
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
</tbody>

			</table> 

		</div>
		
	
</body>
</html>