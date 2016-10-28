package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MerchantPayDao;
import com.cisoft.model.MerchantPay;

@Component("merchantPayService")
@Transactional
public class MerchantPayService {
	@Resource
	private MerchantPayDao merchantPayDao;
	
	public int getCount(MerchantPay merchantPay){
		return merchantPayDao.getCount(merchantPay);
	}
	public List<MerchantPay> getList(MerchantPay merchantPay){
		return merchantPayDao.getList(merchantPay);
	}
	
	public void save(MerchantPay merchantPay){
		merchantPayDao.save(merchantPay);
	}
	
	public MerchantPay findById(MerchantPay merchantPay){
		return merchantPayDao.findById(merchantPay);
	}
	
	public int isunitexit(int unitid){
		return merchantPayDao.isunitexit(unitid);
	}
	public List<MerchantPay> findgyxlist() {
		// TODO Auto-generated method stub
		return merchantPayDao.findgyxlist();
	}
}
