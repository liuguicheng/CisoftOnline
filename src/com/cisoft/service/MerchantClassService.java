package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MerchantClassDao;
import com.cisoft.model.MerchantClass;

@Component("merchantClassService")
@Transactional
public class MerchantClassService {
	@Resource
	private MerchantClassDao merchantClassDao;
	
	public int getCount(MerchantClass merchantClass){
		return merchantClassDao.getCount(merchantClass);
	}
	public List<MerchantClass> getList(MerchantClass merchantClass){
		return merchantClassDao.getList(merchantClass);
	}
	public List<MerchantClass> getList(){
		return merchantClassDao.getList();
	}
	
	public void save(MerchantClass merchantClass){
		merchantClassDao.save(merchantClass);
	}
	
	public MerchantClass findById(MerchantClass merchantClass){
		return merchantClassDao.findById(merchantClass);
	}
	public MerchantClass findById(int id){
		return merchantClassDao.findById(id);
	}
}
