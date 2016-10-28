package com.cisoft.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Orders;
import com.cisoft.model.PagerModel;
import com.cisoft.model.PaymentRecords;
@Component("ordersDao")
public class OrdersDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Orders order){
		StringBuilder sql=new StringBuilder("select count(*) from Orders where o_scbs=1");
		if(order.getO_bh()!=null&&!order.getO_bh().equals("")){
			sql.append(" and o_bh='"+order.getO_bh()+"'");
		}
		if(order.getO_status()!=-1){
			sql.append(" and o_status="+order.getO_status());
		}
		sql.append(" order by o_id desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Orders> getList(Orders order){
		StringBuilder sql=new StringBuilder("from Orders  where o_scbs=1 ");
		if(order.getO_bh()!=null&&!order.getO_bh().equals("")){
			sql.append(" and o_bh='"+order.getO_bh()+"'");
		}
		if(order.getO_status()!=-1){
			sql.append(" and o_status="+order.getO_status());
		}
		if(order.getUser()!=null){
			sql.append(" and u_id="+order.getUser().getU_id());
		}
		sql.append(" order by o_id desc");
		List<Orders> commoditys= pageList.getPage(sql.toString(), order.getFirstsize(), order.getRows());
		return commoditys;
	}
	
	public void save(Orders order){
		hibernateTemplate.saveOrUpdate(order);
	}
	
	public Orders findById(Orders order){
		StringBuilder sql=new StringBuilder("from Orders  where o_scbs=1");
		if(order.getO_bz()!=null&&!order.getO_bz().equals("")){
			sql.append(" and o_bh='"+order.getO_bh()+"'");
		}
		if(order.getO_id()!=0){
			sql.append(" and o_id="+order.getO_id());
		}
//		sql.append(" order by o_id desc");
		List<Orders> orderlist=hibernateTemplate.find(sql.toString());
		if(orderlist.size()>0){
		Orders commoditys=  orderlist.get(0);
		return commoditys;
		}
		return null;
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Orders where o_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	
	public List<Orders>  findorders(Orders orders){
		StringBuilder sql=new StringBuilder("from Orders  where o_scbs=1");
		if(orders.getUser()!=null){
			sql.append(" and user.u_id="+orders.getUser().getU_id());
		}
		if(orders.getO_status()!=-1&&orders.getO_status()!=6){
			sql.append(" and o_status="+orders.getO_status());
		}else if(orders.getO_status()!=-1&&orders.getO_status()==6){
			sql.append(" and o_status!="+orders.getO_status());
		}
		sql.append(" order by o_id desc");
		List<Orders> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	
	public List<Orders> findjsorders(String id){
		StringBuilder sql=new StringBuilder("from Orders  where o_scbs=1");
		if(id!=null){
			sql.append(" and o_id in("+id+")");
		}
		sql.append(" order by o_id desc");
		List<Orders> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public Orders findBybh(String bh) {
		StringBuilder sql=new StringBuilder("from Orders  where o_scbs=1");
		if(bh!=null){
			sql.append(" and o_bh='"+bh+"'");
		}
		List<Orders> commoditys= hibernateTemplate.find(sql.toString());
		if(commoditys.size()>0){
			return commoditys.get(0);
		}
		return null;
	}
	public List<Orders> findBybhyl(String id) {
		 final int ids = Integer.parseInt(id);  
		    List<Orders> commoditys = hibernateTemplate.executeFind(new HibernateCallback() {  
		        public Object doInHibernate(Session session) throws HibernateException, SQLException {  
		             Query quer= session.createQuery("from Orders  where o_scbs=1 and  o_id=?");
			            quer.setInteger(0, ids);
			            List<Orders> list= quer.list();
		             return list;  
		                }  
		            }); 
			return commoditys;
	}
	public List<Orders> findBybhzfb(String bh) {
		final String bhs = bh;  
	    List<Orders> commoditys = hibernateTemplate.executeFind(new HibernateCallback() {  
	        public Object doInHibernate(Session session) throws HibernateException, SQLException {  
	            Query quer= session.createQuery("from Orders  where o_scbs=1 and  o_bh=?");
	            quer.setString(0, bhs);
	            List<Orders> list= quer.list();
	             return list;  
	                }  
	            });
		return commoditys;
	}
	
	public PagerModel findAllOrders(Orders or,int offset, int pagesize) {
		   //得到总记录数     
		StringBuffer queryCountHql=new StringBuffer("select count(*) from n_orders o where o.o_scbs=1");   
     if(or!=null){
    	 if(or.getUser()!=null){
    		 queryCountHql.append(" and o.u_id="+or.getUser().getU_id());
    	 }
    	 if(or.getO_status()!=-1&&or.getO_status()!=6){
    		 queryCountHql.append(" and o.o_status="+or.getO_status());
 		}else if(or.getO_status()!=-1&&or.getO_status()==6){
 			queryCountHql.append(" and o.o_status!="+or.getO_status());
 		}
    	 queryCountHql.append(" order by o.o_id desc");
     }
     int total = 0;     
     SessionFactory s= hibernateTemplate.getSessionFactory();
     Session ss=s.openSession();
     Query q=ss.createSQLQuery(queryCountHql.toString());
     
     total= Integer.parseInt((q.uniqueResult().toString()));
     StringBuffer sql=new StringBuffer("select * from  n_orders o where o.o_scbs=1 ");
     if(or!=null){
    	 if(or.getUser()!=null){
    		 sql.append(" and o.u_id="+or.getUser().getU_id());
    	 }
    	 if(or.getO_status()!=-1&&or.getO_status()!=6){
 			sql.append(" and o.o_status="+or.getO_status());
 		}else if(or.getO_status()!=-1&&or.getO_status()==6){
 			sql.append(" and o.o_status!="+or.getO_status());
 		}
 		sql.append(" order by o.o_id desc");
     }
      List list= ss.createSQLQuery(sql.toString())
    		  .addEntity(Orders.class) 
    		  .setMaxResults(pagesize)
    		  .setFirstResult(offset)
    		  .list();
     //得到结果集     
     PagerModel pm = new PagerModel();     
     pm.setTotal(total);     
     pm.setDatas(list); 
     pm.setTotalpage((total-1)/pm.getPagesize()+1);
     ss.clear();
     ss.close();
     return pm;     
	}
	public void upOrderStatus(String id, int statuts) {
		StringBuilder sql=new StringBuilder("update Orders set o_status="+statuts+"  where o_scbs=1");
		if(id!=null){
			sql.append(" and o_id in("+id+")");
		}
		this.hibernateTemplate.bulkUpdate(sql.toString());
	}
	public List queryTjsjSum(Orders orders, String xdstartime, String xdendtime) {
		StringBuilder sql=new StringBuilder("");
		sql.append("select count(o_id) as numstr,month(o_startTime) as timestr from Orders  where  o_scbs=1");
		if(orders!=null){
			if(orders.getO_sort()!=null&&!"".equals(orders.getO_sort())){
				sql.append(" and o_sort="+orders.getO_sort());
			}
			if(orders.getO_status()!=-1){
				sql.append(" and o_status="+orders.getO_status());
			}
		}
		sql.append(" group by month(o_startTime)");
		List list=this.hibernateTemplate.find(sql.toString());
		return list;
	}
}

