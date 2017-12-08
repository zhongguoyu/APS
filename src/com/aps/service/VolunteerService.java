package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.VolunteerDao;
import com.aps.pojo.Volunteer;

@Service
public class VolunteerService {
	@Autowired
	private VolunteerDao volunteerDao;
	
	public void addVolunteer(Volunteer volunteer){
		volunteerDao.addVolunteer(volunteer);
	}
	
	public Volunteer findVolunteerByPhone(String phone){
		return volunteerDao.findVolunteerByPhone(phone);
	}
	
	public List<Volunteer> findAllVolunteer(){
		return volunteerDao.findAllVolunteer();
	}
}
