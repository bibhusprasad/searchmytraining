<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<html>
<head>
<script>
	$(document).ready(function() {
		$('.tooltip').tooltipster({
			position : 'bottom'
			

		});
	});
</script>


</head>
<body>

	<div id="t" class="clearfix">
		<ul id="tabmenu">
			<li class="open hvr-underline-reveal"
				onclick="loadcalender('<%=request.getContextPath()%>');"><a>Calender</a></li>

			<li class="open hvr-underline-reveal"
				onclick="loadinstitute('<%=request.getContextPath()%>');"><a>Institute</a></li>

			<li class="open hvr-underline-reveal"
				onclick="loadfreelancer('<%=request.getContextPath()%>');"><a>Freelancer</a></li>

			<li class="open hvr-underline-reveal"
				onclick="loadseminar('<%=request.getContextPath()%>');"><a>Seminar</a></li>

		</ul>
		<div id="tabcontent">

			<div id="about-content" class="contentblock ">
				<div class="institute_wrapar">
					
					<c:forEach var="institue" items="${institutesearch}">
						<div class="list-cart-box">
							<div class="list-cart-card">
								<div class="list-detail-box">
									<div class="list-image">
										<img class="gimg" src="${pageContext.request.contextPath}/common/downloadPicture/${institue.user.userId}" id="profilepic_curr" name="profilepic"
											alt="soft" />
									</div>
									<div class="list-detail">
										<div class="listtext-part">
											<p class="list-name">
												<a href="#">${institue.instituteprofile.companyName}</a>
											</p>
											<p class="list-loc">
												<i class="fa fa-map-marker"></i>
												${institue.location.buildingNo}
												${institue.location.street}
												${institue.location.landmark}
												${institue.location.city.cityName}
												${institue.location.pincode}
											</p>
											<!-- <p class="list-date">
												<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
														class="fa fa-calendar"></i>&nbsp;More Date</span></a>
											</p> -->
										</div>
										<div class="list-link">
											<a href="Institueview" class="details data"><i class="fa fa-edit"></i>&nbsp;View
												Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
												Training</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
				
				
				
				
					<%-- <div class="list-cart-box">
						<div class="list-cart-card">
							<div class="list-detail-box">
								<div class="list-image">
									<img class="gimg" src="/searchmytraining/resources/images/soft.png"
										alt="soft" />
								</div>
								<div class="list-detail">
									<div class="listtext-part">
										<p class="list-name">
											<a href="#">${test}</a>
										</p>
										<p class="list-loc">
											<i class="fa fa-map-marker"></i> 
											sr no. 11/19 
											Kharadi Bypass 
											ICICI bank javal 
											Pune-411014
										</p>
										<p class="list-date">
											<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
													class="fa fa-calendar"></i>&nbsp;More Date</span></a>
										</p>
									</div>
									<div class="list-link">
										<a href="Institueview" class="details data"><i class="fa fa-edit"></i>&nbsp;View
											Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
											Training</a>
									</div>
								</div>

							</div>
						</div>

					</div>
					<div class="list-cart-box">
						<div class="list-cart-card">
							<div class="list-detail-box">
								<div class="list-image">
									<img class="gimg" src="/searchmytraining/resources/images/soft.png"
										alt="soft" />
								</div>
								<div class="list-detail">
									<div class="listtext-part">
										<p class="list-name">
											<a href="#">Softinfology Pvt Ltd</a>
										</p>
										<p class="list-loc">
											<i class="fa fa-map-marker"></i> Kharadi,Opp.zensar IT
											Park,Pune
										</p>
										<p class="list-date">
											<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
													class="fa fa-calendar"></i>&nbsp;More Date</span></a>
										</p>
									</div>
									<div class="list-link">
										<a href="#" class="details"><i class="fa fa-edit"></i>&nbsp;View
											Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
											Training</a>
									</div>
								</div>

							</div>
						</div>

					</div>
					<div class="list-cart-box">
						<div class="list-cart-card">
							<div class="list-detail-box">
								<div class="list-image">
									<img class="gimg" src="/searchmytraining/resources/images/soft.png"
										alt="soft" />
								</div>
								<div class="list-detail">
									<div class="listtext-part">
										<p class="list-name">
											<a href="#">Softinfology Pvt Ltd</a>
										</p>
										<p class="list-loc">
											<i class="fa fa-map-marker"></i> Kharadi,Opp.zensar IT
											Park,Pune
										</p>
										<p class="list-date">
											<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
													class="fa fa-calendar"></i>&nbsp;More Date</span></a>
										</p>
									</div>
									<div class="list-link">
										<a href="#" class="details"><i class="fa fa-edit"></i>&nbsp;View
											Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
											Training</a>
									</div>
								</div>

							</div>
						</div>

					</div>
					<div class="list-cart-box">
						<div class="list-cart-card">
							<div class="list-detail-box">
								<div class="list-image">
									<img class="gimg" src="/searchmytraining/resources/images/soft.png"
										alt="soft" />
								</div>
								<div class="list-detail">
									<div class="listtext-part">
										<p class="list-name">
											<a href="#">Softinfology Pvt Ltd</a>
										</p>
										<p class="list-loc">
											<i class="fa fa-map-marker"></i> Kharadi,Opp.zensar IT
											Park,Pune
										</p>
										<p class="list-date">
											<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
													class="fa fa-calendar"></i>&nbsp;More Date</span></a>
										</p>
									</div>
									<div class="list-link">
										<a href="#" class="details"><i class="fa fa-edit"></i>&nbsp;View
											Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
											Training</a>
									</div>
								</div>

							</div>
						</div>

					</div>
					<div class="list-cart-box">
						<div class="list-cart-card">
							<div class="list-detail-box">
								<div class="list-image">
									<img class="gimg" src="/searchmytraining/resources/images/soft.png"
										alt="soft" />
								</div>
								<div class="list-detail">
									<div class="listtext-part">
										<p class="list-name">
											<a href="#">Softinfology Pvt Ltd</a>
										</p>
										<p class="list-loc">
											<i class="fa fa-map-marker"></i> Kharadi,Opp.zensar IT
											Park,Pune
										</p>
										<p class="list-date">
											<a href="#" class="tooltip" title="15-Nov-2015,10-Dec-2015"><span><i
													class="fa fa-calendar"></i>&nbsp;More Date</span></a>
										</p>
									</div>
									<div class="list-link">
										<a href="#" class="details"><i class="fa fa-edit"></i>&nbsp;View
											Details</a> <a href="#" class="group"><i class="fa fa-users"></i>&nbsp;Group
											Training</a>
									</div>
								</div>

							</div>
						</div>

					</div> --%>
					
				</div>

			</div>


		</div>
	</div>
	<!-- @end #w -->

</body>
</html>