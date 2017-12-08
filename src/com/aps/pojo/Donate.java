package com.aps.pojo;

import java.util.Date;

public class Donate {
	private int donateId;
	private double donateMoney;
	private String donateName;
	private String donateImage;
	private String email;
	private String phone;
	private String message;
	private Date donateDate;
	
	public int getDonateId() {
		return donateId;
	}
	public void setDonateId(int donateId) {
		this.donateId = donateId;
	}
	public double getDonateMoney() {
		return donateMoney;
	}
	public void setDonateMoney(double donateMoney) {
		this.donateMoney = donateMoney;
	}
	public String getDonateName() {
		return donateName;
	}
	public void setDonateName(String donateName) {
		this.donateName = donateName;
	}
	public String getDonateImage() {
		return donateImage;
	}
	public void setDonateImage(String donateImage) {
		this.donateImage = donateImage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDonateDate() {
		return donateDate;
	}
	public void setDonateDate(Date donateDate) {
		this.donateDate = donateDate;
	}
	
}
