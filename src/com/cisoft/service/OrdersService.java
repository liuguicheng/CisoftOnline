package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.OrdersDao;
import com.cisoft.model.Orders;
import com.cisoft.model.PagerModel;


@Component("ordersService")
@Transactional
public class OrdersService {
	@Resource
	private OrdersDao ordersDao;
	
	public int getCount(Orders orders){
		return ordersDao.getCount(orders);
	}
	public List<Orders> getList(Orders orders){
		return ordersDao.getList(orders);
	}
	
	public void save(Orders orders){
		ordersDao.save(orders);
	}
	
	public Orders findById(Orders orders){
		return ordersDao.findById(orders);
	}
	
	public int isunitexit(int unitid){
		return ordersDao.isunitexit(unitid);
	}
	public List<Orders> findorders(Orders o){
		return ordersDao.findorders(o);
	}
	public List<Orders> findjsorders(String id){
		return ordersDao.findjsorders(id);
	}
	public Orders findBybh(String bh) {
		// TODO Auto-generated method stub
		return ordersDao.findBybh(bh);
	}
	public List<Orders> findBybhyl(String id) {
		// TODO Auto-generated method stub
		return ordersDao.findBybhyl(id);
	}
	public List<Orders> findBybhzfb(String bh) {
		// TODO Auto-generated method stub
		return ordersDao.findBybhzfb(bh);
	}

	public PagerModel findAllOrders(Orders or,int offset, int pagesize) {
		return ordersDao.findAllOrders(or, offset, pagesize);
	}
	public void upOrderStatus(String id,int statuts) {
		 ordersDao.upOrderStatus(id,statuts);
		
	}
	public List queryTjsjSum(Orders orders, String xdstartime, String xdendtime) {
		// TODO Auto-generated method stub
		return ordersDao.queryTjsjSum(orders,xdstartime, xdendtime);
	}
}
