package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.StockDao;
import com.cisoft.model.Stock;

@Component("stockService")
@Transactional
public class StockService {
	@Resource
	private StockDao stockDao;
	
	public int getCount(Stock stock){
		return stockDao.getCount(stock);
	}
	public List<Stock> getList(Stock stock){
		return stockDao.getList(stock);
	}
	
	public void save(Stock stock){
		stockDao.save(stock);
	}
	
	public Stock findById(Stock stock){
		return stockDao.findById(stock);
	}
	
	public int isunitexit(int unitid){
		return stockDao.isunitexit(unitid);
	}
	public List<Stock> findgyxlist() {
		// TODO Auto-generated method stub
		return stockDao.findgyxlist();
	}
}
