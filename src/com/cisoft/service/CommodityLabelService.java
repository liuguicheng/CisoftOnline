package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityLabelDao;
import com.cisoft.model.CommodityLabel;

@Component("commodityLabelService")
@Transactional
public class CommodityLabelService {
	@Resource
	private CommodityLabelDao commodityLabelDao;
	
	public int getCount(CommodityLabel GYSInfo){
		return commodityLabelDao.getCount(GYSInfo);
	}
	public List<CommodityLabel> getList(CommodityLabel GYSInfo){
		return commodityLabelDao.getList(GYSInfo);
	}
	
	public void save(CommodityLabel GYSInfo){
		commodityLabelDao.save(GYSInfo);
	}
	
	public CommodityLabel findById(CommodityLabel GYSInfo){
		return commodityLabelDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commodityLabelDao.isunitexit(unitid);
	}
	public List<CommodityLabel> findbrandlist() {
		// TODO Auto-generated method stub
		return commodityLabelDao.findbrandlist();
	}
	public List<CommodityLabel> findbrandlistby(CommodityLabel cbrand) {
		// TODO Auto-generated method stub
		return commodityLabelDao.findbrandlistby(cbrand);
	}
}
