package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityDao;
import com.cisoft.jk.ServiceHallPhoto;
import com.cisoft.model.Commodity;


@Component("commodityService")
@Transactional
public class CommodityService {
	@Resource
	private CommodityDao commodityDao;
	
	public int getCount(Commodity commodity){
		return commodityDao.getCount(commodity);
	}
	public List<Commodity> getList(Commodity commodity){
		return commodityDao.getList(commodity);
	}
	
	public void save(Commodity commodity){
		commodityDao.save(commodity);
	}
	
	public Commodity findById(Commodity commodity){
		return commodityDao.findById(commodity);
	}
	
	public int isunitexit(int unitid){
		return commodityDao.isunitexit(unitid);
	}
	public List<Commodity> getLists(Commodity comm) {
		// TODO Auto-generated method stub
		return commodityDao.getLists(comm);
	}
	public List<Commodity> findlist() {
		// TODO Auto-generated method stub
		return commodityDao.findlist();
	}
	public Commodity findBybh(String spbh) {
		// TODO Auto-generated method stub
		return commodityDao.findBybh(spbh);
	}
	public List<Commodity> findbymoid(ServiceHallPhoto serviceHallPhoto) {
		// TODO Auto-generated method stub
		return commodityDao.findbymoid(serviceHallPhoto);
	}
	public List<Commodity> findlist(Commodity commodity) {
		// TODO Auto-generated method stub
		return commodityDao.findlist(commodity);
	}
	public int findlistcount(Commodity commodity) {
		// TODO Auto-generated method stub
		return commodityDao.findlistcount(commodity);
	}
}
