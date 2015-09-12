package com.searchmytraining.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class TraineeDTO {
	
	@NotEmpty(message="Please Select Trainee Type")
	private String traineetype;
	
	private String corporatename;
	@Size(min=6, max=50,message="Name length Must be between 4 to 50")
	private String name;
	@NotEmpty(message="Please Enter the Phone Number")
	private String contact;
	@NotEmpty(message="email can not be empty")
	@Email(message="Please Enter the Valid Email")
	private String email;
	@NotEmpty(message="Please enter the Password")
	private String password;
	@NotEmpty(message="Please Enter the Confirm Password")
	private String cnfpassword;
	public String getCnfpassword() {
		return cnfpassword;
	}
	public void setCnfpassword(String cnfpassword) {
		this.cnfpassword = cnfpassword;
	}
	public String getTraineetype() {
		return traineetype;
	}
	public void setTraineetype(String traineetype) {
		this.traineetype = traineetype;
	}
	public String getCorporatename() {
		return corporatename;
	}
	public void setCorporatename(String corporatename) {
		this.corporatename = corporatename;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "TraineeDTO [traineetype=" + traineetype + ", corporatename="
				+ corporatename + ", name=" + name + ", contact=" + contact
				+ ", email=" + email + ", password=" + password + "]";
	}
	
}
