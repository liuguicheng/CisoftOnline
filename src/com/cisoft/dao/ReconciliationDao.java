package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Reconciliation;
@Component("reconciliationDao")
public class ReconciliationDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Reconciliation Reconciliation){
		StringBuilder sql=new StringBuilder("select count(*) from Reconciliation where r_scbs=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Reconciliation> getList(Reconciliation Reconciliation){
		StringBuilder sql=new StringBuilder("from Reconciliation  where r_scbs=1");
		sql.append(" order by r_id desc");
		List<Reconciliation> Reconciliations= pageList.getPage(sql.toString(), Reconciliation.getFirstsize(), Reconciliation.getRows());
		return Reconciliations;
	}
	
	public void save(Reconciliation Reconciliation){
		hibernateTemplate.saveOrUpdate(Reconciliation);
	}
	
	public Reconciliation findById(Reconciliation Reconciliation){
		return hibernateTemplate.get(Reconciliation.class,Reconciliation.getR_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Reconciliation where r_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Reconciliation> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Reconciliation  where r_scbs=1");
		List<Reconciliation> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
