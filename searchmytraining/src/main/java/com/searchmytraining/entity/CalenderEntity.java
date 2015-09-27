package com.searchmytraining.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name = "tbl_trngcalender")
public class CalenderEntity implements Serializable {
	private static final long serialVersionUID = 15456654646L;

	@Id
	@GeneratedValue
	@Column(name = "trngId")
	private Integer trngId;

	@Column(name = "code")
	private String code;

	@Column(name = "title")
	private String title;

	@Column(name = "start_date")
	private String start_date;

	@Column(name = "end_date")
	private String end_date;

	@Column(name = "price")
	private Double price;

	@Column(name = "brochure")
	private String brochure;

	@Column(name = "type")
	private String type;

	@Column(name = "status")
	private String status;

	@Column(name = "createdOn")
	private Timestamp createdOn;

	@Column(name = "createdBy")
	private String createdBy;

	@Column(name = "updatedOn")
	private Timestamp updatedOn;

	@Column(name = "updatedBy")
	private String updatedBy;

	@Column(name = "description")
	private String description;

	@Column(name = "contenttype")
	private String contenttype;

	@Column(name = "rank")
	private Integer rank;

	@Column(name = "vFlag")
	private String vFlag;

	@Column(name = "keyword")
	private String keyword;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = UserEntity.class)
	@JoinColumn(name = "userId")
	private UserEntity user;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = IndustrySubCategoryEntity.class)
	@JoinColumn(name = "trnIndstrSubCatId")
	private IndustrySubCategoryEntity indstrySubcat;
	
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = InstituteAddress.class)
	@JoinColumn(name = "paId")
	private InstituteAddress instituteAddress;

	
	@OneToOne(fetch = FetchType.EAGER, targetEntity = TrainingOverview.class)
	@JoinColumn(name = "overviewId")
	private TrainingOverview trainingOverview;

	
	@OneToOne(fetch = FetchType.EAGER, targetEntity = TrainerInstituteOverview.class)
	@JoinColumn(name = "trngoverviewId")
	private TrainerInstituteOverview trainerInstituteOverview;

	public Integer getTrngId() {
		return trngId;
	}

	public void setTrngId(Integer trngId) {
		this.trngId = trngId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getBrochure() {
		return brochure;
	}

	public void setBrochure(String brochure) {
		this.brochure = brochure;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getvFlag() {
		return vFlag;
	}

	public void setvFlag(String vFlag) {
		this.vFlag = vFlag;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public IndustrySubCategoryEntity getIndstrySubcat() {
		return indstrySubcat;
	}

	public void setIndstrySubcat(IndustrySubCategoryEntity indstrySubcat) {
		this.indstrySubcat = indstrySubcat;
	}

}
