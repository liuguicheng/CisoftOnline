package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.StorehouseDao;
import com.cisoft.model.Storehouse;

@Component("storehouseService")
@Transactional
public class StorehouseService {
	@Resource
	private StorehouseDao storehouseDao;
	
	public int getCount(Storehouse storehouse){
		return storehouseDao.getCount(storehouse);
	}
	public List<Storehouse> getList(Storehouse storehouse){
		return storehouseDao.getList(storehouse);
	}
	
	public void save(Storehouse storehouse){
		storehouseDao.save(storehouse);
	}
	
	public Storehouse findById(Storehouse storehouse){
		return storehouseDao.findById(storehouse);
	}
	
	public int isunitexit(int unitid){
		return storehouseDao.isunitexit(unitid);
	}
	public List<Storehouse> findgyxlist() {
		// TODO Auto-generated method stub
		return storehouseDao.findgyxlist();
	}
}
