package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityBrandDao;
import com.cisoft.model.CommodityBrand;

@Component("commoditybrandService")
@Transactional
public class CommodityBrandService {
	@Resource
	private CommodityBrandDao commoditybrandDao;
	
	public int getCount(CommodityBrand GYSInfo){
		return commoditybrandDao.getCount(GYSInfo);
	}
	public List<CommodityBrand> getList(CommodityBrand GYSInfo){
		return commoditybrandDao.getList(GYSInfo);
	}
	
	public void save(CommodityBrand GYSInfo){
		commoditybrandDao.save(GYSInfo);
	}
	
	public CommodityBrand findById(CommodityBrand GYSInfo){
		return commoditybrandDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commoditybrandDao.isunitexit(unitid);
	}
	public List<CommodityBrand> findbrandlist() {
		// TODO Auto-generated method stub
		return commoditybrandDao.findbrandlist();
	}
	public List<CommodityBrand> findbrandlistby(CommodityBrand cbrand) {
		// TODO Auto-generated method stub
		return commoditybrandDao.findbrandlistby(cbrand);
	}
}
