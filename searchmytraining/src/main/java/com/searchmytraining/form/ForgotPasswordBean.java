package com.searchmytraining.form;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class ForgotPasswordBean {

	@NotEmpty (message="{forgotPasswordBean.userName}")
	@Email(message="{email")
	private String userName;
	
	@NotNull(message="{forgotPasswordBean.otp}")	
	private Integer otp;
	
	@NotEmpty (message="{forgotPasswordBean.password}")
	private String password;

	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getOtp() {
		return otp;
	}

	public void setOtp(Integer otp) {
		this.otp = otp;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
