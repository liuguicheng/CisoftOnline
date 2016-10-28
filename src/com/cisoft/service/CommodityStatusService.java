package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityStatusDao;
import com.cisoft.model.CommodityStatus;

@Component("commoditystatusService")
@Transactional
public class CommodityStatusService {
	@Resource
	private CommodityStatusDao commoditystatusDao;
	
	public int getCount(CommodityStatus GYSInfo){
		return commoditystatusDao.getCount(GYSInfo);
	}
	public List<CommodityStatus> getList(CommodityStatus GYSInfo){
		return commoditystatusDao.getList(GYSInfo);
	}
	
	public void save(CommodityStatus GYSInfo){
		commoditystatusDao.save(GYSInfo);
	}
	
	public CommodityStatus findById(CommodityStatus GYSInfo){
		return commoditystatusDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return commoditystatusDao.isunitexit(unitid);
	}
	public List<CommodityStatus> findstatus() {
		// TODO Auto-generated method stub
		return commoditystatusDao.findstatus();
	}
}
