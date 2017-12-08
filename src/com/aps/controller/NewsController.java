package com.aps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.form.NewsForm;
import com.aps.pojo.News;
import com.aps.service.NewsService;
import com.aps.util.Token;

@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("allNews")
	public String allNews(String page,ModelMap map){
		int currentPage = Integer.parseInt(page);
		List<News> list = newsService.findAllNews(currentPage);
		int newsCount = newsService.findAllNewsCount();
		int totalPage;
		if(newsCount%9==0){
			totalPage = newsCount/9;
		}
		else{
			totalPage = (newsCount/9)+1;
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
		
		map.put("min", min);
		map.put("max", max);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalPage);
		map.put("allNewsList", list);
		return "page/allNews";
	}
	
	
	@RequestMapping("detailNews")
	public String detailNews(String newsId,ModelMap map){
		int detailNewsId = Integer.parseInt(newsId);
		News news = newsService.findNewsById(detailNewsId);
		map.put("news", news);
		return "page/detailNews";
	}
	
	@RequestMapping("addNews")
	public String addNews(NewsForm newsForm,ModelMap map){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//获取请求传入的令牌
		String token = request.getParameter(Token.TOKEN);
		//获取session中的原始令牌
		Object serverToken = request.getSession().getAttribute(Token.TOKEN);
		if(serverToken != null && token.equals(serverToken.toString())){
			News news = new News();
			news.setNewsTitle(newsForm.getTitle());
			news.setContent(newsForm.getContent());
			newsService.addNews(news);
			request.getSession().removeAttribute(Token.TOKEN);
		}
		map.put("success","添加成功");
		return "page/manage";
	}
	
}
