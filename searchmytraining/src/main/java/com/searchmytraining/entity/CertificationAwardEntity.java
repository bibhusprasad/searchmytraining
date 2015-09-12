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
@Table(name="tbl_certificationdetails")
public class CertificationAwardEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="certfctId")
	private Integer certfctId;
	@Column(name="certfctName")
	private String certfctName;
	@ManyToOne(fetch=FetchType.EAGER, targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	public Integer getCertfctId() {
		return certfctId;
	}
	public void setCertfctId(Integer certfctId) {
		this.certfctId = certfctId;
	}
	public String getCertfctName() {
		return certfctName;
	}
	public void setCertfctName(String certfctName) {
		this.certfctName = certfctName;
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
}
