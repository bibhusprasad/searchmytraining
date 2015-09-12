package com.searchmytraining.entity;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class ChartEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private String label;
	private double y;
	
	public ChartEntity() {
		super();
	}

	public ChartEntity(String label, double y) {
		super();
		this.label = label;
		this.y = y;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}
	
}
