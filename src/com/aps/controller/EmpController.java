package com.aps.controller;

import java.io.IOException;
import java.util.List;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aps.pojo.Apply;
import com.aps.pojo.Emp;
import com.aps.pojo.Message;
import com.aps.pojo.Variety;
import com.aps.pojo.Volunteer;
import com.aps.service.ApplyService;
import com.aps.service.EmpService;
import com.aps.service.MessageService;
import com.aps.service.VarietyService;
import com.aps.service.VolunteerService;

@Controller
public class EmpController {
	@Autowired
	private EmpService empService;
	@Autowired
	private ApplyService applyService;
	@Autowired
	private VolunteerService volunteerService;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("changeMenu1")
	public String changeMenu1(ModelMap map){
		List<Apply> applyList = applyService.findAllApply();
		map.put("applyList", applyList);
		return "page/ajax/menu1";
	}
	
	@RequestMapping("changeMenu2")
	public String changeMenu2(ModelMap map){
		List<Volunteer> volunteerList = volunteerService.findAllVolunteer();
		map.put("volunteerList", volunteerList);
		return "page/ajax/menu2";
	}
	
	@RequestMapping("changeMenu3")
	public String changeMenu3(){
		return "page/ajax/menu3";
	}
	
	@RequestMapping("changeMenu4")
	public String changeMenu4(){
		return "page/ajax/menu4";
	}
	
	@RequestMapping("changeMenu5")
	public String changeMenu5(){
		return "page/ajax/menu5";
	}
	
	@RequestMapping("changeMenu6")
	public String changeMenu6(){
		return "page/ajax/menu6";
	}
	
	@RequestMapping("changeMenu7")
	public String changeMenu7(ModelMap map){
		List<Message> messageList = messageService.findLastMessage();
		map.put("messageList", messageList);
		return "page/ajax/menu7";
	}
	
	@RequestMapping("changeMenu8")
	public String changeMenu8(){
		return "page/ajax/menu8";
	}
	@RequestMapping("send1")
	public String send1(String applyId,String applyPhone,String flag,String animalId,ModelMap map) throws HttpException, IOException{
		int applyid=Integer.parseInt(applyId);
		int flagdemo=Integer.parseInt(flag);
		int animalid=Integer.parseInt(animalId);
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");
		String word;
		if(flagdemo==1){
			empService.changFlag3(animalid);
			word="您的领养已通过审核，请在一周内过来办理相关手续";
		}else{
			word="对不起，您的领养未通过审核";
		}
		NameValuePair[] data ={ new NameValuePair("Uid", "zhongzhongzhong"),new NameValuePair("Key", "665f503d8af55bc5e192"),new NameValuePair("smsMob",applyPhone),new NameValuePair("smsText",word)};
		post.setRequestBody(data);
		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
		System.out.println(result); 
		post.releaseConnection();
		empService.changFlag(flagdemo,applyid);
		map.put("success", "发送成功");
		return "page/manage";
		
	}
	
	
	
	
	@RequestMapping("send2")
	public String send2(String volunteerId,String phone,String flag,ModelMap map) throws HttpException, IOException{
		int volunteerid=Integer.parseInt(volunteerId);
		int flagdemo=Integer.parseInt(flag);
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//鍦ㄥご鏂囦欢涓缃浆鐮�
		String word;
		if(flagdemo==1){
			word="您志愿者的申请已通过审核";
		}else{
			word="对不起，您的志愿者申请未通过审核";
		}
		NameValuePair[] data ={ new NameValuePair("Uid", "zhongzhongzhong"),new NameValuePair("Key", "665f503d8af55bc5e192"),new NameValuePair("smsMob",phone),new NameValuePair("smsText",word)};
		post.setRequestBody(data);
		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
		System.out.println(result); 
		post.releaseConnection();
		empService.changFlag2(flagdemo,volunteerid);
		map.put("success", "发送成功");
		return "page/manage";
	}
}
