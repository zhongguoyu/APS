package com.aps.dao;

import java.util.Date;
import java.util.List;

import com.aps.pojo.Apply;

public interface ApplyDao {

	public List<Apply> findAllApply();
	/**
	 * 根据手机号码查询记录
	 */
	public Apply findAdoptByTel(String applyPhone);

	
	/**
	 * 增加领养申请
	 */
	public void addApplyAdopt(Apply apply);

	
	/**
	 * 查询数据库当前时间
	 */
	public Date findNowDate();
	

}
