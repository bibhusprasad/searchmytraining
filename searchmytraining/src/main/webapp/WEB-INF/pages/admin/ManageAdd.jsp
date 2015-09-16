<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<%@page
	import="com.searchmytraining.dto.FreelancerDTO,com.searchmytraining.entity.UserEntity"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/datepicker/date.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pop-up.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/pop-up.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/popup-box.js"></script>

<script type="text/javascript">
	$('#Fdate,#Tdate').datepicker();
</script>
<script type="text/javascript">
	$(function() {
		$("ul.switch li").click(function() {
			$("ul.switch li").removeClass("on");
			$(this).addClass("on");
		});
	});
	$(function() {
		$("ul.switch1 li").click(function() {
			$("ul.switch1 li").removeClass("on1");
			$(this).addClass("on1");
		});
	});
	$(function() {
		$("ul.switch2 li").click(function() {
			$("ul.switch2 li").removeClass("on2");
			$(this).addClass("on2");
		});
	});
</script>
</head>
<body>

	<div id="pop_up_box_10">
		<a class="b-close"><img
			src="<%=request.getContextPath()%>/resources/images/images.png"
			alt="cancel"></a>
		<div class="reg_form">
			<form action="uploadAdvertise" method="post" name="myform" enctype="multipart/form-data">
				<div class="upload">
					<label>Upload </label> 
					<input id="fileupload" name="fileUpload" type="file">
				</div>
				<div class="add_name">
					<label>Advertise Name</label> 
					<input id="adname" type="text">
				</div>
				<div class="url">
					<label>URL </label> 
					<input id="adurl" type="text">
				</div>
				<div class="add_name">
					<label>Start Date</label> 
					<input id="adstart_date" type="text">
				</div>
				<div class="add_name">
					<label>End Date</label> 
					<input id="adstart_date" type="text">
				</div>
				<br><br>
				<input type="submit" value="Submit" >
			</form>
		</div>
	</div>



	<div class="Advertise">
		<div class="place_add">
			<input id="placeadd" type="button" value="Place Add" />
		</div>

		<div class="look_up">
			<label>Look Up Add By :</label> <input type="radio" name="add"
				value="Id" checked="checked">
			<h4>Add Id</h4>
			<input type="radio" name="add" value="title">
			<h4>Add Title</h4>
			<input type="radio" name="add" value="keyword">
			<h4>Keyword</h4>

			<input type="text"> 
			<div class="SAB">
			 <label>Sort Add By :</label> <select>
				<option>Newest</option>
				<option>Oldest</option>
			</select>
			</div>
		</div>
		<br> <br> <br>
		<div class="bs-example">
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="width: 250px;">Ad Headline</th>
						<th style="width: 350px;">Manage Ad</th>
						<th style="width: 150px;">Start Date</th>
						<th style="width: 150px;">End Date</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox">Ad From Homepage</td>
						<td><a href="#">View</a> | <a href="#">Edit </a> | <a
							href="#">Add</a> | <a href="#"> Delete</a></td>
						<td>May 03 2012</td>
						<td>June 05 2012</td>
						<td>
							<ul class="switch">
								<li><a href="#">Disable</a></li>
								<li class="on"><a href="#">Active</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox">Ad From Homepage</td>
						<td><a href="#">View</a> | <a href="#">Edit </a> | <a
							href="#">Add</a> | <a href="#"> Delete</a></td>
						<td>March 10 2013</td>
						<td>April 05 2013</td>
						<td>
							<ul class="switch1">
								<li><a href="#">Disable</a></li>
								<li class="on1"><a href="#">Active</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox">Ad From Homepage</td>
						<td><a href="#">View</a> | <a href="#">Edit </a> | <a
							href="#">Add</a> | <a href="#"> Delete</a></td>
						<td>Jan 25 2014</td>
						<td>April 05 2014</td>
						<td>
							<ul class="switch2">
								<li><a href="#">Disable</a></li>
								<li class="on2"><a href="#">Active</a></li>
							</ul>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>