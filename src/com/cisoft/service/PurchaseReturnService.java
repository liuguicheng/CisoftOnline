package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PurchaseReturnDao;
import com.cisoft.model.PurchaseReturn;

@Component("purchasereturnService")
@Transactional
public class PurchaseReturnService {
	@Resource
	private PurchaseReturnDao purchasereturnDao;
	
	public int getCount(PurchaseReturn PurchaseReturn, String xdstartime, String xdendtime){
		return purchasereturnDao.getCount(PurchaseReturn,xdstartime,xdendtime);
	}
	public List<PurchaseReturn> getList(PurchaseReturn PurchaseReturn, String xdstartime, String xdendtime){
		return purchasereturnDao.getList(PurchaseReturn,xdstartime,xdendtime);
	}
	
	public void save(PurchaseReturn PurchaseReturn){
		purchasereturnDao.save(PurchaseReturn);
	}
	
	public PurchaseReturn findById(PurchaseReturn PurchaseReturn){
		return purchasereturnDao.findById(PurchaseReturn);
	}
	
	public int isunitexit(int unitid){
		return purchasereturnDao.isunitexit(unitid);
	}
	public List<PurchaseReturn> findgyxlist() {
		// TODO Auto-generated method stub
		return purchasereturnDao.findgyxlist();
	}
	public List<PurchaseReturn> findlist(PurchaseReturn pr, String xdstartime, String xdendtime) {
		// TODO Auto-generated method stub
		return purchasereturnDao.findlist(pr,xdstartime,xdendtime);
	}
}
