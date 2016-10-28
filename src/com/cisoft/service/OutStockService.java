package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.OutStockDao;
import com.cisoft.model.OutStock;

@Component("outstockService")
@Transactional
public class OutStockService {
	@Resource
	private OutStockDao outstockDao;
	
	public int getCount(OutStock OutStock){
		return outstockDao.getCount(OutStock);
	}
	public List<OutStock> getList(OutStock OutStock){
		return outstockDao.getList(OutStock);
	}
	
	public void save(OutStock OutStock){
		outstockDao.save(OutStock);
	}
	
	public OutStock findById(OutStock OutStock){
		return outstockDao.findById(OutStock);
	}
	
	public int isunitexit(int unitid){
		return outstockDao.isunitexit(unitid);
	}
	public List<OutStock> findgyxlist() {
		// TODO Auto-generated method stub
		return outstockDao.findgyxlist();
	}
}
