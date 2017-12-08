package com.aps.dao;

import java.util.List;

import com.aps.pojo.Volunteer;

public interface VolunteerDao {

	public void addVolunteer(Volunteer volunteer);
	
	public Volunteer findVolunteerByPhone(String phone);
	
	public List<Volunteer> findAllVolunteer();
}
