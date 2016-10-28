package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Distribution;
@Component("distributionDao")
public class DistributionDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Distribution distribution){
		StringBuilder sql=new StringBuilder("select count(*) from Distribution where d_scbs=1");
		if(distribution.getD_name()!=null&&!distribution.getD_name().equals("")){
        	sql.append(" and d_name like '%"+distribution.getD_name().trim()+"%'");
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Distribution> getList(Distribution distribution){
		StringBuilder sql=new StringBuilder("from Distribution  where d_scbs=1");
		if(distribution.getD_name()!=null&&!distribution.getD_name().equals("")){
        	sql.append(" and d_name like '%"+distribution.getD_name().trim()+"%'");
        }
		sql.append(" order by d_id desc");
		List<Distribution> Distributions= pageList.getPage(sql.toString(), distribution.getFirstsize(), distribution.getRows());
		return Distributions;
	}
	
	public void save(Distribution distribution){
		hibernateTemplate.saveOrUpdate(distribution);
	}
	
	public Distribution findById(Distribution distribution){
		return hibernateTemplate.get(Distribution.class,distribution.getD_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Distribution where d_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Distribution> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Distribution  where d_scbs=1");
		List<Distribution> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
