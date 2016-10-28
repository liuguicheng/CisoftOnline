package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Stock;
@Component("stockDao")
public class StockDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Stock stock){
		StringBuilder sql=new StringBuilder("select count(*) from Stock where s_scbs=1");
		if(stock.getCommodity()!=null){
			sql.append(" and commodity.c_name like '%"+stock.getCommodity().getC_name()+"%'");
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Stock> getList(Stock stock){
		StringBuilder sql=new StringBuilder("from Stock  where s_scbs=1");
		if(stock.getCommodity()!=null){
			sql.append(" and commodity.c_name like '%"+stock.getCommodity().getC_name()+"%'");
		}
		sql.append(" order by s_date desc");
		List<Stock> Stocks= pageList.getPage(sql.toString(), stock.getFirstsize(), stock.getRows());
		return Stocks;
	}
	
	public void save(Stock stock){
		hibernateTemplate.saveOrUpdate(stock);
	}
	
	public Stock findById(Stock stock){
		return hibernateTemplate.get(Stock.class,stock.getSt_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Stock where s_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Stock> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Stock  where s_scbs=1");
		List<Stock> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
