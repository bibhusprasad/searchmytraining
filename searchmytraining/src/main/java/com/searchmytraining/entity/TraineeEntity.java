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
@Table(name="tbl_traineedetails")
public class TraineeEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="traineeId", nullable=false)
	@GeneratedValue
	private Integer traineeId;
	
	@Column(name="fullName", nullable=false)
	private String fullName;
	
	@Column(name="organizationName")
	private String organizationName;
	
	@Column(name="traineeType", nullable=false)
	private String traineeType;
	
	@Column(name="emailid", nullable=false)
	private String emailid;
	
	@Column(name="phone", nullable=false)
	private String phone;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;

	public Integer getTraineeId() {
		return traineeId;
	}

	public void setTraineeId(Integer traineeId) {
		this.traineeId = traineeId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getTraineeType() {
		return traineeType;
	}

	public void setTraineeType(String traineeType) {
		this.traineeType = traineeType;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		return "TraineeEntity [traineeId=" + traineeId + ", fullName="
				+ fullName + ", organizationName=" + organizationName
				+ ", traineeType=" + traineeType + ", emailid=" + emailid
				+ ", phone=" + phone + ", user=" + user + "]";
	}

	
}
