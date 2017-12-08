package com.aps.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.ApplyDao;
import com.aps.pojo.Apply;

@Service
public class ApplyService {
	@Autowired
	private ApplyDao applyDao;
	
	public List<Apply> findAllApply(){
		return applyDao.findAllApply();
	}
	
	public Apply findAdoptByTel(String applyPhone){
		return applyDao.findAdoptByTel(applyPhone);
	}

	public void addApplyAdopt(Apply apply){
		applyDao.addApplyAdopt(apply);
	}

	
	/**
	 * 查找今年本月时间
	 */
	public Date findNowDate(){
		return applyDao.findNowDate();
	}
	
	
}
