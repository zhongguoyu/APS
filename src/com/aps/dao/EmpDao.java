package com.aps.dao;

import com.aps.pojo.Emp;

public interface EmpDao {

	public Emp findEmpByName(String empName);
	public void changFlag(int flag,int applyid);
	public void changFlag2(int flag,int volunteerId);
	public void changFlag3(int animalId);
}
