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
@Table(name="tbl_contactinfomaster")
public class ContactInfoEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="contctinfoId")
	private Integer	contctinfoId;
	@Column(name="emailId")
	private String emailId;
	@Column(name="website")
	private String website;
	@Column(name="cntcPersName")
	private String cntcPersName;	
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;

	public Integer getContctinfoId() {
		return contctinfoId;
	}
	public void setContctinfoId(Integer contctinfoId) {
		this.contctinfoId = contctinfoId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCntcPersName() {
		return cntcPersName;
	}
	public void setCntcPersName(String cntcPersName) {
		this.cntcPersName = cntcPersName;
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
	@Override
	public String toString() {
		return "ContactInfoEntity [contctinfoId=" + contctinfoId + ", emailId="
				+ emailId + ", website=" + website + ", cntcPersName="
				+ cntcPersName + ", user=" + user + "]";
	}
}
