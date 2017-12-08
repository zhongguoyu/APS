package com.aps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aps.pojo.Animal;
import com.aps.pojo.Variety;
import com.aps.service.AnimalService;
import com.aps.service.VarietyService;

@Controller
public class AnimalController {
	@Autowired
	private AnimalService animalService;
	@Autowired
	private VarietyService varietyService;
	
	@RequestMapping("baseAnimal")
	public String baseAnimal(String page,ModelMap map){
		int currentPage = Integer.parseInt(page);
		List<Animal> list = animalService.findAnimals(null,0,currentPage);
		List<Variety> varietyList = varietyService.findAllVariety();
		int totalpage = animalService.animalCount(null,0);
		if(totalpage%9==0){
			totalpage = totalpage/9;
		}
		else{
			totalpage = totalpage/9+1;
		}
		int max,min;
		if(totalpage<3){
			min = 1;
			max = totalpage;
		}
		else{
			min=1;
			max=3;
		}
		map.put("max", max);
		map.put("min", min);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalpage);
		map.put("animalList", list);
		map.put("varietyList", varietyList);
		map.put("variety", 0);
		map.put("type", null);
		return "page/baseAnimal";
	}
	
	@RequestMapping("pageturn")
	public String pageturn(String page,String variety,String type,ModelMap map){
		int currentPage = Integer.parseInt(page);
		int currentVariety = Integer.parseInt(variety);
		String typeName = type;
		if(typeName.equals("")){
			typeName = null;
		}
		List<Animal> list = animalService.findAnimals(typeName,currentVariety,currentPage);
		List<Variety> varietyList = varietyService.findAllVariety();
		int totalpage = animalService.animalCount(typeName,currentVariety);
		if(totalpage%9==0){
			totalpage = totalpage/9;
		}
		else{
			totalpage = totalpage/9+1;
		}
		int max,min;
		if(totalpage<3){
			min = 1;
			max = totalpage;
		}
		else if(currentPage<=2){
			min = 1;
			max = 3;
		}
		else if(currentPage>=totalpage-1){
			min = totalpage-2;
			max = totalpage;
		}
		else{
			min = currentPage - 1;
			max = currentPage + 1;
		}
		map.put("max", max);
		map.put("min", min);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalpage);
		map.put("animalList", list);
		map.put("varietyList", varietyList);
		map.put("variety", variety);
		map.put("type", typeName);
		return "page/baseAnimal";
	}
	
	@RequestMapping("initAnimal")
	public String initAnimal(String type,String variety,ModelMap map){
		int currentVariety = Integer.parseInt(variety);
		String typeName = type;
		if(typeName.equals("")){
			typeName = null;
		}
		List<Animal> list = animalService.findAnimals(typeName,currentVariety,1);
		int totalpage = animalService.animalCount(typeName,currentVariety);
		if(totalpage%9==0){
			totalpage = totalpage/9;
		}
		else{
			totalpage = totalpage/9+1;
		}
		int max,min;
		if(totalpage<3){
			min = 1;
			max = totalpage;
		}
		else{
			min=1;
			max=3;
		}
		map.put("max", max);
		map.put("min", min);
		map.put("totalPage", totalpage);
		map.put("currentPage", 1);
		map.put("animalList", list);
		map.put("variety", currentVariety);
		map.put("type", typeName);
		return "page/ajax/initAnimal";
	}

	/**
	 * 根据id查询动物的具体信息
	 */
	@RequestMapping("findAniInfoById")
	public String findAniInfoById(int animalId,ModelMap map){
		Animal animal = animalService.findAniInfoById(animalId);
		if(animal != null){
			String typeName = varietyService.findTypeById(animal.getVarietyId());
			String name = animal.getName();
			String picture = "image/animal/"+animal.getPicture();
			System.out.println(picture);
			String sex = animal.getSex();
			int age = animal.getAge();
			String content = animal.getIntroduction();
			map.put("type",typeName);
			map.put("name", name);
			map.put("picture",picture);
			map.put("age", age);
			map.put("content",content);
			map.put("sex", sex);
		}
		return "page/ajax/animalInfo";
	}
	
	@RequestMapping("judge")
	@ResponseBody
	public String judge(String animalId){
		int id = Integer.parseInt(animalId);
		Animal animal = animalService.findAniInfoById(id);
		if(animal!=null&&animal.getFlag()==0){
			return "正确";
		}
		if(animal!=null&&animal.getFlag()==1){
			return "已被领养";
		}
		return "没有该芯片动物";
	}
}
