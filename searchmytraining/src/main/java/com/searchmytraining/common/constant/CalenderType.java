package com.searchmytraining.common.constant;

public enum CalenderType {
	
	TRAINING("TRAINING"),
	SEMINAR_CONFERENCE("SEMINAR_CONFERENCE"),
	WORKSHOP("WORKSHOP");

	private String val;
	
	public String getVal() {
		return val;
	}

	CalenderType(String value){
		val=value;
	}
	
}
