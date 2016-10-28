package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PageLayout;

@Component("pageLayoutDao")
public class PageLayoutDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(PageLayout gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from PageLayout where pl_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getPl_name()!=null&&!"".equals(gysinfo.getPl_name())){
			sql.append(" and pl_name like '%"+gysinfo.getPl_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PageLayout> getList(PageLayout gysinfo){
		StringBuilder sql=new StringBuilder("from PageLayout  where pl_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getPl_name()!=null&&!"".equals(gysinfo.getPl_name())){
			sql.append(" and pl_name like '%"+gysinfo.getPl_name().trim()+"%'");
			}
		}
		sql.append(" order by pl_id desc");
		List<PageLayout> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(PageLayout GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public PageLayout findById(PageLayout GYSInfo){
		return hibernateTemplate.get(PageLayout.class,GYSInfo.getPl_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PageLayout where pl_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PageLayout> findbrandlist() {
		StringBuilder sql=new StringBuilder("from PageLayout  where pl_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<PageLayout> findbrandlistby(PageLayout cbrand) {
		StringBuilder sql=new StringBuilder("from PageLayout  where pl_scbs=1");
		
		List<PageLayout> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<PageLayout>();
	}
}
