package com.aps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aps.pojo.Variety;
import com.aps.service.VarietyService;

@Controller
public class VarietyController {
	@Autowired
	private VarietyService varietyService;
	
	@RequestMapping("initVariety")
	public String initVariety(String value,ModelMap map){
		if(value.equals("Ã¨")){
			List<Variety> cartVarietyList = varietyService.findAllCartVariety();
			map.put("cartVarietyList", cartVarietyList);
		}
		else if(value.equals("¹·")){
			List<Variety> dogtVarietyList = varietyService.findAllDogVariety();
			map.put("dogtVarietyList", dogtVarietyList);
		}
		else{
			List<Variety> varietyList = varietyService.findAllVariety();
			map.put("varietyList", varietyList);
		}
		map.put("value", value);
		return "page/ajax/variety";
	}
	
	@RequestMapping("manageVariety")
	public String manageVariety(String value,ModelMap map){
		if(value.equals("Ã¨")){
			List<Variety> cartVarietyList = varietyService.findAllCartVariety();
			map.put("cartVarietyList", cartVarietyList);
		}
		else if(value.equals("¹·")){
			List<Variety> dogtVarietyList = varietyService.findAllDogVariety();
			map.put("dogtVarietyList", dogtVarietyList);
		}
		else{
			List<Variety> varietyList = varietyService.findAllVariety();
			map.put("varietyList", varietyList);
		}
		map.put("value", value);
		return "page/ajax/manageVariety";
	}
}
