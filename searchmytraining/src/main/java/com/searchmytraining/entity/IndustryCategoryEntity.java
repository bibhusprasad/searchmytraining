package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_trnindcatmaster")
public class IndustryCategoryEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="trnIndstrCatId")
	private Integer trnIndstrCatId;
	@Column(name="indstrCatName")
	private String indstrCatName;
	@Column(name="indstrCatDescrption")
	private String indstrCatDescrption;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=IndustryEntity.class)
	@JoinColumn(name="trnIndstrId",nullable=false)
	private IndustryEntity industry;

	public Integer getTrnIndstrCatId() {
		return trnIndstrCatId;
	}
	public void setTrnIndstrCatId(Integer trnIndstrCatId) {
		this.trnIndstrCatId = trnIndstrCatId;
	}
	public String getIndstrCatName() {
		return indstrCatName;
	}
	public void setIndstrCatName(String indstrCatName) {
		this.indstrCatName = indstrCatName;
	}
	public String getIndstrCatDescrption() {
		return indstrCatDescrption;
	}
	public void setIndstrCatDescrption(String indstrCatDescrption) {
		this.indstrCatDescrption = indstrCatDescrption;
	}
	public IndustryEntity getIndustry() {
		return industry;
	}
	public void setIndustry(IndustryEntity industry) {
		this.industry = industry;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
