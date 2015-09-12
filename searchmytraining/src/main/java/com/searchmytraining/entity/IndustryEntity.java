package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_trnindmaster")
public class IndustryEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="trnIndstrId")
	private Integer trnIndstrId;
	@Column(name="indstrName")
	private String indstrName;
	@Column(name="indstrDescrption")
	private String indstrDescrption;
	public Integer getTrnIndstrId() {
		return trnIndstrId;
	}
	public void setTrnIndstrId(Integer trnIndstrId) {
		this.trnIndstrId = trnIndstrId;
	}
	public String getIndstrName() {
		return indstrName;
	}
	public void setIndstrName(String indstrName) {
		this.indstrName = indstrName;
	}
	public String getIndstrDescrption() {
		return indstrDescrption;
	}
	public void setIndstrDescrption(String indstrDescrption) {
		this.indstrDescrption = indstrDescrption;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
