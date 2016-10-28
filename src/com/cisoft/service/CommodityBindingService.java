package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityBindingDao;
import com.cisoft.model.CommodityBinding;

@Component("commodityBindingService")
@Transactional
public class CommodityBindingService {
	@Resource
	private CommodityBindingDao commodityBindingDao;
	
	public int getCount(CommodityBinding GYSInfo){
		return commodityBindingDao.getCount(GYSInfo);
	}
	public List<CommodityBinding> getList(CommodityBinding GYSInfo){
		return commodityBindingDao.getList(GYSInfo);
	}
	
	public void save(CommodityBinding GYSInfo){
		commodityBindingDao.save(GYSInfo);
	}
	
	public CommodityBinding findById(CommodityBinding GYSInfo){
		return commodityBindingDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commodityBindingDao.isunitexit(unitid);
	}
	public List<CommodityBinding> findbrandlist(CommodityBinding commodityBinding) {
		// TODO Auto-generated method stub
		return commodityBindingDao.findbrandlist(commodityBinding);
	}
	public List<CommodityBinding> findbrandlistby(CommodityBinding cbrand) {
		// TODO Auto-generated method stub
		return commodityBindingDao.findbrandlistby(cbrand);
	}
}
