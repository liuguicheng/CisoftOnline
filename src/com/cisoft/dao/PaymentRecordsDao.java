package com.cisoft.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Orders;
import com.cisoft.model.PaymentRecords;
/**
 * 缴费记录dao
 * @author pro
 *
 */
@Component("paymentrecordsDao")
public class PaymentRecordsDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PaymentRecords pr){
		StringBuilder sql=new StringBuilder("select count(*) from PaymentRecords where pr_scbs=1");
		sql.append(" order by pr_id desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PaymentRecords> getList(PaymentRecords pr){
		StringBuilder sql=new StringBuilder("from PaymentRecords  where pr_scbs=1");
		sql.append(" order by pr_id desc");
		List<PaymentRecords> commoditys= pageList.getPage(sql.toString(), pr.getFirstsize(), pr.getRows());
		return commoditys;
	}
	
	public void save(PaymentRecords order){
		hibernateTemplate.saveOrUpdate(order);
	}
	
	public PaymentRecords findById(PaymentRecords pr){
		StringBuilder sql=new StringBuilder("from PaymentRecords  where pr_scbs=1");
		PaymentRecords commoditys= (PaymentRecords) hibernateTemplate.find(sql.toString()).get(0);
		return commoditys;
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PaymentRecords where pr_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public PaymentRecords findByorderbh(String ddbh) {
		StringBuilder sql=new StringBuilder("from PaymentRecords  where pr_scbc=1 ");
		if(ddbh!=null){
			sql.append(" and pr_ddbh='"+ddbh+"'");
		}
		List<PaymentRecords> commoditys= hibernateTemplate.find(sql.toString());
		if(commoditys.size()>0){
			return commoditys.get(0);
		}
		return null;
	}
	public List<PaymentRecords> findByorderbhzfb(String ddbh) {
		 final String ddbhs = ddbh;  
	    List<PaymentRecords> commoditys = hibernateTemplate.executeFind(new HibernateCallback() {  
	        public Object doInHibernate(Session session) throws HibernateException, SQLException {  
	        	Query quer= session.createQuery("from PaymentRecords  where pr_scbc=1 and  pr_ddbh=?");
	            quer.setString(0, ddbhs);
	            List<PaymentRecords> list= quer.list();
	             return list;  
	                }  
	            });  
		return commoditys;
	}
	public List<PaymentRecords> findlistbyorderid(String o_id) {
		StringBuilder sql=new StringBuilder("from PaymentRecords  where pr_scbc=1 ");
		if(o_id!=null){
			sql.append(" and pr_ddbh='"+o_id+"'");
			sql.append(" order by pr_startTime");
		List<PaymentRecords> commoditys= hibernateTemplate.find(sql.toString());
			return commoditys;
		}
		return null;
	}
	
}
