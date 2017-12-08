package com.aps.pojo;

import java.util.Date;

public class Emp {
	private int empId;
	private String empName;
	private String sex;
	private Date hireTime;
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getHireTime() {
		return hireTime;
	}
	public void setHireTime(Date hireTime) {
		this.hireTime = hireTime;
	}
}
