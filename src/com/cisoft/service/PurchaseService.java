package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PurchaseDao;
import com.cisoft.model.Purchase;

@Component("purchaseService")
@Transactional
public class PurchaseService {
	@Resource
	private PurchaseDao purchaseDao;
	
	public int getCount(Purchase Purchase, String xdstartime, String xdendtime){
		return purchaseDao.getCount(Purchase,xdstartime,xdendtime);
	}
	public List<Purchase> getList(Purchase Purchase, String xdstartime, String xdendtime){
		return purchaseDao.getList(Purchase,xdstartime,xdendtime);
	}
	
	public void save(Purchase Purchase){
		purchaseDao.save(Purchase);
	}
	
	public Purchase findById(Purchase Purchase){
		return purchaseDao.findById(Purchase);
	}
	
	public int isunitexit(int unitid){
		return purchaseDao.isunitexit(unitid);
	}
	public List<Purchase> findgyxlist() {
		// TODO Auto-generated method stub
		return purchaseDao.findgyxlist();
	}
	public Purchase findbyno(String p_no) {
		// TODO Auto-generated method stub
		return purchaseDao.findbyno(p_no);
	}
	public List findpcorder(Purchase gys, String xdstartime, String xdendtime) {
		// TODO Auto-generated method stub
		return purchaseDao.findpcorder(gys,xdstartime,xdendtime);
	}
}
