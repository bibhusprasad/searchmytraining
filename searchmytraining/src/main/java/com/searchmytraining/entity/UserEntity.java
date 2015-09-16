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
	private boolean enabled;
	
	@Column(name="accountNonExpired")
	private boolean accountNonExpired;
	
	@Column(name="accountNonLocked")
	private boolean accountNonLocked;
	
	@Column(name="credentialsNonExpired")
	private boolean credentialsNonExpired;
	
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
	private boolean emailVerified;
	
	@Column(name="uuid")
	private String uuid;
	
	public boolean isEmailVerified() {
		return emailVerified;
	}
	public void setEmailVerified(boolean emailVerified) {
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
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}
	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}
	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	public void setPassword(String password) {
		this.password = password;
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
