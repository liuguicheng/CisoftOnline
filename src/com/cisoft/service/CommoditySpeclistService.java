package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommoditySpeclistDao;
import com.cisoft.model.CommoditySpeclist;

@Component("commoditySpeclistService")
@Transactional
public class CommoditySpeclistService {
	@Resource
	private CommoditySpeclistDao commoditySpeclistDao;
	
	public int getCount(CommoditySpeclist GYSInfo){
		return commoditySpeclistDao.getCount(GYSInfo);
	}
	public List<CommoditySpeclist> getList(CommoditySpeclist GYSInfo){
		return commoditySpeclistDao.getList(GYSInfo);
	}
	
	public void save(CommoditySpeclist GYSInfo){
		commoditySpeclistDao.save(GYSInfo);
	}
	
	public CommoditySpeclist findById(CommoditySpeclist GYSInfo){
		return commoditySpeclistDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commoditySpeclistDao.isunitexit(unitid);
	}
	public List<CommoditySpeclist> findbrandlist() {
		// TODO Auto-generated method stub
		return commoditySpeclistDao.findbrandlist();
	}
	public List<CommoditySpeclist> findbrandlistby(CommoditySpeclist cbrand) {
		// TODO Auto-generated method stub
		return commoditySpeclistDao.findbrandlistby(cbrand);
	}
}
