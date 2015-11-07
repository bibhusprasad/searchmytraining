package com.searchmytraining.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class EmploymentDTO {
	
	@NotEmpty(message="Please select the Type")
	private String employmentType;
	private Integer industrysubcatid;
	@NotEmpty
	@Size(min=4,max=50,message="Length must be atlest 4")
	private String employer;
	@NotEmpty(message="Job Profile may not be empty")
	private String jobProfile;
	private Long userid;
	public String getEmploymentType() {
		return employmentType;
	}
	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}
	public Integer getIndustrysubcatid() {
		return industrysubcatid;
	}
	public void setIndustrysubcatid(Integer industrysubcatid) {
		this.industrysubcatid = industrysubcatid;
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
	
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "EmploymentDTO [employmentType=" + employmentType
				+ ", industrysubcatid=" + industrysubcatid + ", employer="
				+ employer + ", jobProfile=" + jobProfile + ", userid="
				+ userid + "]";
	}
	
}
