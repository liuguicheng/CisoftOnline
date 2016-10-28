package com.cisoft.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityPDao;
import com.cisoft.model.CommodityP;


@Component("commodityPService")
@Transactional
public class CommodityPService {
	@Resource
	private CommodityPDao commoditPDao;
	public void save(CommodityP commodity){
		commoditPDao.save(commodity);
	}
	
	public CommodityP findById(CommodityP commodity){
		return commoditPDao.findById(commodity);
	}
	
	public List<CommodityP> findCommodityPlist(CommodityP commodity){
		return commoditPDao.findCommodityPlist(commodity);
	}
	
}
