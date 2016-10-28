package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.ShoppingCart;
@Component("shoppingcarDao")
public class ShoppingcarDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(ShoppingCart shoppingcar){
		StringBuilder sql=new StringBuilder("select count(*) from ShoppingCart where sc_scbs=1");
		if(shoppingcar.getUser()!=null){
			sql.append(" and user.u_id="+shoppingcar.getUser().getU_id());
		}
		sql.append(" order by sc_id desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<ShoppingCart> getList(ShoppingCart shoppingCart){
		StringBuilder sql=new StringBuilder("from ShoppingCart  where sc_scbs=1");
		if(shoppingCart.getUser()!=null){
			sql.append(" and user.u_id="+shoppingCart.getUser().getU_id());
		}
		sql.append(" order by sc_id desc");
		List<ShoppingCart> ShoppingCarts= pageList.getPage(sql.toString(), shoppingCart.getFirstsize(), shoppingCart.getRows());
		return ShoppingCarts;
	}
	
	public void save(ShoppingCart shoppingcar){
		hibernateTemplate.saveOrUpdate(shoppingcar);
	}
	
	public ShoppingCart findById(ShoppingCart shoppingcar){
		return hibernateTemplate.get(ShoppingCart.class,shoppingcar.getSc_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from ShoppingCart where sc_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<ShoppingCart> getLists(ShoppingCart comm) {
		StringBuilder sql=new StringBuilder("from ShoppingCart  where sc_scbs=1");
		if(comm.getUser()!=null){
			sql.append(" and user.u_id="+comm.getUser().getU_id());
		}
		if(comm.getCommodity()!=null){
			sql.append(" and commodity.c_id="+comm.getCommodity().getC_id());
		}
		sql.append(" order by sc_id desc");
		List<ShoppingCart> ShoppingCarts= hibernateTemplate.find(sql.toString());
		return ShoppingCarts;
	}
	public List<ShoppingCart> findBycids(String id) {
		StringBuilder sql=new StringBuilder("from ShoppingCart  where sc_scbs=1");
		if(id!=null){
			sql.append(" and commodity.c_id in("+id+")");
		}
		List<ShoppingCart> ShoppingCarts= hibernateTemplate.find(sql.toString());
		return ShoppingCarts;
	}
	
}
