package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityTypeDao;
import com.cisoft.model.CommodityType;

@Component("commodityTypeService")
@Transactional
public class CommodityTypeService {
	@Resource
	private CommodityTypeDao commodityTypeDao;
	
	public int getCount(CommodityType GYSInfo){
		return commodityTypeDao.getCount(GYSInfo);
	}
	public List<CommodityType> getList(CommodityType GYSInfo){
		return commodityTypeDao.getList(GYSInfo);
	}
	
	public void save(CommodityType GYSInfo){
		commodityTypeDao.save(GYSInfo);
	}
	
	public CommodityType findById(CommodityType GYSInfo){
		return commodityTypeDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commodityTypeDao.isunitexit(unitid);
	}
	public List<CommodityType> findTypelist() {
		// TODO Auto-generated method stub
		return commodityTypeDao.findTypelist();
	}
	public List<CommodityType> findTypelistby(CommodityType cType) {
		// TODO Auto-generated method stub
		return commodityTypeDao.findTypelistby(cType);
	}
}
