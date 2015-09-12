package com.searchmytraining.dto;

public class PhoneDTO {

	private Integer userid;
	private Integer phoneType;
	private String phone;
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getPhoneType() {
		return phoneType;
	}
	public void setPhoneType(Integer phoneType) {
		this.phoneType = phoneType;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "PhoneDTO [userid=" + userid + ", phoneType=" + phoneType
				+ ", phone=" + phone + "]";
	}
}
