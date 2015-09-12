package com.searchmytraining.dto;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


public class TrainerDTO {

	@NotEmpty(message="Enter the Organisation Name")
	private String org_name;
	private Integer city;
	@NotEmpty(message="Please Enter the Contact")
	private String contact;
	@NotEmpty(message="Please Enter the Email")
	@Email(message="Invalid Email Address")
	private String email;
	@NotEmpty(message="Please Enter the Password")
	private String password;
	@NotEmpty(message="Please Enter the Confirm Password")
	private String cnfpassword;
	
	public String getCnfpassword() {
		return cnfpassword;
	}
	public void setCnfpassword(String cnfpassword) {
		this.cnfpassword = cnfpassword;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public Integer getCity() {
		return city;
	}
	public void setCity(Integer city) {
		this.city = city;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "TrainerDTO [org_name=" + org_name + ", city=" + city
				+ ", contact=" + contact + ", email=" + email + ", password="
				+ password + ", cnfpassword=" + cnfpassword + "]";
	}
	
	
	
	

}
