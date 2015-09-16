package com.searchmytraining.exception;

public enum ErrorCode {

	app_data_access(ErrorSeverity.ERROR), app_runtime(ErrorSeverity.FATAL), 
	
	app_no_security_context(ErrorSeverity.ERROR),

	invalidate_session(ErrorSeverity.ERROR), authentication_failed(ErrorSeverity.ERROR), 
	
	timeout_error(ErrorSeverity.ERROR),
			
	missing_mandatory_field(ErrorSeverity.ERROR),

	internal_Error(ErrorSeverity.ERROR),

	not_applicable(ErrorSeverity.ERROR),

	unAuthorised_User(ErrorSeverity.ERROR),

	missing_mandatory(ErrorSeverity.ERROR), 
	
	unauthorised_access(ErrorSeverity.ERROR);

	private ErrorSeverity severity;

	ErrorCode(ErrorSeverity severity) {
		this.severity = severity;
	}

	public ErrorSeverity getSeverity() {
		return severity;
	}

	public void setSeverity(ErrorSeverity severity) {
		this.severity = severity;
	}
}

