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
@Table(name="tbl_trangcatdetails")
public class TrainingCategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="trngcatid")
	private Long catId;
	@Column(name="exp")
	private Integer exp;
	@ManyToOne(fetch = FetchType.EAGER, targetEntity=IndustrySubCategoryEntity.class)
	@JoinColumn(name="subcatid")
	private IndustrySubCategoryEntity subcatentity;
	@ManyToOne(fetch = FetchType.EAGER, targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	public Long getCatId() {
		return catId;
	}
	public void setCatId(Long catId) {
		this.catId = catId;
	}
	public Integer getExp() {
		return exp;
	}
	public void setExp(Integer exp) {
		this.exp = exp;
	}
	public IndustrySubCategoryEntity getSubcatentity() {
		return subcatentity;
	}
	public void setSubcatentity(IndustrySubCategoryEntity subcatentity) {
		this.subcatentity = subcatentity;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "TrainingCategoryEntity [catId=" + catId + ", exp=" + exp
				+ ", subcatentity=" + subcatentity + ", user=" + user + "]";
	}
}
