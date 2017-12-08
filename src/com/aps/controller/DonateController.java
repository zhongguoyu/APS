package com.aps.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aps.form.DonateForm;
import com.aps.pojo.Donate;
import com.aps.pojo.Message;
import com.aps.service.DonateService;
import com.aps.service.MessageService;

@Controller
public class DonateController {
	@Autowired
	private DonateService donateService;
	@Autowired
	private MessageService messageService;
	@RequestMapping("goDonate")
	public String goDonate(ModelMap map){
		int peopleCount = donateService.findDonatePeopleCount();
		double moneyCount = donateService.findDonateMoneyCount();
		map.put("pCount", peopleCount);
		map.put("mCount", moneyCount);
		List<Donate> list1 = donateService.findAllDonate();
		List<Message> list2 = messageService.findAllMessage();
		map.put("list1", list1);
		map.put("list2", list2);
		return "page/donate";
	}
	@RequestMapping("addDonate")
	public String addDonate(DonateForm donateForm,ModelMap map){
		map.put("donateForm", donateForm);
		return "page/pay";
	}
}
