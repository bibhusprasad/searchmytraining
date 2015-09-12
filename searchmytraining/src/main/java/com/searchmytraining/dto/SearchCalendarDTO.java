package com.searchmytraining.dto;

import java.io.Serializable;

public class SearchCalendarDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer tindustry;
	private Integer industrycatid;
	private Integer industrysubcatid;
	private Integer countryid;
	private Integer stateid;
	private Integer cityid;
	private String fromdate;
	private String todate;
	
	public SearchCalendarDTO()
	{
		this.todate = "2099-12-31";
	}
	public Integer getTindustry() {
		return tindustry;
	}
	public void setTindustry(Integer tindustry) {
		this.tindustry = tindustry;
	}
	public Integer getIndustrycatid() {
		return industrycatid;
	}
	public void setIndustrycatid(Integer industrycatid) {
		this.industrycatid = industrycatid;
	}
	public Integer getIndustrysubcatid() {
		return industrysubcatid;
	}
	public void setIndustrysubcatid(Integer industrysubcatid) {
		this.industrysubcatid = industrysubcatid;
	}
	public Integer getCountryid() {
		return countryid;
	}
	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}
	public Integer getStateid() {
		return stateid;
	}
	public void setStateid(Integer stateid) {
		this.stateid = stateid;
	}
	public Integer getCityid() {
		return cityid;
	}
	public void setCityid(Integer cityid) {
		this.cityid = cityid;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	@Override
	public String toString() {
		return "SearchCalendarDTO [tindustry=" + tindustry + ", industrycatid="
				+ industrycatid + ", industrysubcatid=" + industrysubcatid
				+ ", countryid=" + countryid + ", stateid=" + stateid
				+ ", cityid=" + cityid + ", fromdate=" + fromdate + ", todate="
				+ todate + "]";
	}
}
