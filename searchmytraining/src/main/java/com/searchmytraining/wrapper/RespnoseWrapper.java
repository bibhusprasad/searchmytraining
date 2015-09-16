package com.searchmytraining.wrapper;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class RespnoseWrapper {

	private Long responseWrapperId;
	
	private Map<String, String> errorMsg;
	
	public boolean validationError;
	
	public boolean successMessage;

	public Long getResponseWrapperId() {
		return responseWrapperId;
	}

	public void setResponseWrapperId(Long responseWrapperId) {
		this.responseWrapperId = responseWrapperId;
	}

	public boolean isValidationError() {
		return validationError;
	}

	public void setValidationError(boolean validationError) {
		this.validationError = validationError;
	}

	public Map<String, String> getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(Map<String, String> errorMsg) {
		this.errorMsg = errorMsg;
	}

	public boolean isSuccessMessage() {
		return successMessage;
	}

	public void setSuccessMessage(boolean successMessage) {
		this.successMessage = successMessage;
	}
}
