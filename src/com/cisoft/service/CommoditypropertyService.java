package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommoditypropertyDao;
import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommodityProperty;

@Component("commoditypropertyService")
@Transactional
public class CommoditypropertyService {
	@Resource
	private CommoditypropertyDao commoditypropertyDao;
	
	public int getCount(CommodityProperty CommodityProperty){
		return commoditypropertyDao.getCount(CommodityProperty);
	}
	public List<CommodityProperty> getList(CommodityProperty CommodityProperty){
		return commoditypropertyDao.getList(CommodityProperty);
	}
	
	public void save(CommodityProperty CommodityProperty){
		commoditypropertyDao.save(CommodityProperty);
	}
	
	public CommodityProperty findById(CommodityProperty CommodityProperty){
		return commoditypropertyDao.findById(CommodityProperty);
	}
	
	public int isunitexit(int unitid){
		return commoditypropertyDao.isunitexit(unitid);
	}
	public List<CommodityProperty> findgyxlist() {
		// TODO Auto-generated method stub
		return commoditypropertyDao.findgyxlist();
	}
	public List<CommodityProperty> findByIdby(CommodityProperty gys) {
		// TODO Auto-generated method stub
		return commoditypropertyDao.findByIdby(gys);
	}
}
