package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_phonetypemaster")
public class PhoneTypeEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="phnTypeId")
	private Integer phnTypeId;
	@Column(name="phnTypeName")
	private String phnTypeName;
	public Integer getPhnTypeId() {
		return phnTypeId;
	}
	public void setPhnTypeId(Integer phnTypeId) {
		this.phnTypeId = phnTypeId;
	}
	public String getPhnTypeName() {
		return phnTypeName;
	}
	public void setPhnTypeName(String phnTypeName) {
		this.phnTypeName = phnTypeName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
