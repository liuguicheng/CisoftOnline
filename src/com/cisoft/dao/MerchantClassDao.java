package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.MerchantClass;
@Component("merchantClassDao")
public class MerchantClassDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;

	public int getCount(MerchantClass MerchantClass){
		String sql="select count(*) from MerchantClass where scbs=1";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<MerchantClass> getList(MerchantClass MerchantClass){
		String sql="from MerchantClass where scbs=1";
		List<MerchantClass> MerchantClasss=pageList.getPage(sql, MerchantClass.getFirstsize(), MerchantClass.getRows());
		return MerchantClasss;
	}
	//下拉框
	public List<MerchantClass> getList(){
		String sql="from MerchantClass where scbs=1";
		return hibernateTemplate.find(sql);
	}
	
	public void save(MerchantClass merchantClass){
		hibernateTemplate.saveOrUpdate(merchantClass);
	}
	
	public MerchantClass findById(MerchantClass merchantClass){
		return hibernateTemplate.get(MerchantClass.class, merchantClass.getId());
	}
	public MerchantClass findById(int id){
		return hibernateTemplate.get(MerchantClass.class, id);
	}
}
