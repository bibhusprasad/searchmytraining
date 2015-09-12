<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang=''>
<head>
<title>Web-Application-3</title>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/css/combine.css"type="text/css">

<script src="<%=request.getContextPath()%>/resources/js/modernizr-1.5.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-ui-1.10.4.custom.js"></script>
<!--color-->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery.iconmenu.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/my_js1.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/tabBar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/toggle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/combine.js"></script> 

</head>
<body>
	<%@include file="../../layouts/Header.jsp"%>
	<%@include file="../Trainee/TraineeRegistration.jsp"%>
	<%@include file="../TrainingProvider/TrainingProviderRegistration.jsp"%>
	<%@include file="../FreeLancer/FreelancerResistration.jsp"%>
	<%@include file="../TrainingEnquiry.jsp"%>
	<%@include file="../GroupTrainingRequest.jsp"%>
    <%@include file="../Sign-In.jsp"%>
	
	<!--==============================================================================-->
	<div class="search_wrapar">

		<div class="logoname">
			<h1>SearchMyTraining</h1>
		</div>

		<div class="citi-box">

			<div class="country">

				<div class="arrow">
					<a href="#" onclick="my_show()"><img
						src="<%=request.getContextPath()%>/resources/images/loc3.png"
						alt="arrow" /></a>
				</div>
				<span class="txt"><a href="#" id="Country"
					onclick="my_show()">India</a></span>
				<div id="drop" class="drop1">
					<ul>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Pune')">Pune</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('solapur')">Solapur</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Mumbai')">Mumbai</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Thane')">Thane</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Nagpur')">Nagpur</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('kolkata')">kolkata</a></li>
						<li><a href="javacript:void(0)" id="selCountry"
							onclick="ShowCountry('Goa')">Goa</a></li>
					</ul>
				</div>
			</div>

		</div>

		<div class="search_bar">

			<div class="course-name">
				<input class="input-1" type="text" placeholder="Course Name" />
			</div>
			<div class="location">
				<input class="input-2" type="text" placeholder="Location" />
			</div>
			<div class="search">
				<input type="submit" value="Search" />
			</div>
			<div class="adv-search">
				<a href="javascript:void 0">Advance Search</a>
			</div>

		</div>

		<div class="brow_train">
			<ul class="brow_obpt">
				<li><a href="#1">All Training </a> &nbsp;&nbsp; <span> |</span>
				</li>
				<li><a href="#3">Training By Category</a>&nbsp;&nbsp;<span>
						| </span></li>
				<li><a href="#4">Training By Institute </a>&nbsp;&nbsp;<span>
						| </span></li>
				<li><a href="#5">Training By Location </a></li>
			</ul>
		</div>
	</div>
	<!--====================================section start here================================================================-->

	<div class="section_wrapar">
		<div class="ver_add-wrapar">

			<div id="verticalScroller">
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/b.jpg"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/c.jpg"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/d.jpg"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/b.jpg"
						alt="b">
				</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/a.png"
						alt="b">
				</div>
			</div>

		</div>
		<div class="middle_part">
			<div class="top_add">
				<img
					src="<%=request.getContextPath()%>/resources/images/hdBannerCareers_bg.jpg"
					alt="a">
			</div>
			<div id="t" class="clearfix">
				<ul id="tabmenu">
					<li class="open hvr-underline-reveal"><a href="#home-content">Calender</a></li>

					<li class="open hvr-underline-reveal"><a href="#about-content">Institute</a></li>

					<li class="open hvr-underline-reveal"><a href="#ideas-content">Freelancer</a></li>

					<li class="open hvr-underline-reveal"><a href="#contact-content">Seminar</a></li>

				</ul>
				<div id="tabcontent">
					<div id="home-content" class="contentblock">
					 <div class="Calender_wrapar">
					    <table>
					    <tr>
					      <th> Training Code</th>
					      <th> Training Name</th>
					      <th> Location</th>
					      <th> Date</th>
					      <th> Price</th>
					      <th> Brochure</th>
					      <th> Apply</th>
					    </tr>
					    <tr id ="shadow">
					      <td> WD007</td>
					      <td> Web Designing</td>
					      <td> Pune</td>
					      <td> 30-May-2015</td>
					      <td> 9000 $</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					    <tr>
					      <td> GD157</td>
					      <td> Graphics Design</td>
					      <td> Mumbai</td>
					      <td> 20-Jan-2015</td>
					      <td> 5000 $</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					    <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td> 1-Feb-2015</td>
					      <td> 10000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> J409</td>
					      <td>Java Programing</td>
					      <td> Solapur</td>
					      <td> 8-Oct-2015</td>
					      <td> 1050$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> PH789</td>
					      <td> PHP Programing</td>
					      <td> Nashik</td>
					      <td> 25-Aug-2015</td>
					      <td> 3000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> Aj454</td>
					      <td> Ajax Programing</td>
					      <td> pune</td>
					      <td> 10-Dec-2015</td>
					      <td> 4000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td>Ora99</td>
					      <td> Oracle Progaming</td>
					      <td> mumbai</td>
					      <td> 20-Nov-2015</td>
					      <td> 1800$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td> 1-Feb-2015</td>
					      <td> 10000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WD859</td>
					      <td> Web Designing</td>
					      <td> pune</td>
					      <td> 10-Mar-2015</td>
					      <td> 1000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td> 1-Feb-2015</td>
					      <td> 10000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td> 25-Aug-2015</td>
					      <td> 10000$</td>
					    <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> Aj454</td>
					      <td> Ajax Programing</td>
					      <td> pune</td>
					      <td>20-Nov-2015</td>
					      <td> 4000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td>20-Nov-2015</td>
					      <td> 10000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> Aj454</td>
					      <td> Ajax Programing</td>
					      <td> pune</td>
					      <td>  25-Aug-2015</td>
					      <td> 4000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> WDP899</td>
					      <td> Web Development</td>
					      <td> Nagpur</td>
					      <td> 20-Nov-2015</td>
					      <td> 10000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					     <tr>
					      <td> Aj454</td>
					      <td> Ajax Programing</td>
					      <td> pune</td>
					      <td> 20-Nov-2015</td>
					      <td> 4000$</td>
					      <td><a href="#"> Brochure</a></td>
					      <td><a href="#"> Apply</a></td>
					    </tr>
					    
					    </table>
					 
					 </div>
						

					</div>
					<!-- @end #home-content -->


					<div id="about-content" class="contentblock hidden">
                       <div class="institute_wrapar">
                           <ul class="institute_list">
                           <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span>Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                           <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span>Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                           <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span>Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                           <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span>Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                           <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span>Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                            <li>
                           <div class="institute_block">
                               <div class="inastitute_block_left">
                               <h1><a href="#">Softinfology Pvt Ltd.</a></h1>
                               <span>
                               <span class="institute_location"> Kharadi | </span>
                               <a href="#">More Date</a>
                               </span>
                               <br>
                               <span class="institute_add">Kharadi,Opp.Zensar IT Park,Near Huyndai Showroom</span>
                               
                               </div> 
                               <div class="inastitute_block_right">
                                   <div class="fee_box">
                                       <div class="fee">
                                           <span class="price">$4500</span>
                                       </div>
                                       <span class="person">Per/Person</span>
                                   </div>
                                  <div class="view_detail">
                                     <p><a href="#" class="detail_bar">View Details</a></p>
                                     <p><a href="#" class="group_train">Group Training</a></p>
                                     
                                  </div>
                                   </div> 
                           
                           </div>
                           </li>
                           </ul>
                       </div>
						
					</div>

					<div id="ideas-content" class="contentblock hidden">
						 <div class="freelancer_wrapar">
						     <table>
						       <tr>
						       <th style="width: 20%;">Name</th>
						       <th>Location</th>
						       <th>Contact Details</th>
						       <th>Link to Profile Page</th>
						       <th>Get Contact</th>
			                   </tr>
			                   <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Shailaish</td>
			                   <td>Mumbai</td>
			                   <td>8685627455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Pratik</td>
			                   <td>Nagpur</td>
			                   <td>124859455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Ankush</td>
			                   <td>Nashik</td>
			                   <td>860589645</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Vivek</td>
			                   <td>Pune</td>
			                   <td>965525845</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                  <td>Pratik</td>
			                   <td>Nagpur</td>
			                   <td>124859455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                    <td>Shailaish</td>
			                   <td>Mumbai</td>
			                   <td>8685627455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Ankush</td>
			                   <td>Nashik</td>
			                   <td>860589645</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Pratik</td>
			                   <td>Nagpur</td>
			                   <td>124859455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Shailaish</td>
			                   <td>Mumbai</td>
			                   <td>8685627455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
			                    <tr>
			                   <td>Prashant</td>
			                   <td>Pune</td>
			                   <td>8600249455</td>
			                   <td>Softinfology.com</td>
			                   <td>Get Contact</td>
			                   </tr>
						     
						     </table>
						 
						 </div>

					</div>
					<!-- @end #ideas-content -->

					<div id="contact-content" class="contentblock hidden">
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute</h1></li>
								<ul>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
									<li><a href="#">Training Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute</h1></li>
								<ul>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
								</ul>
							</ul>
						</div>
						<div class="top-institute">
							<ul>
								<li><h1>Training Institute</h1></li>
								<ul>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
									<li><a href="#"> Institute</a></li>
								</ul>
							</ul>
						</div>



					</div>
					<!-- @end #contact-content -->
				</div>
			</div>
			<!-- @end #w -->
		</div>
		<div class="right_part">

			<div class="top_cat_box">
				<div>
					<img src="<%=request.getContextPath()%>/resources/images/first.jpg"
						alt="a">
				</div>

				<div>
					<img
						src="<%=request.getContextPath()%>/resources/images/traino2.jpg"
						alt="b">
				</div>

				<div>
					<img src="<%=request.getContextPath()%>/resources/images/train.jpg"
						alt="c">
				</div>

				<div>
					<img
						src="<%=request.getContextPath()%>/resources/images/traino1.jpg"
						alt="d">
				</div>

				<div>
					<img
						src="<%=request.getContextPath()%>/resources/images/traino2.jpg"
						alt="f">
				</div>



			</div>
			<div class="bottom_ban_box">
				<!--<img src="images/sem.gif" alt="a">-->
				<h1>SEMINARS</h1>
				<ul class="text_slide">
					<marquee direction="up" behavior="scroll" scrollamount="3"
						height="305">

						<li><a href="#" target="_blank">Seminar on Graphics
								Design</a>
						<li>
						<li><a href="#" target="_blank">Seminar on HTML5 Design </a></li>
						<li><a href="#" target="_blank">Seminar on Web Design</a></li>
						<li><a href="#" target="_blank">Seminar on web
								Development</a></li>
						<li><a href="#" target="_blank">Seminar on Graphics
								Design</a></li>
						<li><a href="#" target="_blank">Seminar on web Design</a></li>
					</marquee>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="image-slider">
		<div class="ribbon-1">
			<h1>Did You Know?</h1>
			<div class="para">
				<p>Our vision is to give people the power to learn and make the
					world more enlightened one training course at a time.</p>
			</div>
		</div>


		<div id="slider" class="transbg-2 roundtext">

			<ul id="icon-menu" class="sti-menu">
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/softeware-development.html">
						<h2 data-type="mText" class="sti-item">Software makes your
							business smart and speedup the working and only software
							genuinely manage your organization.</h2>
						<h3 data-type="sText" class="sti-item">Software Development
							»</h3> <span data-type="icon"
						class="sti-icon sti-icon-branding sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/ourwork.html">
						<h2 data-type="mText" class="sti-item">Your website is
							increasingly important and will dictate how a lot of your
							customers will think about you as a company.</h2>
						<h3 data-type="sText" class="sti-item">See Our Web Portfolio
							»</h3> <span data-type="icon" class="sti-icon sti-icon-web sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/seo.html">
						<h2 data-type="mText" class="sti-item">Search Engine
							Optimization is the most cost effective form of marketing you
							will ever undertake to promote your business.</h2>
						<h3 data-type="sText" class="sti-item">SEO Company india »</h3> <span
						data-type="icon" class="sti-icon sti-icon-seo sti-item"></span>
				</a></li>
				<li data-hovercolor="#fff" class="box-shaddow-black"><a
					href="<%=request.getContextPath()%>/resources/graph-design.html">
						<h2 data-type="mText" class="sti-item">Innovative project
							ideas makes your carrier bright.Softinfology gives you help for
							innovative project.</h2>
						<h3 data-type="sText" class="sti-item">Search About Graphics
							»</h3> <span data-type="icon"
						class="sti-icon sti-icon-print sti-item"></span>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="clear"></div>
	<div class="partners">
		<div class="partners-info">
			<h1>Our Partners</h1>
			<div class="para">
				<p>Our mission is to create a global ecommerce platform where
					anyone can develop themselves or others... making the complex
					simple.</p>
			</div>
		</div>


		<div class="border-top">
			<ul class="garagedoor">
				<li id="shutter1"><a href="#1">Link 1</a></li>
				<li id="shutter2"><a href="#2">Link 2</a></li>
				<li id="shutter3"><a href="#3">Link 3</a></li>
				<li id="shutter4"><a href="#4">Link 4</a></li>
				<li id="shutter5"><a href="#5">Link 4</a></li>
			</ul>
		</div>
		<div class="border-top2"></div>


	</div>
	
	<div class="clear"></div>

	<%@include file="../../layouts/footer.jsp" %>
</body>
</html>



