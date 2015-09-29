package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name = "tbl_trngoverview")
public class TrainingOverviewEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -484122994834705029L;

	@Id
	@GeneratedValue
	@Column(name = "overviewId")
	private Integer overviewId;
	
	@Column(name = "trngQuickView")
	private String trngQuickView;
	
	@Column(name = "trngOverView")
	private String trngOverView;
	
	@Column(name = "trngTakeAway")
	private String trngTakeAway;
	
	@Column(name = "trngMethodology")
	private String trngMethodology;
	
	@Column(name = "trngAttandant")
	private String trngAttandant;
	
	@Column(name = "trngKey")
	private String trngKey;

	public Integer getOverviewId() {
		return overviewId;
	}

	public void setOverviewId(Integer overviewId) {
		this.overviewId = overviewId;
	}

	public String getTrngQuickView() {
		return trngQuickView;
	}

	public void setTrngQuickView(String trngQuickView) {
		this.trngQuickView = trngQuickView;
	}

	public String getTrngOverView() {
		return trngOverView;
	}

	public void setTrngOverView(String trngOverView) {
		this.trngOverView = trngOverView;
	}

	public String getTrngTakeAway() {
		return trngTakeAway;
	}

	public void setTrngTakeAway(String trngTakeAway) {
		this.trngTakeAway = trngTakeAway;
	}

	public String getTrngMethodology() {
		return trngMethodology;
	}

	public void setTrngMethodology(String trngMethodology) {
		this.trngMethodology = trngMethodology;
	}

	public String getTrngAttandant() {
		return trngAttandant;
	}

	public void setTrngAttandant(String trngAttandant) {
		this.trngAttandant = trngAttandant;
	}

	public String getTrngKey() {
		return trngKey;
	}

	public void setTrngKey(String trngKey) {
		this.trngKey = trngKey;
	}
	
}
