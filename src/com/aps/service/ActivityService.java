package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.ActivityDao;
import com.aps.pojo.Activity;
import com.aps.pojo.Unhappen;

@Service
public class ActivityService {
	@Autowired
	private ActivityDao activityDao;
	
	public List<Activity> findAllActivity(int page){
		return activityDao.findAllActivity(page);
	}
	public int findAllActivityCount(){
		return activityDao.findAllActivityCount();
	}
	public Activity findActivityById(int activityId){
		return activityDao.findActivityById(activityId);
	}
	
	public List<Unhappen> findUnhappenActivity(){
		return activityDao.findUnhappenActivity();
	}
	
	/**
	 * 添加活动
	 * @param unhappen
	 */
	public void addActivity(Unhappen unhappen){
		activityDao.addActivity(unhappen);
	}
	/**
	 * 添加活动新闻
	 * @param activity
	 */
	public void addActivityNews(Activity activity){
		activityDao.addActivityNews(activity);
	}

	public void attendActivity(String name,String phone,int unhappenId){
		activityDao.attendActivity(name, phone, unhappenId);
	}

}
