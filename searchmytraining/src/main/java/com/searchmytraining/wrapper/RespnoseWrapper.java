package com.searchmytraining.wrapper;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class RespnoseWrapper {
	
	private Integer id;
	private Map<String,String> errorMsg;
	public boolean validation_error;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public boolean isValidation_error() {
		return validation_error;
	}
	public void setValidation_error(boolean validation_error) {
		this.validation_error = validation_error;
	}
	public Map<String,String> getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(Map<String,String> errorMsg) {
		this.errorMsg = errorMsg;
	}
}
