package com.aps.dao;

import java.util.List;

import com.aps.pojo.Variety;

public interface VarietyDao {

	/**
	 * 查询所有品种
	 * @return
	 */
	public List<Variety> findAllVariety();
	
	/**
	 * 查询所有猫品种
	 * @return
	 */
	public List<Variety> findAllCartVariety();
	
	/**
	 * 查询所有狗品种
	 * @return
	 */
	public List<Variety> findAllDogVariety();
	
	/**
	 *根据id查询狗猫的品种 
	 */
	public String findTypeById(int varietyId);
}
