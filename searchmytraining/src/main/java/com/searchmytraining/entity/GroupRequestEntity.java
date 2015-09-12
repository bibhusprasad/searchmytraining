package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Table(name = "group_request")
@Entity
public class GroupRequestEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long request_id;
	
	@Column(name="contact_name", nullable=false)
	private String contactname;
	
	@Column(name="company_name", nullable=false)
	private String companyname;
	
	@Column(name="course_title", nullable=false)
	private String course;
	
	@Column(name="email", nullable=false)
	private String email;
	
	@Column(name="phone", nullable=false)
	private String phone;
	
	@Column(name="trainingneeds")
	private String trainingneeds;
	
	@Column(name="cityid", nullable=false)
	private Long cityid;
	
	public Long getRequestid() {
		return request_id;
	}
	public void setRequestid(Long requestid) {
		this.request_id = requestid;
	}
	public String getContactname() {
		return contactname;
	}
	public void setContactname(String contactname) {
		this.contactname = contactname;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTrainingneeds() {
		return trainingneeds;
	}
	public void setTrainingneeds(String trainingneeds) {
		this.trainingneeds = trainingneeds;
	}
	public Long getCityid() {
		return cityid;
	}
	public void setCityid(Long cityid) {
		this.cityid = cityid;
	}
	
	
	

}
