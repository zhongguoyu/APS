package com.aps.dao;

import java.util.List;

import com.aps.pojo.News;

public interface NewsDao {
	
	/**
	 * 查找所有新闻并分页显示
	 */
	public List<News> findAllNews(int page);
	
	/**
	 * 查找所有新闻的数量
	 */
	public int findAllNewsCount();
	
	/**
	 * 根据新闻ID查找具体信息
	 */
	public News findNewsById(int newsId);
	
	/**
	 * 查找最新的5条新闻
	 */
	public List<News> findLastFive();
	
	/**
	 * 增加新闻
	 * @param news
	 */
	public void addNews(News news);
	
}
