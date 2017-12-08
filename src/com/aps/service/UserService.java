package com.aps.service;

import org.springframework.stereotype.Service;

import com.aps.dao.UserDao;
import com.aps.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;


@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	public User findUserByName(String userName){
		return userDao.findUserByName(userName);
	}
}
