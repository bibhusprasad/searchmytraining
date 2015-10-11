package com.searchmytraining.wrapper;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class RespnoseWrapper {

	private Long responseWrapperId;
	private Map<String, String> errorMsg;
	private boolean validationError;
	private boolean successMessage;
	private boolean previewCal;

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

	public boolean isPreviewCal() {
		return previewCal;
	}

	public void setPreviewCal(boolean previewCal) {
		this.previewCal = previewCal;
	}
	
}
