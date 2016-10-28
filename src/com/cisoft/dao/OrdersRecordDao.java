package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.OrdersRecord;
@Component("ordersrecordDao")
public class OrdersRecordDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(OrdersRecord order){
		StringBuilder sql=new StringBuilder("select count(*) from OrdersRecord where or_scbs=1");
		if(order.getOrders()!=null){
			sql.append(" and orders.o_id="+order.getOrders().getO_id());
		}
		if(order.getUser()!=null){
			sql.append(" and user.u_zsName='"+order.getUser().getU_zsName()+"'");
		}
		sql.append(" order by or_szsj desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<OrdersRecord> getList(OrdersRecord order){
		StringBuilder sql=new StringBuilder("from OrdersRecord  where or_scbs=1");
		if(order.getOrders()!=null){
			sql.append(" and orders.o_id="+order.getOrders().getO_id());
		}
		if(order.getUser()!=null){
			sql.append(" and user.u_zsName='"+order.getUser().getU_zsName()+"'");
		}
		sql.append(" order by or_szsj desc");
		List<OrdersRecord> ordersRecords= pageList.getPage(sql.toString(), order.getFirstsize(), order.getRows());
		return ordersRecords;
	}
	
	public void save(OrdersRecord order){
		hibernateTemplate.saveOrUpdate(order);
	}
	
	public OrdersRecord findById(OrdersRecord order){
		StringBuilder sql=new StringBuilder("from OrdersRecord  where or_scbs=1");
		if(order.getOrders()!=null){
			sql.append(" and orders.o_id="+order.getOrders().getO_id());
		}
		if(order.getUser()!=null){
			sql.append(" and usre.u_zsName='"+order.getUser().getU_zsName()+"'");
		}
		if(order.getOr_step()!=-1){
			sql.append(" and or_step="+order.getOr_step());
		}
		sql.append(" order by or_szsj desc");
		List<OrdersRecord> ors=hibernateTemplate.find(sql.toString());
		if(ors.size()>0){
		OrdersRecord commoditys= (OrdersRecord) hibernateTemplate.find(sql.toString()).get(0);
		
		return commoditys;
		}
		return null;
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from OrdersRecord where or_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<OrdersRecord> findlistbyorderid(int o_id) {
		StringBuilder sql=new StringBuilder("from OrdersRecord  where or_scbs=1");
		if(o_id!=0){
			sql.append(" and orders.o_id="+o_id);
		    sql.append(" order by or_szsj desc");
		List<OrdersRecord> ors=hibernateTemplate.find(sql.toString());
		
			return ors;
		}
		return null;
	}
	
}
