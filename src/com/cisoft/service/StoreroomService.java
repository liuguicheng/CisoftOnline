package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.StoreroomDao;
import com.cisoft.model.Storeroom;

@Component("storeroomService")
@Transactional
public class StoreroomService {
	@Resource
	private StoreroomDao storeDao;
	
	public int getCount(Storeroom s){
		return storeDao.getCount(s);
	}
	public List<Storeroom> getList(Storeroom s){
		return storeDao.getList(s);
	}
	
	public void save(Storeroom s){
		storeDao.save(s);
	}
	
	public Storeroom findById(Storeroom s){
		return storeDao.findById(s);
	}
	
	public int isunitexit(int unitid){
		return storeDao.isunitexit(unitid);
	}
	public List<Storeroom> findgyxlist() {
		// TODO Auto-generated method stub
		return storeDao.findgyxlist();
	}
	public List<Storeroom> findroombyhouse(int parseInt) {
		// TODO Auto-generated method stub
		return storeDao.findroombyhouse(parseInt);
	}
}
