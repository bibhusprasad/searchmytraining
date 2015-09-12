package com.searchmytraining.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name="tbl_instituesearch")
public class InstituteSearchEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="searchId")
	private Long searchId;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=InstituteEntity.class)
	@JoinColumn(name="instProfId")
	private InstituteEntity instituteprofile;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=LocationEntity.class)
	@JoinColumn(name="locId")
	private LocationEntity location;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=ContactInfoEntity.class)
	@JoinColumn(name="contactInfoId")
	private ContactInfoEntity contactinfo;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="instituteDetails",targetEntity=PhoneEntity.class)
	private Set<PhoneEntity> phones;

	@OneToMany(fetch=FetchType.EAGER,mappedBy="instituteDetails",targetEntity=ProfessionalAssociationEntity.class)
	private Set<ProfessionalAssociationEntity> profassoc;
	
	@OneToMany(fetch=FetchType.EAGER,targetEntity=ClientEntity.class,mappedBy="instituteDetails")
	private Set<ClientEntity> clients;
	
	public Set<ClientEntity> getClients() {
		return clients;
	}
	public void setClients(Set<ClientEntity> clients) {
		this.clients = clients;
	}
	public Set<PhoneEntity> getPhones() {
		return phones;
	}
	public void setPhones(Set<PhoneEntity> phones) {
		this.phones = phones;
	}
	public Set<ProfessionalAssociationEntity> getProfassoc() {
		return profassoc;
	}
	public void setProfassoc(Set<ProfessionalAssociationEntity> profassoc) {
		this.profassoc = profassoc;
	}
	public Long getSearchId() {
		return searchId;
	}
	public void setSearchId(Long searchId) {
		this.searchId = searchId;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public InstituteEntity getInstituteprofile() {
		return instituteprofile;
	}
	public void setInstituteprofile(InstituteEntity instituteprofile) {
		this.instituteprofile = instituteprofile;
	}
	public LocationEntity getLocation() {
		return location;
	}
	public void setLocation(LocationEntity location) {
		this.location = location;
	}
	public ContactInfoEntity getContactinfo() {
		return contactinfo;
	}
	public void setContactinfo(ContactInfoEntity contactinfo) {
		this.contactinfo = contactinfo;
	}
}
