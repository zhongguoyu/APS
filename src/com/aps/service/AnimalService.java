package com.aps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.dao.AnimalDao;
import com.aps.pojo.Animal;

@Service
public class AnimalService {
	@Autowired
	private AnimalDao animalDao;
	
	public List<Animal> findAnimals(String type,int variety,int page){
		return animalDao.findAnimals(type,variety,page);
	}
	
	public int animalCount(String type,int variety){
		return animalDao.animalCount(type,variety);
	}
	
	public int noAdopt(){
		return animalDao.notAdopt();
	}
	
	public int haveAdopt(){
		return animalDao.haveAdopt();
	}

	public Animal findAniInfoById(int animalId){
		return animalDao.findAniInfoById(animalId);
	}

	
	public List<Animal> findDogByRule(){
		return animalDao.findDogByRule();
	}
	
	public List<Animal> findCatByRule(){
		return animalDao.findCatByRule();
	}
	
	public String findAnimalVarietyById(int animalId){
		return animalDao.findAnimalVarietyById(animalId);
	}
	
	public List<Animal> findSixDog(){
		return animalDao.findSixDog();
	}
	
	public List<Animal> findSixCat(){
		return animalDao.findSixCat();
	}
	
	public List<Animal> findHaveOwnerAnimal(){
		return animalDao.findHaveOwnerAnimal();
	}
	
	public void addAnimal(Animal animal){
		animalDao.addAnimal(animal);
	}
}
