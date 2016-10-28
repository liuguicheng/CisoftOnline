package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommoditySortDao;
import com.cisoft.model.CommoditySort;

@Component("commoditysortService")
@Transactional
public class CommoditySortService {
	@Resource
	private CommoditySortDao commoditysortDao;
	
	public int getCount(CommoditySort GYSInfo){
		return commoditysortDao.getCount(GYSInfo);
	}
	public List<CommoditySort> getList(CommoditySort GYSInfo){
		return commoditysortDao.getList(GYSInfo);
	}
	
	public void save(CommoditySort GYSInfo){
		commoditysortDao.save(GYSInfo);
	}
	
	public CommoditySort findById(CommoditySort GYSInfo){
		return commoditysortDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commoditysortDao.isunitexit(unitid);
	}
	public List<CommoditySort> findParent() {
		// TODO Auto-generated method stub
		return commoditysortDao.findParent();
	}
	public List<CommoditySort> findParentby(CommoditySort cbrand) {
		// TODO Auto-generated method stub
		return commoditysortDao.findParentby(cbrand);
	}
}
