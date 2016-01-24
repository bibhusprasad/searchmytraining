<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<nav class="navbar navbar-inverse navbar-main link">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" type="button"
				data-toggle="collapse" data-target="#main-nav-collapse"
				area_expanded="false">
				<span class="sr-only">Main Menu</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html"> <img
				src="<%=request.getContextPath()%>/resources/new/images/logo.png" alt=""
				title="Image Title" />
			</a>
		</div>
		<div class="collapse navbar-collapse" id="main-nav-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#">Profile<b class="caret"></b><i
						class="drop-caret" data-toggle="dropdown"></i></a>
					<ul class="dropdown-menu">
						<li class="link-content">
							<div class="row row-eq-height row-col-border">
								<ul class="dropdown-menu-items-list">
									<li><a href='view-profile.html'>View Profile</a></li>
									<li><a href='update-profile.html'>Update Profile</a></li>
								</ul>
							</div>
						</li>
					</ul></li>
				<li class="dropdown"><a href="#">Calendar<b class="caret"></b><i
						class="drop-caret" data-toggle="dropdown"></i></a>
					<ul class="dropdown-menu">
						<li class="link-content">
							<div class="row row-eq-height row-col-border">
								<ul class="dropdown-menu-items-list">
									<li><a href='post-calendar.html'>Post Calendar</a></li>
									<li><a href='manage-calendar.html'>Manage Calendar</a></li>
								</ul>
							</div>
						</li>
					</ul></li>
				<li class="dropdown"><a href="#enquiry-dialog"
					data-effect="mfp-move-from-top" class="popup-text">Settings<b
						class="caret"></b><i class="drop-caret" data-toggle="dropdown"></i></a>
					<ul class="dropdown-menu">
						<li class="link-content">
							<div class="row row-eq-height row-col-border">
								<ul class="dropdown-menu-items-list">
									<li><a href='#'>Insights</a></li>
									<li><a href='send-sms.html'>Send SMS</a></li>
									<li><a href='send-email.html'>Send Email</a></li>
								</ul>
							</div>
						</li>
					</ul></li>
				<li class="dropdown"><a href="#">About Us<b class="caret"></b><i
						class="drop-caret" data-toggle="dropdown"></i></a>
					<ul class="dropdown-menu">
						<li class="link-content">
							<div class="row row-eq-height row-col-border">
								<ul class="dropdown-menu-items-list">
									<li><a href="#">Why SearchMyTraining</a></li>
									<li><a href='#'>About Us</a></li>
									<li><a href='#'>SearchMyTraining News</a></li>
									<li><a href='#'>Career With Us</a></li>
									<li><a href='#'>Contact Us</a></li>
								</ul>
							</div>
						</li>
					</ul></li>
				<li><a href='#'>Blog</a></li>

				<li><a href="#">Sign Out</a>
			</ul>

		</div>
	</div>
</nav>