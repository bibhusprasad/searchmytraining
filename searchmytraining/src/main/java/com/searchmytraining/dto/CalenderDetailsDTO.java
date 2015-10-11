package com.searchmytraining.dto;

import javax.validation.constraints.NotNull;

import com.searchmytraining.common.constant.CalenderType;

public class CalenderDetailsDTO {

	@NotNull(message="Please enter calender Type")
	private CalenderType calenderType;
	
	@NotNull(message="Please enter a valid date")     
	private String fromDate;
	
	@NotNull(message="please select status")
	private boolean saveDraft;

	public CalenderType getCalenderType() {
		return calenderType;
	}

	public void setCalenderType(CalenderType calenderType) {
		this.calenderType = calenderType;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public boolean isSaveDraft() {
		return saveDraft;
	}

	public void setSaveDraft(boolean saveDraft) {
		this.saveDraft = saveDraft;
	}
}
