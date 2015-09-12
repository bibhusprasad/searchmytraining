
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title></title>
<script src="<%=request.getContextPath()%>/resources/js/pagination/jquery.tabpager.min.js"></script>

<script>
$(document).ready(function() {
$("#tab").tabpager({

//  maximum visible items
items: 5,

// CSS class for tabbed content
contents: 'contents',

// transition speed
time: 300,

// text for previous button
previous: '&laquo;Prev',

// text for next button
next: 'Next&raquo;',

// initial tab
start: 1,

// top or bottom
position: 'bottom',

// scrollable
scroll: true
});
});
</script>

</head>
<body>
	<div id="tab-content">
		<ul id="tab">
			<li>Newly Uploaded</li>
			<li>Published</li>
			<li>Verified</li>
			<li>Not Verified</li>
		</ul>

		<div id="wrapper1" style="height: auto;">

			<div class="contents">
			<table class="table">
			<thead>
			<tr>
			<th>Training ID</th>
			<th>Institute Code</th>
			<th>Title</th>
			<th>Start Date</th>
			<th>Place</th>
			<th>Price</th>
			<th>Links</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>JS007</td>
			<td>SO555</td>
			<td>CORE JAVA </td>
			<td>05/05/2015</td>
			<td>Pune</td>
			<td>5000 RS</td>
			<td><a href="view">View</a> | <a href="#">Edit </a> | <a href="#">Ignore</a></td>
			
			</tr>
			
			</tbody>
			</table>
				
			</div>
			<!-- /.contents -->

			<!-- .contents -->
			<div class="contents">
				<table class="table">
			<thead>
			<tr>
			<th>Training ID</th>
			<th>Institute Code</th>
			<th>Title</th>
			<th>Start Date</th>
			<th>Place</th>
			<th>Price</th>
			<th>Links</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>JS007</td>
			<td>SO555</td>
			<td>CORE JAVA </td>
			<td>05/05/2015</td>
			<td>Pune</td>
			<td>5000 RS</td>
			<td><a href="#">View</a> | <a href="#">Edit </a> | <a href="#">Ignore</a></td>
			
			</tr>
			
			</tbody>
			</table>
				
			</div>
			<!-- /.contents -->

			<!-- .contents -->
			<div class="contents">
				<table class="table">
			<thead>
			<tr>
			<th>Training ID</th>
			<th>Institute Code</th>
			<th>Title</th>
			<th>Start Date</th>
			<th>Place</th>
			<th>Price</th>
			<th>Links</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>JS007</td>
			<td>SO555</td>
			<td>CORE JAVA </td>
			<td>05/05/2015</td>
			<td>Pune</td>
			<td>5000 RS</td>
			<td><a href="#">View</a> | <a href="#">Edit </a> | <a href="#">Ignore</a></td>
			
			</tr>
			
			</tbody>
			</table>
			</div>

			<div class="contents">
				<table class="table">
			<thead>
			<tr>
			<th>Training ID</th>
			<th>Institute Code</th>
			<th>Title</th>
			<th>Start Date</th>
			<th>Place</th>
			<th>Price</th>
			<th>Links</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>JS007</td>
			<td>SO555</td>
			<td>CORE JAVA </td>
			<td>05/05/2015</td>
			<td>Pune</td>
			<td>5000 RS</td>
			<td><a href="#">View</a> | <a href="#">Edit </a> | <a href="#">Ignore</a></td>
			
			</tr>
			
			</tbody>
			</table>
			</div>

		</div>
	</div>

</body>


</html>