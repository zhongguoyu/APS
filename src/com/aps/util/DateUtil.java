package com.aps.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	private static SimpleDateFormat formatter = new SimpleDateFormat();

	/**
	 * 字符串转时间
	 * @param date
	 * @return
	 */
	public static Date parseToDate(String date, String pattern){
		formatter.applyPattern(pattern);
		try {
			return formatter.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 时间转字符串
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date,String pattern){
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}
}
