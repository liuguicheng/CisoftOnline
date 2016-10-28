package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.MerchantInfo;
@Component("merchantInfoDao")
public class MerchantInfoDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;

	public List<MerchantInfo> findByLogin(MerchantInfo MerchantInfo){
		StringBuilder sql=new StringBuilder("from MerchantInfo where mi_scbs=1");
		List<MerchantInfo> MerchantInfos=hibernateTemplate.find(sql.toString());
		return MerchantInfos;
	}
	
	public int getCount(MerchantInfo MerchantInfo){
		StringBuilder sql=new StringBuilder("select count(*) from MerchantInfo where mi_scbs=1");
		if(MerchantInfo.getMi_name()!=null&&!"".equals(MerchantInfo.getMi_name())){
			sql.append(" and mi_name like '%"+MerchantInfo.getMi_name()+"%'");
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<MerchantInfo> getList(MerchantInfo MerchantInfo){
		StringBuilder sql=new StringBuilder("from MerchantInfo  where mi_scbs=1");
		if(MerchantInfo.getMi_name()!=null&&!"".equals(MerchantInfo.getMi_name())){
			sql.append(" and mi_name like '%"+MerchantInfo.getMi_name()+"%'");
		}
		sql.append(" order by mi_id desc");
		List<MerchantInfo> MerchantInfos= pageList.getPage(sql.toString(), MerchantInfo.getFirstsize(), MerchantInfo.getRows());
		return MerchantInfos;
	}
	
	public void save(MerchantInfo MerchantInfo){
		hibernateTemplate.saveOrUpdate(MerchantInfo);
	}
	
	public MerchantInfo findById(MerchantInfo MerchantInfo){
		return hibernateTemplate.get(MerchantInfo.class,MerchantInfo.getMi_id());
	}
	
	
	
	
	
	
}
