package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.StockInventoryDao;
import com.cisoft.model.StockInventory;

@Component("stockInventoryService")
@Transactional
public class StockInventoryService {
	@Resource
	private StockInventoryDao stockInventoryDao;
	
	public int getCount(StockInventory stockInventory,String xdstartime,String xdendtime,String fkstratime,String fkendtime){
		return stockInventoryDao.getCount(stockInventory,xdstartime,xdendtime,fkstratime,fkendtime);
	}
	public List<StockInventory> getList(StockInventory stockInventory,String xdstartime,String xdendtime,String fkstratime,String fkendtime){
		return stockInventoryDao.getList(stockInventory,xdstartime,xdendtime,fkstratime,fkendtime);
	}
	
	public void save(StockInventory stockInventory){
		stockInventoryDao.save(stockInventory);
	}
	
	public StockInventory findById(StockInventory stockInventory){
		return stockInventoryDao.findById(stockInventory);
	}
	
	public int isunitexit(int unitid){
		return stockInventoryDao.isunitexit(unitid);
	}
	public List<StockInventory> findgyxlist() {
		// TODO Auto-generated method stub
		return stockInventoryDao.findgyxlist();
	}
	public StockInventory findBycommdity(StockInventory si) {
		// TODO Auto-generated method stub
		return stockInventoryDao.findBycommdity(si);
	}
	public List queryList(StockInventory stockInventory, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime) {
		// TODO Auto-generated method stub
		return stockInventoryDao.queryList(stockInventory,xdstartime,xdendtime,fkstratime,fkendtime);
	}
}
