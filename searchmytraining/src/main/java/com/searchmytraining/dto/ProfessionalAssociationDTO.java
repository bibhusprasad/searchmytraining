package com.searchmytraining.dto;

import java.util.ArrayList;

public class ProfessionalAssociationDTO {
	
	private Integer userid;
	private ArrayList<String> assocName;
	private ArrayList<Integer> assocIds;
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public ArrayList<String> getAssocName() {
		return assocName;
	}
	public void setAssocName(ArrayList<String> assocName) {
		this.assocName = assocName;
	}
	public ArrayList<Integer> getAssocIds() {
		return assocIds;
	}
	public void setAssocIds(ArrayList<Integer> assocIds) {
		this.assocIds = assocIds;
	}
	@Override
	public String toString() {
		return "ProfessionalAssociationDTO [userid=" + userid + ", assocName="
				+ assocName + "]";
	}
}
