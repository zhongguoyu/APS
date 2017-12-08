package com.aps.util;

import java.util.Date;

import javax.servlet.http.HttpSession;

/**
 * 令牌对象，用于区分请求是否反复非法进入
 * @author admin
 *
 */
public class Token {
	public static final String TOKEN = "token";
	
	/**
	 * 创建令牌
	 * @return
	 */
	public static String createToken(HttpSession session){
		String token = new String(new Date().getTime()+"");
		//将令牌写入session
		session.setAttribute(TOKEN, token);
		return token;
	}
}
