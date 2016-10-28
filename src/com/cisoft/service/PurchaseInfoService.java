package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PurchaseInfoDao;
import com.cisoft.model.PurchaseInfo;

@Component("purchaseinfoService")
@Transactional
public class PurchaseInfoService {
	@Resource
	private PurchaseInfoDao purchaseinfoDao;
	
	public int getCount(PurchaseInfo PurchaseInfo){
		return purchaseinfoDao.getCount(PurchaseInfo);
	}
	public List<PurchaseInfo> getList(PurchaseInfo PurchaseInfo){
		return purchaseinfoDao.getList(PurchaseInfo);
	}
	
	public void save(PurchaseInfo PurchaseInfo){
		purchaseinfoDao.save(PurchaseInfo);
	}
	
	public PurchaseInfo findById(PurchaseInfo PurchaseInfo){
		return purchaseinfoDao.findById(PurchaseInfo);
	}
	
	public int isunitexit(int unitid){
		return purchaseinfoDao.isunitexit(unitid);
	}
	public List<PurchaseInfo> findgyxlist() {
		// TODO Auto-generated method stub
		return purchaseinfoDao.findgyxlist();
	}
	public List<PurchaseInfo> findbyno(String p_no) {
		// TODO Auto-generated method stub
		return purchaseinfoDao.findbyno(p_no);
	}
}
