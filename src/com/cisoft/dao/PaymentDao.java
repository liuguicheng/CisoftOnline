package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Payment;
@Component("paymentDao")
public class PaymentDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Payment payment){
		StringBuilder sql=new StringBuilder("select count(*) from Payment where c_scbs=1");
		if(payment.getPaymentBh()!=null&&!"".equals(payment.getPaymentBh())){
			sql.append(" and (paymentBh='"+payment.getPaymentBh().trim()+"'");
			sql.append(" or paymentZhanghao='"+payment.getPaymentBh().trim()+"'");
			sql.append(" or paymentXingMin='"+payment.getPaymentBh().trim()+"')");
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Payment> getList(Payment payment){
		StringBuilder sql=new StringBuilder("from Payment  where c_scbs=1");
		if(payment.getPaymentBh()!=null&&!"".equals(payment.getPaymentBh())){
			sql.append(" and (paymentBh='"+payment.getPaymentBh().trim()+"'");
			sql.append(" or paymentZhanghao='"+payment.getPaymentBh().trim()+"'");
			sql.append(" or paymentXingMin='"+payment.getPaymentBh().trim()+"')");
		}
		sql.append(" order by id desc");
		List<Payment> Payments= pageList.getPage(sql.toString(), payment.getFirstsize(), payment.getRows());
		return Payments;
	}
	
	public void save(Payment Payment){
		hibernateTemplate.saveOrUpdate(Payment);
	}
	
	public Payment findById(Payment payment){
		return hibernateTemplate.get(Payment.class,payment.getId());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Payment where c_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Payment> getLists(Payment payment) {
		StringBuilder sql=new StringBuilder("from Payment  where c_scbs=1");
       
		sql.append(" order by id desc");
		List<Payment> Payments= hibernateTemplate.find(sql.toString());
		return Payments;
	}
	public List<Payment> findlist() {
		StringBuilder sql=new StringBuilder("from Payment  where c_scbs=1");
		sql.append(" order by id desc");
		List<Payment> Payments= hibernateTemplate.find(sql.toString());
		return Payments;
	}
	public Payment findBybh(String spbh) {
		StringBuilder sql=new StringBuilder("from Payment  where c_scbs=1");
		sql.append(" and paymentBh='"+spbh+"'");
		List<Payment> Payments= hibernateTemplate.find(sql.toString());
		if(Payments.size()>0){
			return Payments.get(0);
		}
		return null;
	}
	
	
}
