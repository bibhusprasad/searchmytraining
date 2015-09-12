package com.searchmytraining.dto;

public class EducationDTO {
	
	private Long degreeid;
	private String degreeOther;
	private String university;
	private Integer yop;
	public Long getDegreeid() {
		return degreeid;
	}
	public void setDegreeid(Long degreeid) {
		this.degreeid = degreeid;
	}
	public String getDegreeOther() {
		return degreeOther;
	}
	public void setDegreeOther(String degreeOther) {
		this.degreeOther = degreeOther;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public Integer getYop() {
		return yop;
	}
	public void setYop(Integer yop) {
		this.yop = yop;
	}
	@Override
	public String toString() {
		return "EducationDTO [degreeid=" + degreeid
				+ ", degreeOther=" + degreeOther + ", university=" + university
				+ ", yop=" + yop + "]";
	}
}
