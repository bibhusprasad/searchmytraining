package com.searchmytraining.exception;

public enum ResponseCode {

	SUCCESS("200", "Success"),
	
	FAILED("400", "Failed"),
	
	UNAUTHORIZED_ACCESS("401", ErrorCode.unauthorised_access.toString()),
	
	MISSING_MANDATORY("405", ErrorCode.missing_mandatory_field.toString()),
	
	INTERNAL_ERROR("500",ErrorCode.internal_Error.toString()),
	
	NOT_ACCEPTABLE("406",ErrorCode.not_applicable.toString()),
	
	APP_RUNTIME("500",ErrorCode.app_runtime.toString());
	
	private final String code;
	
	private final String message;

	ResponseCode(String code, String message) {
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return Integer.parseInt(code);
	}
	
	public String getMessage() {
		return message;
	}
}
