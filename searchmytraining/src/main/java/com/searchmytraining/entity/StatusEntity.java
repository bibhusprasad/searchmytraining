package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_statusmaster")
public class StatusEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="statusId")
	private Integer statusId;
	
	@Column(name="statusCode")
	private String statusCode;
	
	@Column(name="stsDescription")
	private String stsDescription;
	
	@Column(name="name")
	private String name;

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStsDescription() {
		return stsDescription;
	}

	public void setStsDescription(String stsDescription) {
		this.stsDescription = stsDescription;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
}