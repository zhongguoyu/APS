package com.aps.dao;

import com.aps.pojo.User;

public interface UserDao {
	public User findUserByName(String name);
}
