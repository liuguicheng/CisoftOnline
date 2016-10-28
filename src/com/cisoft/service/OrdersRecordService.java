package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.OrdersRecordDao;
import com.cisoft.model.OrdersRecord;


@Component("ordersrecordService")
@Transactional
public class OrdersRecordService {
	@Resource
	private OrdersRecordDao ordersrecordDao;
	
	public int getCount(OrdersRecord OrdersRecord){
		return ordersrecordDao.getCount(OrdersRecord);
	}
	public List<OrdersRecord> getList(OrdersRecord OrdersRecord){
		return ordersrecordDao.getList(OrdersRecord);
	}
	
	public void save(OrdersRecord OrdersRecord){
		ordersrecordDao.save(OrdersRecord);
	}
	
	public OrdersRecord findById(OrdersRecord OrdersRecord){
		return ordersrecordDao.findById(OrdersRecord);
	}
	
	public int isunitexit(int unitid){
		return ordersrecordDao.isunitexit(unitid);
	}
	public List<OrdersRecord> findlistbyorderid(int o_id) {
		// TODO Auto-generated method stub
		return ordersrecordDao.findlistbyorderid(o_id);
	}
}
