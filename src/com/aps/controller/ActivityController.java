package com.aps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.form.ActivityForm;
import com.aps.form.ActivityNewsForm;
import com.aps.pojo.Activity;
import com.aps.pojo.Unhappen;
import com.aps.service.ActivityService;
import com.aps.util.DateUtil;
import com.aps.util.Token;

@Controller
public class ActivityController {
	@Autowired
	private ActivityService activityServic;
	@RequestMapping("allActivity")
	public String allActivity(String page,ModelMap map){
		int currentPage = Integer.parseInt(page);
		List<Activity> list=activityServic.findAllActivity(currentPage);
		int activatyCount=activityServic.findAllActivityCount();
		int totalPage;
		if(activatyCount%9==0){
			totalPage = activatyCount/9;
		}else{
			totalPage = (activatyCount/9)+1;
		}
		int min;
		int max;
		if(totalPage<3){
			min = 1;
			max =totalPage;
		}
		else if(currentPage<=2){
			min = 1;
			max = 3;
		}
		else if(currentPage>=totalPage-1){
			min = totalPage-2;
			max = totalPage;
		}
		else{
			min = currentPage-1;
			max = currentPage+1;
		}
		List<Unhappen> unhappen=activityServic.findUnhappenActivity();
		map.put("unhappenList", unhappen);
		map.put("min", min);
		map.put("max", max);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalPage);
		map.put("allActivityList", list);
		return "page/allActivity";
	}
	
	@RequestMapping("activityDetail")
	public String activityDetail(String activityId,ModelMap map){
		int aId=Integer.parseInt(activityId);
		Activity ac=activityServic.findActivityById(aId);
		map.put("activity",ac);
		return "page/activityDetail";
	}
	
	@RequestMapping("addActivity")
	public String addActivity(ModelMap map,ActivityForm activityForm){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//获取请求传入的令牌
		String token = request.getParameter(Token.TOKEN);
		//获取session中的原始令牌
		Object serverToken = request.getSession().getAttribute(Token.TOKEN);
		if(serverToken != null && token.equals(serverToken.toString())){
			Unhappen unhappen = new Unhappen();
			unhappen.setTitle(activityForm.getTitle());
			unhappen.setContent(activityForm.getContent());
			unhappen.setHappenTime(DateUtil.parseToDate(activityForm.getDatepicker(), "yyyy-MM-dd"));
			activityServic.addActivity(unhappen);
			request.getSession().removeAttribute(Token.TOKEN);
		}
		map.put("success","添加成功");
		return "page/manage";
	}

	@RequestMapping("attendActivity")
	public String attendActivity(String page,String name,String phone,String unhappenId,ModelMap map){
		int unhappenIdDemo=Integer.parseInt(unhappenId);
		activityServic.attendActivity(name, phone, unhappenIdDemo);
		return allActivity(page, map);
	}
	
	@RequestMapping("addActivityNews")
	public String addActivityNews(ModelMap map,ActivityNewsForm activitynewsForm){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//获取请求传入的令牌
		String token = request.getParameter(Token.TOKEN);
		//获取session中的原始令牌
		Object serverToken = request.getSession().getAttribute(Token.TOKEN);
		if(serverToken != null && token.equals(serverToken.toString())){
			Activity activity = new Activity();
			activity.setActivityName(activitynewsForm.getTitle());
			activity.setContent(activitynewsForm.getContent());
			activityServic.addActivityNews(activity);
			request.getSession().removeAttribute(Token.TOKEN);
		}
		map.put("success","添加成功");
		return "page/manage";
	}
	
	
	
	
}
