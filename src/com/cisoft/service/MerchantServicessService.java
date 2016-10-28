package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MerchantServicesDao;
import com.cisoft.model.MerchantServices;

@Component("merchantServicesService")
@Transactional
public class MerchantServicessService {
	@Resource
	private MerchantServicesDao merchantServicesDao;
	
	public List<MerchantServices> getList(){
		return merchantServicesDao.getList();
	}
	
	public MerchantServices findById(int id){
		return merchantServicesDao.findById(id);
	}
	public List<MerchantServices> getParent(){
		return merchantServicesDao.getParent();
	}
	
	public void save(MerchantServices MerchantServices){
		merchantServicesDao.save(MerchantServices);
	}

	
	public List<MerchantServices> getFirstMerchantServices(){
		return merchantServicesDao.getFirstMerchantServices();
	}
	public List<MerchantServices> getByPid(int parentid){
		return merchantServicesDao.getByPid(parentid);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return merchantServicesDao.getCount();
	}
}
