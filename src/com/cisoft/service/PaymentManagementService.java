package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PaymentManagementDao;
import com.cisoft.model.PaymentManagement;

@Component("paymentManagementService")
@Transactional
public class PaymentManagementService {
	@Resource
	private PaymentManagementDao paymentManagemenDao;
	
	public int getCount(PaymentManagement paymentManagement){
		return paymentManagemenDao.getCount(paymentManagement);
	}
	public List<PaymentManagement> getList(PaymentManagement paymentManagement){
		return paymentManagemenDao.getList(paymentManagement);
	}
	
	public void save(PaymentManagement paymentManagement){
		paymentManagemenDao.save(paymentManagement);
	}
	
	public PaymentManagement findById(PaymentManagement paymentManagement){
		return paymentManagemenDao.findById(paymentManagement);
	}
	
	public int isunitexit(int unitid){
		return paymentManagemenDao.isunitexit(unitid);
	}
	public List<PaymentManagement> findgyxlist() {
		// TODO Auto-generated method stub
		return paymentManagemenDao.findgyxlist();
	}
}
