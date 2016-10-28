package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.DistributionDao;
import com.cisoft.model.Distribution;

@Component("distributionService")
@Transactional
public class DistributionService {
	@Resource
	private DistributionDao distributionDao;
	
	public int getCount(Distribution distribution){
		return distributionDao.getCount(distribution);
	}
	public List<Distribution> getList(Distribution distribution){
		return distributionDao.getList(distribution);
	}
	
	public void save(Distribution distribution){
		distributionDao.save(distribution);
	}
	
	public Distribution findById(Distribution distribution){
		return distributionDao.findById(distribution);
	}
	
	public int isunitexit(int unitid){
		return distributionDao.isunitexit(unitid);
	}
	public List<Distribution> findgyxlist() {
		// TODO Auto-generated method stub
		return distributionDao.findgyxlist();
	}
}
