package com.aps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.pojo.Association;
import com.aps.pojo.Message;
import com.aps.pojo.News;
import com.aps.service.AnimalService;
import com.aps.service.AssociationService;
import com.aps.service.MessageService;
import com.aps.service.NewsService;

@Controller
public class InitController {
	@Autowired
	private AnimalService animalService;
	@Autowired
	private AssociationService associationService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("init")
	public String init(ModelMap map){
		int i = animalService.haveAdopt();
		int j = animalService.noAdopt();
		int k = i+j;
		map.put("allCount", k);
		map.put("noCount", j);
		map.put("haveCount",i);
		Association ast = associationService.findNewAssNews();
		List<News> list = newsService.findLastFive();
		String image = "image/newsImages/"+ast.getA_Image();
		String title = ast.getA_Title();
		int id = ast.getA_Id();
		map.put("assImage",image);
		map.put("assTitle",title);
		map.put("assId",id);
		map.put("newList",list);
		return "page/main";
	}
	
	@RequestMapping("introduce")
	public String introduce(){
		return "page/introduce";
	}
	
	@RequestMapping("baseInfo")
	public String baseInfo(){
		return "page/baseInfo";
	}
	
	@RequestMapping("messageSubmit")
	@ResponseBody
	public String messageSubmit(String strangerName,String strangerPhone,String strangerMessage){
		int judgeTodayMessage = messageService.findMessageByPhone(strangerPhone);
		Message message = new Message();
		message.setName(strangerName);
		message.setPhone(strangerPhone);
		message.setContent(strangerMessage);
		
		if(judgeTodayMessage==0){
			messageService.insertNewMessage(message);
			return "留言成功";
		}
		else{
			return "用户一天只能留言一次";
		}
		
		
	}
	
	
}
