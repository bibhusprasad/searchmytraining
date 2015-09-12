package com.searchmytraining.dto;

import java.util.ArrayList;

import org.hibernate.validator.constraints.Email;

public class ContactDTO {

	private Integer userid;
	@Email
	private String email;
	private String website;
	private String contactpersonname;
	private ArrayList<Integer> phonetypeid;
	private ArrayList<String> phone;
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

	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public ArrayList<Integer> getPhonetypeid() {
		return phonetypeid;
	}
	public void setPhonetypeid(ArrayList<Integer> phonetypeid) {
		this.phonetypeid = phonetypeid;
	}
	public ArrayList<String> getPhone() {
		return phone;
	}
	public void setPhone(ArrayList<String> phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "ContactDTO [userid=" + userid + ", email=" + email
				+ ", website=" + website + ", contactpersonname="
				+ contactpersonname + ", phonetypeid=" + phonetypeid
				+ ", phone=" + phone + "]";
	}


}
