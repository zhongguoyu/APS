package com.aps.dao;

import java.util.List;

import com.aps.pojo.Activity;
import com.aps.pojo.Unhappen;

public interface ActivityDao {
	public List<Activity> findAllActivity(int page);
	public int findAllActivityCount();
	public Activity findActivityById(int activityId);
	public List<Unhappen> findUnhappenActivity();
	public void addActivity(Unhappen unhappen);
	public void addActivityNews(Activity activity);
	public void attendActivity(String name,String phone,int unhappenId);

}
