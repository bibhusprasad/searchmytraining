package com.searchmytraining.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="tbl_otp")
public class OTPEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4322958652594742455L;
	@Id
	@Column(name="otpId")
	@GeneratedValue
	private long otpId;
	
	@Column(name="userId")	
	private long userId;
		
	@Column(name="otp")	
	private Integer otp;
	
	@Column(name="timestamp")	
	private Date timestamp;

	public long getOtpId() {
		return otpId;
	}

	public void setOtpId(long otpId) {
		this.otpId = otpId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Integer getOtp() {
		return otp;
	}

	public void setOtp(Integer otp) {
		this.otp = otp;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	
	
	
}
