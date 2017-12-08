package com.aps.dao;

import java.util.List;

import com.aps.pojo.Donate;

public interface DonateDao {
	/**
	 * 捐款总人数
	 * @return
	 */
	public int findDonatePeopleCount();
	
	/**
	 * 捐款总钱数
	 * @return
	 */
	public double findDonateMoneyCount();
	/**
	 * 展现所有的捐款信息
	 */
	public List<Donate> findAllDonate();
	/**
	 * 新增一个捐款信息
	 */
	public void addDonate(Donate donate);
}
