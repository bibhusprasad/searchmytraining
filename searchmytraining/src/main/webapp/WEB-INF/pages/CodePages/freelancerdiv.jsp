<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<html>
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
			<div id="ideas-content" class="contentblock ">
				<div class="Freelancer_wrapar">
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
											<a href="#">Prashant Maskar</a>
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
											<a href="#">Tejashree Pawar</a>
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
											<a href="#">Ram Nikam</a>
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
											<a href="#">Ankush</a>
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
					
				</div>

			</div>
			<!-- @end #ideas-content -->

		</div>
	</div>
	<!-- @end #w -->

</body>
</html>