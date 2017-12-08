package com.aps.service;


import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aps.dao.AssociationDao;
import com.aps.pojo.Association;

@Service
public class AssociationService {

	@Autowired
	private AssociationDao associationDao;
	
	public Association findNewAssNews(){
		return associationDao.findNewAssNews();
	}
	
	public List<Association> findAllAssociation(int page){
		return associationDao.findAllAssociation(page);
	}
	
	public int findAllAssociationCount(){
		return associationDao.findAllAssociationCount();
	}
	
	public Association findAssociationById(int a_Id){
		return associationDao.findAssociationById(a_Id);
	}
	
	public void addAssociation(Association association){
		associationDao.addAssociation(association);
	}
}
