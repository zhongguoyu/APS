package com.aps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aps.pojo.User;
import com.aps.service.UserService;

@SessionAttributes("loginUser")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("login")
	public String login(String userName,String password,ModelMap map){
		User user = userService.findUserByName(userName);		
		if(user != null){
			if(user.getPwd().equals(password)){
				map.put("loginUser", user);
				return "page/manage";
			}else{
				map.put("pwderror", "密码错误");
				return"../login";
			}
		}
		else{
			map.put("usernameerror", "用户名不存在");
			return"../login";
		}
	}
	
}
