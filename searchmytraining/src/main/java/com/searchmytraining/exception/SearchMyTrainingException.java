package com.searchmytraining.exception;

import java.io.Serializable;

public class SearchMyTrainingException extends RuntimeException {

	private static final long serialVersionUID = -7932257545586762153L;
	private ErrorCode errorCode;
	private ResponseCode responseCode;
	private Serializable object;
	private String message;
	public SearchMyTrainingException(ErrorCode errorCode) {
		super();
		this.errorCode = errorCode;
	}

	
	public SearchMyTrainingException(ResponseCode responseCode) {
		super();
		this.responseCode = responseCode;
	}

	public SearchMyTrainingException(ErrorCode errorCode, Throwable cause) {
		super(cause);
		this.errorCode = errorCode;
	}

	public SearchMyTrainingException(ResponseCode responseCode, Serializable object) {
		super();
		this.responseCode = responseCode;
		this.object = object;
	}

	
	public SearchMyTrainingException(ErrorCode errorCode, String message) {
		super();
		this.errorCode = errorCode;
		this.message = message;
	}
	
	public ErrorCode getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(ErrorCode errorCode) {
		this.errorCode = errorCode;
	}

	public Serializable getObject() {
		return object;
	}

	public void setObject(Serializable object) {
		this.object = object;
	}

	public ResponseCode getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(ResponseCode responseCode) {
		this.responseCode = responseCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
