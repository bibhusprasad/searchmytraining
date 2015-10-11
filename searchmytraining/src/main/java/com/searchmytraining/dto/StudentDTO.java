package com.searchmytraining.dto;

import java.io.Serializable;


public class StudentDTO implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;
	private int age;
	private String name;

	public StudentDTO() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}