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


@Table(name = "tbl_trngenquiry")
@Entity
public class TrainingEnquiryEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long trngenqId;
	@Column(name="name", nullable=false)
	private String name;
	@Column(name="companyName")
	private String companyName;
	@Column(name="courseTitle", nullable=false)
	private String coursetitle;
	@Column(name="email", nullable=false)
	private String email;
	@Column(name="phone", nullable=false)
	private String phone;
	@Column(name="trngNeed")
	private String trngneeds;
	@Column(name="noOfParticipents")
	private Integer noOfParticipents;
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=CityEntity.class)
	@JoinColumn(name="cityId")
	private CityEntity city;
	public Long getTrngenqId() {
		return trngenqId;
	}
	public void setTrngenqId(Long trngenqId) {
		this.trngenqId = trngenqId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCoursetitle() {
		return coursetitle;
	}
	public void setCoursetitle(String coursetitle) {
		this.coursetitle = coursetitle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTrngneeds() {
		return trngneeds;
	}
	public void setTrngneeds(String trngneeds) {
		this.trngneeds = trngneeds;
	}
	public Integer getNoOfParticipents() {
		return noOfParticipents;
	}
	public void setNoOfParticipents(Integer noOfParticipents) {
		this.noOfParticipents = noOfParticipents;
	}
	public CityEntity getCity() {
		return city;
	}
	public void setCity(CityEntity city) {
		this.city = city;
	}
}