package com.aps.pojo;

import java.util.Date;

public class Association {
	private int a_Id;
	private String a_Title;
	private Date a_Time;
	private String a_Image;
	private String a_content;
	private int rid;
	
	public int getA_Id() {
		return a_Id;
	}
	public void setA_Id(int a_Id) {
		this.a_Id = a_Id;
	}
	public String getA_Title() {
		return a_Title;
	}
	public void setA_Title(String a_Title) {
		this.a_Title = a_Title;
	}
	public Date getA_Time() {
		return a_Time;
	}
	public void setA_Time(Date a_Time) {
		this.a_Time = a_Time;
	}
	public String getA_Image() {
		return a_Image;
	}
	public void setA_Image(String a_Image) {
		this.a_Image = a_Image;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	
}
