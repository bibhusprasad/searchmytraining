package com.searchmytraining.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadItem {
	private CommonsMultipartFile fileData;
	private String ctitle;
	private String Fdate;
	private String Tdate ;
	private String Ctype ;
	private String cPrice ;
	private String CDesc ;
	private String Ckey ;
	/*private String file ;*/
	private String userid;
	
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getFdate() {
		return Fdate;
	}
	public void setFdate(String fdate) {
		Fdate = fdate;
	}
	public String getTdate() {
		return Tdate;
	}
	public void setTdate(String tdate) {
		Tdate = tdate;
	}
	public String getCtype() {
		return Ctype;
	}
	public void setCtype(String ctype) {
		Ctype = ctype;
	}
	public String getcPrice() {
		return cPrice;
	}
	public void setcPrice(String cPrice) {
		this.cPrice = cPrice;
	}
	public String getCDesc() {
		return CDesc;
	}
	public void setCDesc(String cDesc) {
		CDesc = cDesc;
	}
	public String getCkey() {
		return Ckey;
	}
	public void setCkey(String ckey) {
		Ckey = ckey;
	}
	/*public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}*/
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
