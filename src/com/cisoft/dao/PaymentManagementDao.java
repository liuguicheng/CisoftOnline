package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PaymentManagement;
@Component("paymentManagemenDao")
public class PaymentManagementDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PaymentManagement paymentManagement){
		StringBuilder sql=new StringBuilder("select count(*) from PaymentManagement where pm_scbs=1");
		if(paymentManagement.getPm_name()!=null&&!paymentManagement.getPm_name().equals("")){
        	sql.append(" and pm_name like '%"+paymentManagement.getPm_name().trim()+"%'");
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PaymentManagement> getList(PaymentManagement paymentManagement){
		StringBuilder sql=new StringBuilder("from PaymentManagement  where pm_scbs=1");
		if(paymentManagement.getPm_name()!=null&&!paymentManagement.getPm_name().equals("")){
        	sql.append(" and pm_name like '%"+paymentManagement.getPm_name().trim()+"%'");
        }
		sql.append(" order by pm_id desc");
		List<PaymentManagement> PaymentManagements= pageList.getPage(sql.toString(), paymentManagement.getFirstsize(), paymentManagement.getRows());
		return PaymentManagements;
	}
	
	public void save(PaymentManagement PaymentManagement){
		hibernateTemplate.saveOrUpdate(PaymentManagement);
	}
	
	public PaymentManagement findById(PaymentManagement paymentManagement){
		return hibernateTemplate.get(PaymentManagement.class,paymentManagement.getPm_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PaymentManagement where pm_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PaymentManagement> findgyxlist() {
		StringBuilder sql=new StringBuilder("from PaymentManagement  where pm_scbs=1");
		List<PaymentManagement> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
