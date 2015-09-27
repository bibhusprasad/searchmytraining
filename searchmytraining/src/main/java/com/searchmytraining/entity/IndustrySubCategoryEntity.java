package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="tbl_trnsubcatmaster")
public class IndustrySubCategoryEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="trnIndstrSubCatId")
	private Integer trnIndstrSubCatId;
	
	@Column(name="indstrSubCatName")
	private String indstrSubCatName;
	
	@Column(name="indstrSubCatDescrption")
	private String indstrSubCatDescrption;
	
	@ManyToOne(fetch=FetchType.EAGER, targetEntity=IndustryCategoryEntity.class)
	@JoinColumn(name="trnIndstrCatId")
	private IndustryCategoryEntity industrycategory;
	
	public Integer getTrnIndstrSubCatId() {
		return trnIndstrSubCatId;
	}
	public void setTrnIndstrSubCatId(Integer trnIndstrSubCatId) {
		this.trnIndstrSubCatId = trnIndstrSubCatId;
	}
	public String getIndstrSubCatName() {
		return indstrSubCatName;
	}
	public void setIndstrSubCatName(String indstrSubCatName) {
		this.indstrSubCatName = indstrSubCatName;
	}
	public String getIndstrSubCatDescrption() {
		return indstrSubCatDescrption;
	}
	public void setIndstrSubCatDescrption(String indstrSubCatDescrption) {
		this.indstrSubCatDescrption = indstrSubCatDescrption;
	}
	public IndustryCategoryEntity getIndustrycategory() {
		return industrycategory;
	}
	public void setIndustrycategory(IndustryCategoryEntity industrycategory) {
		this.industrycategory = industrycategory;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
