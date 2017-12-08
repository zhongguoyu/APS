package com.aps.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aps.pojo.Animal;

public interface AnimalDao {
	
//	/**
//	 * 查找所有动物并分页显示
//	 * @param page
//	 * @return
//	 */
//	public List<Animal> findAnimals(int page);
//	
//	public int animalCount();
//	
//	/**
//	 * 按照类型查询
//	 * @param type
//	 * @param page
//	 * @return
//	 */
//	public List<Animal> findAnimals(String type,int page);
//	
//	public int animalCount(String type,int page);
//	/**
//	 * 按照品种查询
//	 * @param variety
//	 * @param page
//	 * @return
//	 */
//	public List<Animal> findAnimals(int variety,int page);
//	
//	public int animalCount(int variety,int page);
	/**
	 * 按照品种和类型查询
	 * @param type
	 * @param variety
	 * @param page
	 * @return
	 */
	public List<Animal> findAnimals(@Param("type")String type,@Param("variety")int variety,@Param("page")int page);
	
	public int animalCount(@Param("type")String type,@Param("variety")int variety);
	
	//没有被领养动物
	public int notAdopt();
	
	//已经被领养
	public int haveAdopt();

	
	//根据Id查找动物
	public Animal findAniInfoById(int animalId);

	
	/**
	 * 查找flag为0年龄小于3岁的按时间降序排列的狗
	 */
	public List<Animal> findDogByRule();
	
	/**
	 * 查找flag为0年龄小于3岁的按时间降序排列的猫
	 */
	public List<Animal> findCatByRule();
	

	/**
	 * 添加动物
	 * @param animal
	 */
	public void addAnimal(Animal animal);

	/**
	 * 根据动物Id查找动物种类
	 */
	public String findAnimalVarietyById(int animalId);
	
	/**
	 * 查找flag为0收留时间升序前6个狗
	 */
	public List<Animal> findSixDog();
	
	/**
	 * 查找flag为0收留时间升序前6个猫
	 */
	public List<Animal> findSixCat();
	
	/**
	 * 查找已经被收养的动物
	 */
	public List<Animal> findHaveOwnerAnimal();
	
	
}
