<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<div class="manage-calendar">
	<div class="mg-cal-page-heading">
		<div class="container">
			<h2>Manage Calendar</h2>
		</div>

	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="manage-section">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#calendar">Calendar</a></li>
						<li><a data-toggle="tab" href="#savedraft">Save Draft</a></li>
					</ul>

					<div class="tab-content">
						<div id="calendar" class="tab-pane fade in active">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="select-form-menu">
											<form class="form-horizontal">
												<div class="row">
													<div class="col-md-4">
														<!-- First Name-->
														<div class="form-group">
															<label class="col-md-4 control-label" for="selectbasic">Type</label>
															<div class="col-md-8">
																<select id="selectbasic" name="selectbasic"
																	class="form-control">
																	<option value="1">Time 1</option>
																	<option value="2">Time 1</option>
																	<option value="3">Time 1</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<!-- Last Name-->
														<div class="form-group">
															<label class="col-md-4 control-label" for="selectbasic">Status</label>
															<div class="col-md-8">
																<select id="selectbasic" name="selectbasic"
																	class="form-control">
																	<option value="1">Time 1</option>
																	<option value="2">Time 1</option>
																	<option value="3">Time 1</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<!-- Last Name-->
														<div class="form-group">
															<label class="col-md-4 control-label" for="selectbasic">Start
																Date</label>
															<div class="col-md-8">
																<select id="selectbasic" name="selectbasic"
																	class="form-control">
																	<option value="1">Time 1</option>
																	<option value="2">Time 1</option>
																	<option value="3">Time 1</option>
																</select>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div id="no-more-tables">
										<!--Confirmation Pop up-->
										<div class="mfp-with-anim mfp-hide mfp-dialog clearfix"
											id="confirm-delete">

											<h4>Are you sure</h4>
										</div>
										<table id="tableData"
											class="col-md-12 table-bordered table-striped table-condensed cf">
											<thead class="cf">
												<tr>
													<th>Title</th>
													<th>Type</th>
													<th>Start Date</th>
													<th>End Date</th>
													<th>Posted Date</th>
													<th>Status</th>
													<th></th>
													<th></th>

												</tr>
											</thead>
											<tbody>
												<tr class="clickable-row" data-href='url:#'>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>

												</tr>
												</a>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>
													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>
													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>

													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
												<tr>
													<td data-title="Title">
														<div class="has-tooltip east">
															<a href="detailed-view.html" target="_blank">AAC</a> <span
																class="tooltip">
																<p class="text-center">Course Title</p>
																<p class="text-center">XXXXXXX</p>
																<p>CourseId: 1317351637</p>
																<p>Start Date:12/06/2015</p>
																<p>Duration:1y7853</p>
																<p>Time:12:30</p>
																<p>Brief Description:ettsgs</p>
																<p>Location:hjdgdg</p>
															</span>
														</div>
													</td>
													<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
														LIMITED.</td>
													<td data-title="Start Date">$1.38</td>
													<td data-title="End Date">-0.01</td>
													<td data-title="Posted Date">$1.39</td>
													<td data-title="Status">$1.39</td>
													<td data-title="Delete" align="center"><a
														href="#confirm-delete" data-effect="mfp-move-from-top"
														class="popup-text"><i class="fa fa-trash-o"></i></a></td>
													<td data-title="Update" align="center"><i
														class="fa fa-pencil-square-o"></i></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
						<div id="savedraft" class="tab-pane fade">
							<div class="row">
								<div class="col-md-12">
									<div class="select-form-menu">
										<form class="form-horizontal">
											<div class="row">
												<div class="col-md-4">
													<!-- First Name-->
													<div class="form-group">
														<label class="col-md-4 control-label" for="selectbasic">Type</label>
														<div class="col-md-8">
															<select id="selectbasic" name="selectbasic"
																class="form-control">
																<option value="1">Time 1</option>
																<option value="2">Time 1</option>
																<option value="3">Time 1</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<!-- Last Name-->
													<div class="form-group">
														<label class="col-md-4 control-label" for="selectbasic">Status</label>
														<div class="col-md-8">
															<select id="selectbasic" name="selectbasic"
																class="form-control">
																<option value="1">Time 1</option>
																<option value="2">Time 1</option>
																<option value="3">Time 1</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<!-- Last Name-->
													<div class="form-group">
														<label class="col-md-4 control-label" for="selectbasic">Start
															Date</label>
														<div class="col-md-8">
															<select id="selectbasic" name="selectbasic"
																class="form-control">
																<option value="1">Time 1</option>
																<option value="2">Time 1</option>
																<option value="3">Time 1</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div id="no-more-tables">
									<table id="tableData"
										class="col-md-12 table-bordered table-striped table-condensed cf">
										<thead class="cf">
											<tr>
												<th>Title</th>
												<th>Type</th>
												<th>Start Date</th>
												<th>End Date</th>
												<th>Posted Date</th>
												<th>Status</th>
												<th></th>
												<th></th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
											<tr>
												<td data-title="Title">AAC</td>
												<td data-title="Type">AUSTRALIAN AGRICULTURAL COMPANY
													LIMITED.</td>
												<td data-title="Start Date">$1.38</td>
												<td data-title="End Date">-0.01</td>
												<td data-title="Posted Date">$1.39</td>
												<td data-title="Status">$1.39</td>
												<td data-title="Delete" align="center"><i
													class="fa fa-trash-o"></i></td>
												<td data-title="Update" align="center"><i
													class="fa fa-pencil-square-o"></i></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="gap"></div>