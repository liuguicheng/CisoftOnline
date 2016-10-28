package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
@Component("orderscommoditydetailsDao")
public class OrdersCommodityDetailsDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(OrdersCommodityDetails order){
		StringBuilder sql=new StringBuilder("select count(*) from OrdersCommodityDetails  where o_scbs=1 ");
		if(order!=null){
			if(order.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+order.getOrder().getO_status());
			}else{
				sql.append(" and order.o_status!=6");
			}
			if(order.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+order.getOrder().getO_sort());
			}
			if(order.getOrder().getO_bh()!=null&&!order.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+order.getOrder().getO_bh().trim()+"%'");
			}
		}
		sql.append(" order by o_id desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<OrdersCommodityDetails> getList(OrdersCommodityDetails order){
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1 ");
		if(order!=null){
			if(order.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+order.getOrder().getO_status());
			}else{
				sql.append(" and order.o_status!=6");
			}
			if(order.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+order.getOrder().getO_sort());
			}
			if(order.getOrder().getO_bh()!=null&&!order.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+order.getOrder().getO_bh().trim()+"%'");
			}
			
		}
		sql.append(" order by o_id desc");
		List<OrdersCommodityDetails> commoditys= pageList.getPage(sql.toString(), order.getFirstsize(), order.getRows());
		return commoditys;
	}
	
	public void save(OrdersCommodityDetails order){
		hibernateTemplate.saveOrUpdate(order);
	}
	
	public OrdersCommodityDetails findById(OrdersCommodityDetails order){
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		List<OrdersCommodityDetails> orderlist=hibernateTemplate.find(sql.toString());
		if(orderlist.size()>0){
		OrdersCommodityDetails commoditys=  orderlist.get(0);
		return commoditys;
		}
		return null;
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from OrdersCommodityDetails where o_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	
	public List<OrdersCommodityDetails>  findOrdersCommodityDetails(OrdersCommodityDetails ordersCommodityDetails){
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		if(ordersCommodityDetails.getOrder()!=null){
			sql.append(" and order.o_id="+ordersCommodityDetails.getOrder().getO_id());
		}
		List<OrdersCommodityDetails> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	
	public List<OrdersCommodityDetails> findjsOrdersCommodityDetails(String id){
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		sql.append(" order by o_id desc");
		List<OrdersCommodityDetails> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public List<OrdersCommodityDetails> findByids(String c_id) {
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		if(c_id!=null){
			sql.append(" and o_id in ("+c_id+")");
		}
		sql.append(" order by o_id desc");
		List<OrdersCommodityDetails> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public OrdersCommodityDetails findbycommodity(
			OrdersCommodityDetails orcdetail) {
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		if(orcdetail!=null){
			if(orcdetail.getCommodity()!=null){
				sql.append(" and commodity.c_id="+orcdetail.getCommodity().getC_id());
			}
			if(orcdetail.getUser()!=null){
				sql.append(" and user.u_id="+orcdetail.getUser().getU_id());
			}
		}
		List<OrdersCommodityDetails> orderlist=hibernateTemplate.find(sql.toString());
		if(orderlist.size()>0){
		OrdersCommodityDetails commoditys=  orderlist.get(0);
		return commoditys;
		}
		return null;
	}
	public List<OrdersCommodityDetails> findCommdoitybyorderbh(String o_bh) {
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1");
		if(o_bh!=null){
		     sql.append(" and order.o_bh='"+o_bh+"'");
		}
		List<OrdersCommodityDetails> orderlist=hibernateTemplate.find(sql.toString());
		return orderlist;
	}
	public List<OrdersCommodityDetails> getList(OrdersCommodityDetails orders,
			String xdstartime, String xdendtime, String fkstratime,
			String fkendtime, String kddh) {
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1 ");
		if(orders!=null){
			if(orders.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+orders.getOrder().getO_status());
			}
//			else{
//				sql.append(" and order.o_status!=6");
//			}
			if(orders.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+orders.getOrder().getO_sort());
			}
			if(orders.getOrder().getO_bh()!=null&&!orders.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+orders.getOrder().getO_bh().trim()+"%'");
			}
			
			if(orders.getOrder().getUseraddress()!=null){
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shName())){
				sql.append(" and order.useraddress.ua_shName='"+orders.getOrder().getUseraddress().getUa_shName().trim()+"'");
				}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shDh())){
					sql.append(" and order.useraddress.ua_shDh='"+orders.getOrder().getUseraddress().getUa_shDh().trim()+"'");
					}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_address())){
					sql.append(" and order.useraddress.ua_address like '%"+orders.getOrder().getUseraddress().getUa_address().trim()+"%'");
					}
			}
			if(orders.getOrder().getUser()!=null){
				sql.append(" and order.user.u_id="+orders.getOrder().getUser().getU_id());
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and (order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and order.o_startTime >='"+xdstartime+"' and  order.o_startTime<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and order.o_startTime <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
			sql.append(" and order.fktime >='"+fkstratime+"' and  order.fktime<='"+fkendtime+"'");
			}
		}
		sql.append(" order by order.o_startTime desc");
		List<OrdersCommodityDetails> commoditys= pageList.getPage(sql.toString(), orders.getFirstsize(), orders.getRows());
		return commoditys;
	}
	public int getCount(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		StringBuilder sql=new StringBuilder("select count(*) from OrdersCommodityDetails  where o_scbs=1 ");
		if(orders!=null){
			if(orders.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+orders.getOrder().getO_status());
			}
//			else{
//				sql.append(" and order.o_status!=6");
//			}
			if(orders.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+orders.getOrder().getO_sort());
			}
			if(orders.getOrder().getO_bh()!=null&&!orders.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+orders.getOrder().getO_bh().trim()+"%'");
			}
			if(orders.getOrder().getUseraddress()!=null){
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shName())){
				sql.append(" and order.useraddress.ua_shName='"+orders.getOrder().getUseraddress().getUa_shName().trim()+"'");
				}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shDh())){
					sql.append(" and order.useraddress.ua_shDh='"+orders.getOrder().getUseraddress().getUa_shDh().trim()+"'");
					}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_address())){
					sql.append(" and order.useraddress.ua_address like '%"+orders.getOrder().getUseraddress().getUa_address().trim()+"%'");
					}
			}
			if(orders.getOrder().getUser()!=null){
				sql.append(" and order.user.u_id="+orders.getOrder().getUser().getU_id());
			}
			
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and order.o_startTime >='"+xdstartime+"' and  order.o_startTime<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and order.o_startTime <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
				sql.append(" and order.fktime >='"+fkstratime+"' and  order.fktime<='"+fkendtime+"'");
			}
		}
		sql.append(" order by order.o_startTime desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List queryList(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		StringBuilder sql=new StringBuilder("from OrdersCommodityDetails  where o_scbs=1 ");
		if(orders!=null){
			if(orders.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+orders.getOrder().getO_status());
			}
//			else{
//				sql.append(" and order.o_status!=6");
//			}
			if(orders.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+orders.getOrder().getO_sort());
			}
			if(orders.getOrder().getO_bh()!=null&&!orders.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+orders.getOrder().getO_bh().trim()+"%'");
			}
			
			if(orders.getOrder().getUseraddress()!=null){
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shName())){
				sql.append(" and order.useraddress.ua_shName='"+orders.getOrder().getUseraddress().getUa_shName().trim()+"'");
				}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shDh())){
					sql.append(" and order.useraddress.ua_shDh='"+orders.getOrder().getUseraddress().getUa_shDh().trim()+"'");
					}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_address())){
					sql.append(" and order.useraddress.ua_address like '%"+orders.getOrder().getUseraddress().getUa_address().trim()+"%'");
					}
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and (order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and order.o_startTime >='"+xdstartime+"' and  order.o_startTime<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and order.o_startTime <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
			sql.append(" and order.fktime >='"+fkstratime+"' and  order.fktime<='"+fkendtime+"'");
			}
		}
		sql.append(" order by order.o_startTime desc");
		List<OrdersCommodityDetails> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public int queryListcount(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		StringBuilder sql=new StringBuilder("select count(*) from OrdersCommodityDetails  where o_scbs=1 ");
		if(orders!=null){
			if(orders.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+orders.getOrder().getO_status());
			}
//			else{
//				sql.append(" and order.o_status!=6");
//			}
			if(orders.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+orders.getOrder().getO_sort());
			}
			if(orders.getOrder().getO_bh()!=null&&!orders.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+orders.getOrder().getO_bh().trim()+"%'");
			}
			if(orders.getOrder().getUseraddress()!=null){
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shName())){
				sql.append(" and order.useraddress.ua_shName='"+orders.getOrder().getUseraddress().getUa_shName().trim()+"'");
				}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shDh())){
					sql.append(" and order.useraddress.ua_shDh='"+orders.getOrder().getUseraddress().getUa_shDh().trim()+"'");
					}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_address())){
					sql.append(" and order.useraddress.ua_address like '%"+orders.getOrder().getUseraddress().getUa_address().trim()+"%'");
					}
			}
			
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and order.o_startTime >='"+xdstartime+"' and  order.o_startTime<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and order.o_startTime <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
				sql.append(" and order.fktime >='"+fkstratime+"' and  order.fktime<='"+fkendtime+"'");
			}
		}
		sql.append(" order by order.o_startTime desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public double queryListsumprice(OrdersCommodityDetails orders,
			String xdstartime, String xdendtime, String fkstratime,
			String fkendtime, String kddh) {
		StringBuilder sql=new StringBuilder("select SUM(o_zjg) as niu from OrdersCommodityDetails  where o_scbs=1 ");
		if(orders!=null){
			if(orders.getOrder().getO_status()!=-1){
				sql.append(" and order.o_status="+orders.getOrder().getO_status());
			}
//			else{
//				sql.append(" and order.o_status!=6");
//			}
			if(orders.getOrder().getO_sort()!=0){
				sql.append(" and order.o_sort="+orders.getOrder().getO_sort());
			}
			if(orders.getOrder().getO_bh()!=null&&!orders.getOrder().getO_bh().equals("")){
				sql.append(" and order.o_bh like '%"+orders.getOrder().getO_bh().trim()+"%'");
			}
			if(orders.getOrder().getUseraddress()!=null){
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shName())){
				sql.append(" and order.useraddress.ua_shName='"+orders.getOrder().getUseraddress().getUa_shName().trim()+"'");
				}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_shDh())){
					sql.append(" and order.useraddress.ua_shDh='"+orders.getOrder().getUseraddress().getUa_shDh().trim()+"'");
					}
				if(!"".equals(orders.getOrder().getUseraddress().getUa_address())){
					sql.append(" and order.useraddress.ua_address like '%"+orders.getOrder().getUseraddress().getUa_address().trim()+"%'");
					}
			}
			
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and order.o_startTime >='"+xdstartime+"' and  order.o_startTime<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and order.o_startTime <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
				sql.append(" and order.fktime >='"+fkstratime+"' and  order.fktime<='"+fkendtime+"'");
			}
		}
		List list=this.hibernateTemplate.find(sql.toString());
		double count=0.0;
		if(list.size()>0){
			Object o=list.get(0);
			if(o!=null){
			count=Double.valueOf(list.get(0).toString());
			}
		}
		return (double) count;
	}

}
