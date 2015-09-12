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

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name="tbl_edudetails")
public class EducationEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="eduDetId")
	private Long eduDetId;
	@Column(name="university")
	@NotEmpty(message="University is Mandatory")
	private String university;
	@Column(name="yop", nullable=true)
	private Integer yop;
	@Column(name="degreeOther",nullable=true)
	private String degreeOther;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=EducationDegreeEntity.class)
	@JoinColumn(name="specltnId")
	private EducationDegreeEntity degree;
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	public Long getEduDetId() {
		return eduDetId;
	}
	public void setEduDetId(Long eduDetId) {
		this.eduDetId = eduDetId;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public Integer getYop() {
		return yop;
	}
	public void setYop(Integer yop) {
		this.yop = yop;
	}
	public String getDegreeOther() {
		return degreeOther;
	}
	public void setDegreeOther(String degreeOther) {
		this.degreeOther = degreeOther;
	}
	public EducationDegreeEntity getDegree() {
		return degree;
	}
	public void setDegree(EducationDegreeEntity degree) {
		this.degree = degree;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
}
