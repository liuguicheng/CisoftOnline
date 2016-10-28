package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.GysDao;
import com.cisoft.model.GYSInfo;

@Component("gysService")
@Transactional
public class GysService {
	@Resource
	private GysDao gysDao;
	
	public int getCount(GYSInfo GYSInfo){
		return gysDao.getCount(GYSInfo);
	}
	public List<GYSInfo> getList(GYSInfo GYSInfo){
		return gysDao.getList(GYSInfo);
	}
	
	public void save(GYSInfo GYSInfo){
		gysDao.save(GYSInfo);
	}
	
	public GYSInfo findById(GYSInfo GYSInfo){
		return gysDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return gysDao.isunitexit(unitid);
	}
	public List<GYSInfo> findgyxlist() {
		// TODO Auto-generated method stub
		return gysDao.findgyxlist();
	}
}
