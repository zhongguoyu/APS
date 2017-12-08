package com.aps.controller;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.pojo.Apply;
import com.aps.service.ApplyService;
import com.aps.util.Token;
import com.aps.form.ApplyForm;
import com.aps.pojo.Animal;
import com.aps.service.AnimalService;
import com.aps.service.ApplyService;


@Controller
public class ApplyController {

	@Autowired
	private ApplyService applyservice;
	@Autowired
	private AnimalService animalservice;
	
	@RequestMapping("goLoveAdopt")
	public String goLoveAdopt(String animalId,ModelMap map){
		map.put("animalId", animalId);
		return "page/loveAdopt";
	}
	@RequestMapping("goApplyAdopt")
	public String goApplyAdopt(String animalId,ModelMap map){
		map.put("animalId", animalId);
		return "page/applyAdopt";
	}
	@ResponseBody
	@RequestMapping("checkTel")
	public String findAdoptByTel(String applyPhone){
		Apply apply = applyservice.findAdoptByTel(applyPhone);
		if(apply != null){
			return "error";
		}
		return "success";
	}
	@RequestMapping("addApplyAdopt")
	public String addApplyAdopt(ApplyForm applyForm){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//获取请求传入的令牌
		String token = request.getParameter(Token.TOKEN);
		//获取session中的原始令牌
		Object serverToken = request.getSession().getAttribute(Token.TOKEN);
		if(serverToken != null && token.equals(serverToken.toString())){
			Apply apply = new Apply();
			apply.setApplyName(applyForm.getApplyName());
			apply.setAnimalId(Integer.parseInt(applyForm.getAnimalId()));
			apply.setApplyPhone(applyForm.getApplyPhone());
			apply.setApplyReason(applyForm.getApplyReason());
			apply.setAddress(applyForm.getAddress());
			applyservice.addApplyAdopt(apply);
			request.getSession().removeAttribute(Token.TOKEN);
		}
		return "page/skip";
	}
	

	/**
	 * 跳转到领养窗口
	 */
	@RequestMapping("adoptView")
	public String skipToAdoptView(ModelMap map){
		Date nowDate = applyservice.findNowDate();
		List<Animal> dogList = animalservice.findDogByRule();
		List<Animal> catList = animalservice.findCatByRule();

		List<String> dogVarietyList = new ArrayList<>();
		List<String> catVarietyList = new ArrayList<>();
		for(Animal a : dogList){
			String dName = animalservice.findAnimalVarietyById(a.getAnimalId());
			dogVarietyList.add(dName);
		}
		for(Animal a : catList){
			String cName = animalservice.findAnimalVarietyById(a.getAnimalId());
			catVarietyList.add(cName);
		}
		
		List<Animal> sixDogList = new ArrayList<>();
		List<Animal> sixCatList = new ArrayList<>();
		
		sixDogList = animalservice.findSixDog();
		sixCatList = animalservice.findSixCat();
		
		List<Animal> hoaList = new ArrayList<>();
		hoaList = animalservice.findHaveOwnerAnimal();
		
		map.put("hoaList", hoaList);
		map.put("sixDogList", sixDogList);
		map.put("sixCatList", sixCatList);
		map.put("dogListLength", dogList.size());
		map.put("catListLength", catList.size());
		map.put("dogVarietyList", dogVarietyList);
		map.put("catVarietyList", catVarietyList);
		map.put("dogList", dogList);
		map.put("catList", catList);
		map.put("nowDate", nowDate);
		return "page/adoptView";
	}
}
