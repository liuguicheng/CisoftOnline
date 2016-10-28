package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.GYSInfo;
@Component("gysDao")
public class GysDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(GYSInfo gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from GYSInfo where g_scbs=1");
		if(gysinfo.getG_name()!=null&&!gysinfo.getG_name().equals("")){
        	sql.append(" and g_name like '%"+gysinfo.getG_name().trim()+"%'");
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<GYSInfo> getList(GYSInfo gysinfo){
		StringBuilder sql=new StringBuilder("from GYSInfo  where g_scbs=1");
        if(gysinfo.getG_name()!=null&&!gysinfo.getG_name().equals("")){
        	sql.append(" and g_name like '%"+gysinfo.getG_name().trim()+"%'");
        }
		sql.append(" order by g_id desc");
		List<GYSInfo> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(GYSInfo GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public GYSInfo findById(GYSInfo GYSInfo){
		return hibernateTemplate.get(GYSInfo.class,GYSInfo.getG_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from GYSInfo where g_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<GYSInfo> findgyxlist() {
		StringBuilder sql=new StringBuilder("from GYSInfo  where g_scbs=1");
		List<GYSInfo> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
