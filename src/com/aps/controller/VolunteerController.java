package com.aps.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.form.VolunteerForm;
import com.aps.pojo.Volunteer;
import com.aps.service.VolunteerService;
import com.aps.util.DateUtil;
import com.aps.util.Token;

@Controller
public class VolunteerController {
	
	@Autowired
	private VolunteerService volunteerService;
	
	@RequestMapping("volunteer")
	public String volunteer(){
		return "page/volunteer";
	}
	
	@RequestMapping("skip")
	public String skip(VolunteerForm volunteerFrom){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//获取请求传入的令牌
		String token = request.getParameter(Token.TOKEN);
		//获取session中的原始令牌
		Object serverToken = request.getSession().getAttribute(Token.TOKEN);
		if(serverToken != null && token.equals(serverToken.toString())){
			Volunteer v = new Volunteer();
			v.setVolunteerName(volunteerFrom.getName());
			Date birthday = DateUtil.parseToDate(volunteerFrom.getDatepicker(),"yyyy-MM-dd");
			v.setBirthday(birthday);
			v.setSex(volunteerFrom.getSex());
			v.setPhone(volunteerFrom.getPhone());
			v.setEmail(volunteerFrom.getEmail());
			v.setAddress(volunteerFrom.getAddress());
			v.setEducation(volunteerFrom.getEducation());
			v.setExceptWork(volunteerFrom.getExceptWork());
			volunteerService.addVolunteer(v);
			request.getSession().removeAttribute(Token.TOKEN);
		}
		return "page/skip";
	}

	@ResponseBody
	@RequestMapping("checkphone")
	public String checkphone(String phone,ModelMap map){
		Volunteer v = volunteerService.findVolunteerByPhone(phone);
		if(v!=null){
			return "error";
		}
		return "suceess";
	}
}
