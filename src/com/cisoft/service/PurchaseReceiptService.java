package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PurchasereceiptDao;
import com.cisoft.model.PurchaseReceipt;
import com.cisoft.model.PurchaseReturn;

@Component("purchasereceiptService")
@Transactional
public class PurchaseReceiptService {
	@Resource
	private PurchasereceiptDao purchasereceiptDao;
	
	public int getCount(PurchaseReceipt PurchaseReceipt, String xdstartime, String xdendtime){
		return purchasereceiptDao.getCount(PurchaseReceipt,xdstartime,xdendtime);
	}
	public List<PurchaseReceipt> getList(PurchaseReceipt PurchaseReceipt, String xdstartime, String xdendtime){
		return purchasereceiptDao.getList(PurchaseReceipt,xdstartime,xdendtime);
	}
	
	public void save(PurchaseReceipt PurchaseReceipt){
		purchasereceiptDao.save(PurchaseReceipt);
	}
	
	public PurchaseReceipt findById(PurchaseReceipt PurchaseReceipt){
		return purchasereceiptDao.findById(PurchaseReceipt);
	}
	
	public int isunitexit(int unitid){
		return purchasereceiptDao.isunitexit(unitid);
	}
	public List<PurchaseReceipt> findgyxlist() {
		// TODO Auto-generated method stub
		return purchasereceiptDao.findgyxlist();
	}
	public List findlist(PurchaseReturn pr, String xdstartime, String xdendtime) {
		// TODO Auto-generated method stub
		return purchasereceiptDao.findlist(pr,xdstartime,xdendtime);
	}
}
