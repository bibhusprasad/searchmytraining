package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name="tbl_eduspecmaster")
public class EducationDegreeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="specltnId")
	private Long eduid;
	@Column(name="specltnName")
	@NotEmpty(message="Degree is mandatory")
	private String degree;
	public Long getEduid() {
		return eduid;
	}
	public void setEduid(Long eduid) {
		this.eduid = eduid;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	@Override
	public String toString() {
		return "EducationEntity [eduid=" + eduid + ", degree=" + degree + "]";
	}
}
