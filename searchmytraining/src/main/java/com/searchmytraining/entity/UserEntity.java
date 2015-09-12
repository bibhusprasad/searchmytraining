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
@Table(name="users")
public class UserEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="userId")
	@GeneratedValue
	private Integer userId;
	
	@Column(name="username")
	private String userName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="enabled")
	private Integer enabled;
	
	@Column(name="accountNonExpired")
	private Integer accountNonExpired;
	
	@Column(name="accountNonLocked")
	private Integer accountNonLocked;
	
	@Column(name="credentialsNonExpired")
	private Integer credentialsNonExpired;
	
	@Column(name="created_on")
	private String created_On;
	
	@Column(name="created_by")
	private String created_By="SELF";
	
	@Column(name="Modified_on")
	private String modified_On;
	
	@Column(name="Modified_by")
	private String modified_By="SELF";
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=StatusEntity.class)
	@JoinColumn(name="statusId")
	private StatusEntity status;
	
	@Column(name="emailVerified")
	private Integer emailVerified;
	
	@Column(name="uuid")
	private String uuid;
	
	public Integer getEmailVerified() {
		return emailVerified;
	}
	public void setEmailVerified(Integer emailVerified) {
		this.emailVerified = emailVerified;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public Integer getUserId() {
		return userId;
	}
	public StatusEntity getStatus() {
		return status;
	}
	public void setStatus(StatusEntity status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public Integer getAccountNonExpired() {
		return accountNonExpired;
	}
	public void setAccountNonExpired(Integer accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	public Integer getAccountNonLocked() {
		return accountNonLocked;
	}
	public void setAccountNonLocked(Integer accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	public Integer getCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	public void setCredentialsNonExpired(Integer credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	public String getCreated_On() {
		return created_On;
	}
	public void setCreated_On(String created_On) {
		this.created_On = created_On;
	}
	public String getCreated_By() {
		return created_By;
	}
	public void setCreated_By(String created_By) {
		this.created_By = created_By;
	}
	public String getModified_On() {
		return modified_On;
	}
	public void setModified_On(String modified_On) {
		this.modified_On = modified_On;
	}
	public String getModified_By() {
		return modified_By;
	}
	public void setModified_By(String modified_By) {
		this.modified_By = modified_By;
	}
}
