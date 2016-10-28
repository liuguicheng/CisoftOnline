package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PaymentRecordsDao;
import com.cisoft.model.PaymentRecords;


@Component("paymentrecordsService")
@Transactional
public class PaymentrecordsService {
	@Resource
	private PaymentRecordsDao paymentrecordsDao;
	
	public int getCount(PaymentRecords pr){
		return paymentrecordsDao.getCount(pr);
	}
	public List<PaymentRecords> getList(PaymentRecords pr){
		return paymentrecordsDao.getList(pr);
	}
	
	public void save(PaymentRecords pr){
		paymentrecordsDao.save(pr);
	}
	
	public PaymentRecords findById(PaymentRecords pr){
		return paymentrecordsDao.findById(pr);
	}
	
	public int isunitexit(int unitid){
		return paymentrecordsDao.isunitexit(unitid);
	}
	public PaymentRecords findByorderbh(String ddbh) {
		// TODO Auto-generated method stub
		return paymentrecordsDao.findByorderbh(ddbh);
	}
	public List<PaymentRecords> findByorderbhzfb(String ddbh) {
		// TODO Auto-generated method stub
		return paymentrecordsDao.findByorderbhzfb(ddbh);
	}
	public List<PaymentRecords> findlistbyorderid(String o_id) {
		// TODO Auto-generated method stub
		return paymentrecordsDao.findlistbyorderid(o_id);
	}

}
