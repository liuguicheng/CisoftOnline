package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.MerchantServices;
@Component("merchantServicesDao")
public class MerchantServicesDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	Transaction transaction;
	
	public List<MerchantServices> getList(){
		String sql="from MerchantServices where scbs=1";
		List<MerchantServices> merchantServicess=hibernateTemplate.find(sql);
		return merchantServicess;
	}
	
	public MerchantServices findById(int id){
		return hibernateTemplate.get(MerchantServices.class, id);
	}
	//下拉框
	public List<MerchantServices> getParent(){
		String sql="from MerchantServices where  scbs=1";
		return hibernateTemplate.find(sql);
	}
	
	public void save(MerchantServices MerchantServices){
		hibernateTemplate.saveOrUpdate(MerchantServices);
	}

	//一级菜单
	public List<MerchantServices> getFirstMerchantServices(){
		String sql="from MerchantServices where parentid=0 and scbs=1";
		List<MerchantServices> MerchantServicess=hibernateTemplate.find(sql);
		return MerchantServicess;
	}
	
	//一级菜单下面的子菜单
	public List<MerchantServices> getByPid(int parentid){
		String sql="from MerchantServices where   parentid='"+parentid+"' and scbs=1";
		List<MerchantServices> MerchantServicess=hibernateTemplate.find(sql);
		return MerchantServicess;
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
