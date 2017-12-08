package com.aps.pojo;

import java.util.Date;

public class Unhappen {
	private int unhappenId;
	private String title;
	private Date happenTime;
	private String content;
	public int getUnhappenId() {
		return unhappenId;
	}
	public void setUnhappenId(int unhappenId) {
		this.unhappenId = unhappenId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getHappenTime() {
		return happenTime;
	}
	public void setHappenTime(Date happenTime) {
		this.happenTime = happenTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
