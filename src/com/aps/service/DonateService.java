package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.DonateDao;
import com.aps.pojo.Donate;

@Service
public class DonateService {
	@Autowired
	private DonateDao donateDao;
	public int findDonatePeopleCount(){
		return donateDao.findDonatePeopleCount();
	}
	
	public double findDonateMoneyCount(){
		return donateDao.findDonateMoneyCount();
	}
	
	public List<Donate> findAllDonate(){
		return donateDao.findAllDonate();
	}
	public void addDonate(Donate donate){
		donateDao.addDonate(donate);
	}
}
