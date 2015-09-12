package com.searchmytraining.dto;

import java.util.ArrayList;
import java.util.List;

public class ClientDetailsDTO {
	
	private Integer userid;
	private List<String> clientName;
	private List<Integer> clientIds;
	public List<String> getClientName() {
		return clientName;
	}
	public void setClientName(ArrayList<String> clientName) {
		this.clientName = clientName;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public List<Integer> getClientIds() {
		return clientIds;
	}
	public void setClientIds(List<Integer> clientIds) {
		this.clientIds = clientIds;
	}
	@Override
	public String toString() {
		return "ClientDetailsDTO [userid=" + userid + ", clientName="
				+ clientName + ", clientIds=" + clientIds + "]";
	}
}
