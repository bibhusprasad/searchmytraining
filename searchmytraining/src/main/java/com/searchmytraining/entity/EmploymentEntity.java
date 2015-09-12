package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_employmentdetails")
public class EmploymentEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="emplmntId")
	private Integer emplmntId;
	@Column(name="employmentType")
	private String employmentType;
	@Column(name="employer")
	private String employer;
	@Column(name="jobProfile")
	private String jobProfile;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	
	@ManyToOne(fetch=FetchType.EAGER, targetEntity=IndustrySubCategoryEntity.class)
	@JoinColumn(name="indusrysubid")
	private IndustrySubCategoryEntity indsubcat;

	public Integer getEmplmntId() {
		return emplmntId;
	}

	public void setEmplmntId(Integer emplmntId) {
		this.emplmntId = emplmntId;
	}

	public String getEmploymentType() {
		return employmentType;
	}

	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}

	public String getEmployer() {
		return employer;
	}

	public void setEmployer(String employer) {
		this.employer = employer;
	}

	public String getJobProfile() {
		return jobProfile;
	}

	public void setJobProfile(String jobProfile) {
		this.jobProfile = jobProfile;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public IndustrySubCategoryEntity getIndsubcat() {
		return indsubcat;
	}

	public void setIndsubcat(IndustrySubCategoryEntity indsubcat) {
		this.indsubcat = indsubcat;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
