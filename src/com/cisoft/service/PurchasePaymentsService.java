package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PurchasePaymentsDao;
import com.cisoft.model.PurchasePayments;

@Component("purchasepaymentsService")
@Transactional
public class PurchasePaymentsService {
	@Resource
	private PurchasePaymentsDao purchasepaymentsDao;
	
	public int getCount(PurchasePayments GYSInfo, String xdstartime, String xdendtime){
		return purchasepaymentsDao.getCount(GYSInfo,xdstartime,xdendtime);
	}
	public List<PurchasePayments> getList(PurchasePayments GYSInfo, String xdstartime, String xdendtime){
		return purchasepaymentsDao.getList(GYSInfo,xdstartime,xdendtime);
	}
	
	public void save(PurchasePayments GYSInfo){
		purchasepaymentsDao.save(GYSInfo);
	}
	
	public PurchasePayments findById(PurchasePayments GYSInfo){
		return purchasepaymentsDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return purchasepaymentsDao.isunitexit(unitid);
	}
	public List<PurchasePayments> findgyxlist() {
		// TODO Auto-generated method stub
		return purchasepaymentsDao.findgyxlist();
	}
	public List findlistby(PurchasePayments gys, String xdstartime,
			String xdendtime) {
		// TODO Auto-generated method stub
		return  purchasepaymentsDao.findlistby(gys,xdstartime,xdendtime);
	}
}
