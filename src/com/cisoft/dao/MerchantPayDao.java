package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.MerchantPay;
@Component("merchantPayDao")
public class MerchantPayDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(MerchantPay MerchantPay){
		StringBuilder sql=new StringBuilder("select count(*) from MerchantPay where mp_scbs=1");
		if(MerchantPay.getMp_name()!=null&&!MerchantPay.getMp_name().equals("")){
        	sql.append(" and mp_name like '%"+MerchantPay.getMp_name().trim()+"%'");
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<MerchantPay> getList(MerchantPay MerchantPay){
		StringBuilder sql=new StringBuilder("from MerchantPay  where mp_scbs=1");
        if(MerchantPay.getMp_name()!=null&&!MerchantPay.getMp_name().equals("")){
        	sql.append(" and mp_name like '%"+MerchantPay.getMp_name().trim()+"%'");
        }
		sql.append(" order by mp_id desc");
		List<MerchantPay> MerchantPays= pageList.getPage(sql.toString(), MerchantPay.getFirstsize(), MerchantPay.getRows());
		return MerchantPays;
	}
	
	public void save(MerchantPay MerchantPay){
		hibernateTemplate.saveOrUpdate(MerchantPay);
	}
	
	public MerchantPay findById(MerchantPay MerchantPay){
		return hibernateTemplate.get(MerchantPay.class,MerchantPay.getMp_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from MerchantPay where mp_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<MerchantPay> findgyxlist() {
		StringBuilder sql=new StringBuilder("from MerchantPay  where mp_scbs=1");
		List<MerchantPay> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
