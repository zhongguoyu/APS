package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.NewsDao;
import com.aps.pojo.News;

@Service
public class NewsService {
	@Autowired
	private NewsDao newsDao;
	
	public List<News> findAllNews(int page){
		return newsDao.findAllNews(page);
	}
	
	public int findAllNewsCount(){
		return newsDao.findAllNewsCount();
	}
	
	public News findNewsById(int newsId){
		return newsDao.findNewsById(newsId);
	}
	public List<News> findLastFive(){
		return newsDao.findLastFive();
	}
	
	public void addNews(News news){
		newsDao.addNews(news);
	}
}
