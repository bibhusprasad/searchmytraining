package com.searchmytraining.entity;

import java.io.Serializable;

public class TrainingEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	public TrainingEntity(String title, String keyWords, String description,
			String contentType, long priority) {
		super();
		this.title = title;
		this.keyWords = keyWords;
		this.description = description;
		this.contentType = contentType;
		this.priority = priority;
	}
	private String title;
	private String keyWords;
	private String description;
	private String contentType;
	private long priority;
	
	public long getPriority() {
		return priority;
	}
	public void setPriority(long priority) {
		this.priority = priority;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	

}
