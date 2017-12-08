package com.aps.controller;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aps.service.AssociationService;

import com.aps.pojo.Association;
import com.aps.service.AssociationService;


@Controller
public class AssociationController {

	@Autowired
	private AssociationService asService;
	
	@RequestMapping("allAssociation")
	public String allAssociation(String page,ModelMap map){
		int currentPage = Integer.parseInt(page);
		List<Association> list = asService.findAllAssociation(currentPage);
		int asCount = asService.findAllAssociationCount();
		int totalPage;
		if(asCount%5==0){
			totalPage = asCount/5;
		}
		else{
			totalPage = asCount/5 + 1;
		}
		int min;
		int max;
		if(totalPage<3){
			min = 1;
			max = totalPage;
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
			min = currentPage - 1;
			max = currentPage + 1;
		}
		
		map.put("min", min);
		map.put("max", max);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalPage);
		map.put("associationList", list);
		
		return "page/associationNews";
	}
	
	@RequestMapping("detailAssociationNews")
	public String detailAssociationNews(String a_Id,ModelMap map){
		int aId = Integer.parseInt(a_Id);
		Association association = asService.findAssociationById(aId);
		map.put("association", association);

		return "page/detailAssociationNews";
	}
}
