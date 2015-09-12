package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name="tbl_instprofiledetails")
public class InstituteEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="compInfoId")
	private Integer compInfoId;
	
	@Column(name="companyName")
	private String companyName;
	
	@Column(name="yrofEstablmnt")
	private Integer yrofEstablmnt;
	
	@Column(name="historyOfCompany")
	private String historyOfCompany;
	
	@Column(name="hrsOfOpertn")
	private String hrsOfOpertn;
	
	@Column(name="workingDays")
	private String workingDays;
	
	@Column(name="trngMethodology")
	private String trngMethodology;
	
	@Column(name="institutelogo")
	private byte [] institutelogo;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;

	public Integer getCompInfoId() {
		return compInfoId;
	}
	public void setCompInfoId(Integer compInfoId) {
		this.compInfoId = compInfoId;
	}
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
	public String getHistoryOfCompany() {
		return historyOfCompany;
	}
	public void setHistoryOfCompany(String historyOfCompany) {
		this.historyOfCompany = historyOfCompany;
	}
	public String getHrsOfOpertn() {
		return hrsOfOpertn;
	}
	public void setHrsOfOpertn(String hrsOfOpertn) {
		this.hrsOfOpertn = hrsOfOpertn;
	}
	public String getWorkingDays() {
		return workingDays;
	}
	public void setWorkingDays(String workingDays) {
		this.workingDays = workingDays;
	}
	public String getTrngMethodology() {
		return trngMethodology;
	}
	public void setTrngMethodology(String trngMethodology) {
		this.trngMethodology = trngMethodology;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public byte[] getInstitutelogo() {
		return institutelogo;
	}
	public void setInstitutelogo(byte[] institutelogo) {
		this.institutelogo = institutelogo;
	}
}
