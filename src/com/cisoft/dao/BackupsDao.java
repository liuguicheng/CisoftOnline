package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Backups;
@Component("backupsDao")
public class BackupsDao{
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public void save(Backups backups){
		hibernateTemplate.saveOrUpdate(backups);
	}
	
	public int getCount(Backups backups){
		String sql="select count(*) from Backups";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Backups> getList(Backups backups){
		StringBuilder sql=new StringBuilder("from Backups where 1=1");
		sql.append(" order by id desc");
		List<Backups> lists=pageList.getPage(sql.toString(), backups.getFirstsize(), backups.getRows());
		return lists;
	}
	
	public int isuserexit(int userid){
		String sql="select count(*) from Backups where user.u_id="+userid+"";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
}
