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

@Entity
@Table(name="tbl_trainerregdetails")
public class TrainerEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="trainer_id")
	@GeneratedValue
	private Integer trainerid;
	
	@Column(name="org_name")
	private String org_name;
	
	@Column(name="contact")
	private String contact;
	
	@Column(name="email")
	private String email;
		
	@Column(name="password")
	private String password;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=CityEntity.class)
	@JoinColumn(name="city")
	private CityEntity city;

	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;

	public Integer getTrainerid() {
		return trainerid;
	}

	public void setTrainerid(Integer trainerid) {
		this.trainerid = trainerid;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	
	public CityEntity getCity() {
		return city;
	}

	public void setCity(CityEntity city) {
		this.city = city;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
