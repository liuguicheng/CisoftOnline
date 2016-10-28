package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.OrdersCommodityDetailsDao;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;


@Component("orderscommoditydetailsService")
@Transactional
public class OrdersCommodityDetailsService {
	@Resource
	private OrdersCommodityDetailsDao orderscommoditydetailsDao;
	
	public int getCount(OrdersCommodityDetails orders){
		return orderscommoditydetailsDao.getCount(orders);
	}
	public List<OrdersCommodityDetails> getList(OrdersCommodityDetails orders){
		return orderscommoditydetailsDao.getList(orders);
	}
	
	public void save(OrdersCommodityDetails orders){
		orderscommoditydetailsDao.save(orders);
	}
	
	public OrdersCommodityDetails findById(OrdersCommodityDetails orders){
		return orderscommoditydetailsDao.findById(orders);
	}
	
	public int isunitexit(int unitid){
		return orderscommoditydetailsDao.isunitexit(unitid);
	}
	public List<OrdersCommodityDetails> findByids(String c_id) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.findByids(c_id);
	}
	public List<OrdersCommodityDetails>  findOrdersCommodityDetails(OrdersCommodityDetails ordersCommodityDetails){
		return orderscommoditydetailsDao.findOrdersCommodityDetails(ordersCommodityDetails);
	}
	public OrdersCommodityDetails findbycommodity(
			OrdersCommodityDetails orcdetail) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.findbycommodity(orcdetail);
	}
	public List<OrdersCommodityDetails> findCommdoitybyorderbh(String o_bh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.findCommdoitybyorderbh(o_bh);
	}
	public List<OrdersCommodityDetails> getList(OrdersCommodityDetails orders,
			String xdstartime, String xdendtime, String fkstratime,
			String fkendtime, String kddh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.getList(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh);
	}
	public int getCount(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.getCount(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh);
	}
	public List queryList(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.queryList(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh);
	}
	public int queryListcount(OrdersCommodityDetails orders, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime, String kddh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.queryListcount(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh);
	}
	public double queryListsumprice(OrdersCommodityDetails orders,
			String xdstartime, String xdendtime, String fkstratime,
			String fkendtime, String kddh) {
		// TODO Auto-generated method stub
		return orderscommoditydetailsDao.queryListsumprice(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh);
	}
}
