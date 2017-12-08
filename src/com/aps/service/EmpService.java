package com.aps.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.EmpDao;
import com.aps.pojo.Emp;

@Service
public class EmpService {
	@Autowired
	private EmpDao empDao;
	public Emp findEmpByName(String empName){
		return empDao.findEmpByName(empName);
	}
	
	public void changFlag(int flag,int applyid){
		empDao.changFlag(flag, applyid);
	}
	
	public void changFlag2(int flag,int volunteerId){
		empDao.changFlag2(flag,volunteerId);
	}
	public void changFlag3(int animalId){
		empDao.changFlag3(animalId);
	}
}
