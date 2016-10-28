package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.OutStock;
@Component("outstockDao")
public class OutStockDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(OutStock outStock){
		StringBuilder sql=new StringBuilder("select count(*) from OutStock where os_scbs=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<OutStock> getList(OutStock outStock){
		StringBuilder sql=new StringBuilder("from OutStock  where os_scbs=1");
		sql.append(" order by os_ckdate desc");
		List<OutStock> OutStocks= pageList.getPage(sql.toString(), outStock.getFirstsize(), outStock.getRows());
		return OutStocks;
	}
	
	public void save(OutStock OutStock){
		hibernateTemplate.saveOrUpdate(OutStock);
	}
	
	public OutStock findById(OutStock outStock){
		return hibernateTemplate.get(OutStock.class,outStock.getOs_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from OutStock where os_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<OutStock> findgyxlist() {
		StringBuilder sql=new StringBuilder("from OutStock  where os_scbs=1");
		List<OutStock> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
