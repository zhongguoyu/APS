package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.MessageDao;
import com.aps.pojo.Message;

@Service
public class MessageService {
	
	@Autowired
	private MessageDao messageDao;
	
	public List<Message> findLastMessage(){
		return messageDao.findLastMessage();
	}

	
	public int findMessageByPhone(String phone){
		return messageDao.findMessageByPhone(phone);
	}
	
	public void insertNewMessage(Message message){
		messageDao.insertNewMessage(message);
	}
	
	public List<Message> findAllMessage(){
		return messageDao.findAllMessage();
	}

}
