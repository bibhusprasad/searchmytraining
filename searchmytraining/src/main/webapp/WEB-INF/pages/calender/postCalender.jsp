<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<div class="post-calendar-section">
	<div class="pt-cal-page-heading">
		<div class="container">
			<h2>Post Calendar</h2>
		</div>

	</div>
	<div class="container">
		<!-- post-calender -->
		<div class="posts-calendar">


			<h4>
				<a href="search-calendar.html"><img src="images/copy-cal.png" /></a>
			</h4>
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">Course
						Name</label>
					<div class="col-sm-6">
						<input id="textinput" required="true" name="textinput" type="text"
							placeholder="Course Name"
							class="easyui-validatebox form-control input-md" maxlength="10">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="selectbasic">Type
						of Calendar</label>
					<div class="col-md-6">
						<select id="selectbasic" name="selectbasic"
							class="easyui-combobox form-control" data-options="required:true">
							<option value="">Select</option>
							<option value="1">Training</option>
							<option value="2">Seminar/Conference</option>
							<option value="3">Workshop</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 control-label" for="checkboxes">Industry
						Type</label>
					<div class="col-md-6">
						<div class="checkbox">
							<label for="option-1"> <input type="checkbox"
								name="colorCheckbox" value="red"> Option one
							</label>
						</div>
						<div class="checkbox red box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>
						<div class="checkbox red box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>
						<div class="checkbox red box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>

						<div class="checkbox">
							<label for="option-2"> <input type="checkbox"
								name="colorCheckbox" value="green"> Option two
							</label>
						</div>

						<div class="checkbox green box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>
						<div class="checkbox green box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>
						<div class="checkbox green box">
							<label class="control-label" for="option-1"> <input
								type="checkbox" name="" value=""> Option one
							</label>
						</div>

						<div class="checkbox">
							<label for="option-3"> <input type="checkbox"
								name="colorCheckbox" value="blue"> Option two
							</label>
						</div>
						<div class="blue box">
							You have selected <strong>blue checkbox</strong> so i am here
						</div>

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">Price</label>
					<div class="col-md-3">
						<input id="textinput" name="textinput" type="text"
							placeholder="Price" class="form-control input-md">
					</div>
					<div class="col-md-3">
						<input type="checkbox" name="checkboxes" id="checkboxes-0"
							value="1" style="margin-left: 20px; margin-top: 10px;"> <small><i>Don't
								Disclose</i></small>
					</div>

				</div>

				<!-- Multiple Checkboxes (inline) -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">From</label>
					<div class="col-md-3">
						<input id="textinput" name="textinput"
							class="easyui-datebox form-control input-md" required="required">

					</div>
					<label class="col-md-1 control-label" for="textinput">To</label>
					<div class="col-md-3">
						<input id="textinput" name="textinput"
							class="easyui-datebox form-control input-md" required="required">
					</div>
				</div>
				<!-- Multiple Checkboxes (inline) -->

				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">Time
						From</label>
					<div class="col-md-2">
						<div class="input-group bootstrap-timepicker timepicker">
							<input id="timepicker1" type="text"
								class="form-control input-small"> <span
								class="input-group-addon"><i
								class="glyphicon glyphicon-time"></i></span>
						</div>
					</div>
					<div>
						<label class="control-label" for="textinput" style="float: left;">To</label>
						<div class="col-md-2">

							<div class="input-group bootstrap-timepicker timepicker">
								<input id="timepicker2" type="text"
									class="form-control input-small"> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
					</div>

				</div>
				<div class="form-group">
					<div class="col-md-7 col-md-offset-3">
						<div class="checkbox">
							<label> <input type="checkbox">Same as Institute
								address
							</label>
						</div>
					</div>

					<label class="col-md-3 control-label" for="textinput">Address</label>
					<div class="col-md-6">
						<input id="textinput" name="textinput" type="text"
							placeholder="Address"
							class="easyui-validatebox form-control input-md"
							required="required" maxlength="10">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput"></label>
					<div class="col-md-6">
						<input id="textinput" name="textinput" type="text"
							placeholder="Address"
							class="easyui-validatebox form-control input-md"
							required="required" maxlength="10">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">Landmark</label>
					<div class="col-md-6">
						<input id="textinput" name="textinput" type="text"
							placeholder="Landmark"
							class="easyui-validatebox form-control input-md"
							required="required" maxlength="10">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">City</label>
					<div class="col-md-6">
						<input id="textinput" name="textinput" type="text"
							placeholder="City"
							class="easyui-validatebox form-control input-md"
							required="required" maxlength="10">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">PinCode</label>
					<div class="col-md-6">
						<input id="textinput" name="textinput" type="text"
							placeholder="PinCode"
							class="easyui-validatebox form-control input-md"
							required="required" maxlength="10">

					</div>
				</div>
				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="selectbasic">State</label>
					<div class="col-md-6">
						<select id="selectbasic" name="selectbasic" class="form-control">
							<option value="">Select the State</option>
							<option value="1">State 1</option>
							<option value="2">State 1</option>
							<option value="3">State 1</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">Programme
						Brief</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">Programme
						Overview</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">Training
						Methodology</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 control-label" for="textinput">Keywords</label>
					<div class="col-md-6">

						<select id="select2" style="width: 300px" multiple>
							<option value="AL">Alabama</option>
							<option value="AR">Arkansas</option>
							<option value="IL">Illinois</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="OK">Oklahoma</option>
							<option value="SD">South Dakota</option>
							<option value="TX">Texas</option>
							<option value="TN">Tennessee</option>
							<option value="WI">Wisconsin</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">Faculty
						Deatails</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">How to
						Register</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="textarea">Detail
						Of Training Provider</label>
					<div class="col-md-6">
						<textarea class="easyui-validatebox form-control input-md"
							required="required" maxlength="10" id="textarea" name="textarea">Write your views</textarea>
					</div>
				</div>
				<!-- File Button -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="filebutton">Upload
						Calendar Brochure</label>
					<div class="col-md-3">
						<input id="filebutton" name="filebutton"
							class="input-file upload-file" type="file"
							style="width: 287px; height: 33px;">
					</div>
					<div class="col-md-3">
						<button id="button1id" name="button1id" class="btn btn-success">Upload</button>
					</div>

				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="button1id"></label>
					<div class="col-md-6">
						<button id="button1id" name="button1id" class="btn btn-success">Save
							& Post Later</button>
						<button id="button2id" name="button2id" class="btn btn-success">Preview
							& Post Calendar</button>

					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="gap"></div>