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
@Scope(value="prototype")
@Entity
@Table(name="tbl_keyclients")
public class ClientEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="keyClientId")
	private Integer keyClientId;
	@Column(name="clientName")
	private String clientName;
	
	@ManyToOne(fetch=FetchType.EAGER, targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=InstituteSearchEntity.class)
	@JoinColumn(name="searchId")
	private InstituteSearchEntity instituteDetails;

	public InstituteSearchEntity getInstituteDetails() {
		return instituteDetails;
	}
	public void setInstituteDetails(InstituteSearchEntity instituteDetails) {
		this.instituteDetails = instituteDetails;
	}
	public Integer getKeyClientId() {
		return keyClientId;
	}
	public void setKeyClientId(Integer keyClientId) {
		this.keyClientId = keyClientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
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
