package com.searchmytraining.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class TrainingOverviewDTO {

	@NotEmpty(message="Please enter a valid Quick View")
	@Size(min=10, max=1000,message="Quick View length Must be between {min} to {max}")
	private String trngQuickView;
	
	@NotEmpty(message="Please enter a valid Training Overview")
	@Size(min=10, max=2000,message="Training Overview length Must be between {min} to {max}")
	private String trngOverView;
	
	@NotEmpty(message="Please enter a Description For training")
	@Size(min=10, max=1000,message="Description For training Must be between {min} to {max}")
	private String trngTakeAway;
	
	@NotEmpty(message="Please enter a Description For training Methodology")
	@Size(min=10, max=1000,message="training Methodology Must be between {min} to {max}")
	private String trngMethodology;
	
	@NotEmpty(message="Please enter a Description For training Attandant")
	@Size(min=10, max=500,message="training Attandant Must be between {min} to {max}")
	private String trngAttandant;
	
	@NotEmpty(message="Please enter a valid Key")
	@Size(min=2, max=200,message="valid Keylength must be between {min} to {max}")
	private String trngKey;
	
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
