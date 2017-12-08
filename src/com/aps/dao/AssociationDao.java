package com.aps.dao;


import com.aps.pojo.Association;


import java.util.List;

import com.aps.pojo.Association;

public interface AssociationDao {

	public Association findNewAssNews();
	/**
	 * 查找所有协会动态并分页显示
	 */
	public List<Association> findAllAssociation(int page);
	
	/**
	 * 查找所有协会动态的数量
	 */
	public int findAllAssociationCount();
	

	/**
	 * 根据动态Id查找该动态
	 */
	public Association findAssociationById(int a_Id);
	
	/**
	 * 添加动态
	 * @param association
	 */
	public void addAssociation(Association association);
}
