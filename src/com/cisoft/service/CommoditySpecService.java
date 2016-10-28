package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommoditySpecDao;
import com.cisoft.model.CommoditySpec;
import com.cisoft.model.CommoditySpecVlaue;

@Component("commoditySpecService")
@Transactional
public class CommoditySpecService {
	@Resource
	private CommoditySpecDao commoditySpecDao;
	
	public int getCount(CommoditySpec GYSInfo){
		return commoditySpecDao.getCount(GYSInfo);
	}
	public List<CommoditySpec> getList(CommoditySpec GYSInfo){
		return commoditySpecDao.getList(GYSInfo);
	}
	
	public void save(CommoditySpec GYSInfo){
		commoditySpecDao.save(GYSInfo);
	}
	
	public CommoditySpec findById(CommoditySpec GYSInfo){
		return commoditySpecDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commoditySpecDao.isunitexit(unitid);
	}
	public List<CommoditySpec> findlist(CommoditySpec cspec) {
		// TODO Auto-generated method stub
		return commoditySpecDao.findlist(cspec);
	}
	public void delete(CommoditySpec cbrandinfo) {
		// TODO Auto-generated method stub
		commoditySpecDao.delete(cbrandinfo);
	}
	public void savespecval(CommoditySpecVlaue cs) {
		// TODO Auto-generated method stub
		commoditySpecDao.savespecval(cs);
	}
	public List<CommoditySpecVlaue> findspecvallist(CommoditySpec cspec) {
		// TODO Auto-generated method stub
		return commoditySpecDao.findspecvallist(cspec);
	}
	public void deletespecval(CommoditySpecVlaue cspec) {
		// TODO Auto-generated method stub
		commoditySpecDao.deletespecval(cspec);
	}
	
}
