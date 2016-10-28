package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Storehouse;
@Component("storehouseDao")
public class StorehouseDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Storehouse storehouse){
		StringBuilder sql=new StringBuilder("select count(*) from Storehouse where sh_scbs=1");
		if(storehouse.getSh_address()!=null){
			sql.append(" and sh_address like '%"+storehouse.getSh_address().trim()+"%'");
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Storehouse> getList(Storehouse storehouse){
		StringBuilder sql=new StringBuilder("from Storehouse  where sh_scbs=1");
		if(storehouse.getSh_address()!=null){
			sql.append(" and sh_address like '%"+storehouse.getSh_address().trim()+"%'");
		}
		sql.append(" order by sh_id desc");
		List<Storehouse> Storehouses= pageList.getPage(sql.toString(), storehouse.getFirstsize(), storehouse.getRows());
		return Storehouses;
	}
	
	public void save(Storehouse Storehouse){
		hibernateTemplate.saveOrUpdate(Storehouse);
	}
	
	public Storehouse findById(Storehouse storehouse){
		return hibernateTemplate.get(Storehouse.class,storehouse.getSh_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Storehouse where sh_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Storehouse> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Storehouse  where sh_scbs=1");
		List<Storehouse> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
