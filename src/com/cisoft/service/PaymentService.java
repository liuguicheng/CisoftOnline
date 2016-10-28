package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PaymentDao;
import com.cisoft.jk.ServiceHallPhoto;
import com.cisoft.model.Payment;


@Component("paymentService")
@Transactional
public class PaymentService {
	@Resource
	private PaymentDao paymentDao;
	
	public int getCount(Payment payment){
		return paymentDao.getCount(payment);
	}
	public List<Payment> getList(Payment payment){
		return paymentDao.getList(payment);
	}
	
	public void save(Payment payment){
		paymentDao.save(payment);
	}
	
	public Payment findById(Payment payment){
		return paymentDao.findById(payment);
	}
	
	public int isunitexit(int unitid){
		return paymentDao.isunitexit(unitid);
	}
	public List<Payment> getLists(Payment payment) {
		// TODO Auto-generated method stub
		return paymentDao.getLists(payment);
	}
	public List<Payment> findlist() {
		// TODO Auto-generated method stub
		return paymentDao.findlist();
	}
	public Payment findBybh(String spbh) {
		// TODO Auto-generated method stub
		return paymentDao.findBybh(spbh);
	}
	
	
}
