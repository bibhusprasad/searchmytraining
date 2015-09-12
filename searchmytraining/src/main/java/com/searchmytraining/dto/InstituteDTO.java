package com.searchmytraining.dto;

import java.util.ArrayList;


public class InstituteDTO {
	
	private String companyName;
	private Integer yrofEstablmnt;
	private String trngMethodology;
	private String hrsOfOpertn;
	private String history;
	private ArrayList<String> workingDays;
	private Integer userid;
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getYrofEstablmnt() {
		return yrofEstablmnt;
	}
	public void setYrofEstablmnt(Integer yrofEstablmnt) {
		this.yrofEstablmnt = yrofEstablmnt;
	}
	public String getTrngMethodology() {
		return trngMethodology;
	}
	public void setTrngMethodology(String trngMethodology) {
		this.trngMethodology = trngMethodology;
	}
	public String getHrsOfOpertn() {
		return hrsOfOpertn;
	}
	public void setHrsOfOpertn(String hrsOfOpertn) {
		this.hrsOfOpertn = hrsOfOpertn;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public ArrayList<String> getWorkingDays() {
		return workingDays;
	}
	public void setWorkingDays(ArrayList<String> workingDays) {
		this.workingDays = workingDays;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
}
