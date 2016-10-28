package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CommodityDao;
import com.cisoft.dao.CommodityImgDao;
import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityImg;


@Component("commodityimgService")
@Transactional
public class CommodityImgService {
	@Resource
	private CommodityImgDao commodityimgDao;
	
	public int getCount(CommodityImg commodityimg){
		return commodityimgDao.getCount(commodityimg);
	}
	public List<CommodityImg> getList(CommodityImg commodityimg){
		return commodityimgDao.getList(commodityimg);
	}
	
	public void save(CommodityImg commodityimg){
		commodityimgDao.save(commodityimg);
	}
	
	public CommodityImg findById(CommodityImg commodityimg){
		return commodityimgDao.findById(commodityimg);
	}
	
	public int isunitexit(int unitid){
		return commodityimgDao.isunitexit(unitid);
	}
	public List<CommodityImg> findAlbumlist(CommodityImg commodityImg) {
		// TODO Auto-generated method stub
		return commodityimgDao.commodityimgDao(commodityImg);
	}
}
