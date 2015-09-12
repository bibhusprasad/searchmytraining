package com.searchmytraining.dto;

public class InstituteContactDTO {

	private Integer userid;
	private Integer phonetypeid;
	private String email;
	private String website;
	private String contactpersonname;
	private String phone;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getContactpersonname() {
		return contactpersonname;
	}
	public void setContactpersonname(String contactpersonname) {
		this.contactpersonname = contactpersonname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getPhonetypeid() {
		return phonetypeid;
	}
	public void setPhonetypeid(Integer phonetypeid) {
		this.phonetypeid = phonetypeid;
	}
}
