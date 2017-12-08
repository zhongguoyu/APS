package com.aps.dao;

import java.util.List;

import com.aps.pojo.Message;

public interface MessageDao {
	public List<Message> findLastMessage();

	public int findMessageByPhone(String phone);
	
	public void insertNewMessage(Message message);

	public List<Message> findAllMessage();

}
