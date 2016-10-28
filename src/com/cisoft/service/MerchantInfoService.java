package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MerchantInfoDao;
import com.cisoft.model.MerchantInfo;

@Component("merchantInfoService")
@Transactional
public class MerchantInfoService {
	@Resource
	private MerchantInfoDao merchantInfoDao;
	
	public List<MerchantInfo> findByLogin(MerchantInfo merchantInfo){
		return merchantInfoDao.findByLogin(merchantInfo);
	}
	
	public int getCount(MerchantInfo merchantInfo){
		return merchantInfoDao.getCount(merchantInfo);
	}
	public List<MerchantInfo> getList(MerchantInfo merchantInfo){
		return merchantInfoDao.getList(merchantInfo);
	}
	
	public void save(MerchantInfo merchantInfo){
		merchantInfoDao.save(merchantInfo);
	}
	
	public MerchantInfo findById(MerchantInfo merchantInfo){
		return merchantInfoDao.findById(merchantInfo);
	}
	
	
}
