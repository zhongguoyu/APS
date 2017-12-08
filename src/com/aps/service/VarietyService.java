package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.VarietyDao;
import com.aps.pojo.Variety;

@Service
public class VarietyService {
	@Autowired
	private VarietyDao varietyDao;
	
	/**
	 * 查询所有品种
	 * @return
	 */
	public List<Variety> findAllVariety(){
		return varietyDao.findAllVariety();
	}
	
	/**
	 * 查询所有猫品种
	 * @return
	 */
	public List<Variety> findAllCartVariety(){
		return varietyDao.findAllCartVariety();
	}
	
	/**
	 * 查询所有狗品种
	 * @return
	 */
	public List<Variety> findAllDogVariety(){
		return varietyDao.findAllDogVariety();
	}
	
	/**
	 * 根据编号查询种类
	 */
	public String findTypeById(int varietyId){
		return varietyDao.findTypeById(varietyId);
	} 
}
