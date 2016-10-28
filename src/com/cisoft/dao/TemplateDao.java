package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Template;

@Component("templateDao")
public class TemplateDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(Template gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from Template where t_scbs=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Template> getList(Template gysinfo){
		StringBuilder sql=new StringBuilder("from Template  where t_scbs=1 ");
		
		if(gysinfo!=null){
			if(gysinfo.get_parentId()!=0){
				sql.append(" and _parentId="+gysinfo.get_parentId());
			}
		}
		
		sql.append(" order by t_id desc");
		List<Template> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(Template GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public Template findById(Template GYSInfo){
		return hibernateTemplate.get(Template.class,GYSInfo.getT_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Template where t_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Template> findParent() {
		String sql="from Template where t_scbs=1 and _parentId=0";
		return hibernateTemplate.find(sql);
	}
	public List<Template> findParentby(Template cbrand) {
		StringBuilder sql=new StringBuilder("from Template where t_scbs=1");
		if(cbrand!=null){
			if(cbrand.getT_id()!=0){
				sql.append(" and _parentId="+cbrand.getT_id());
			}
		}
		List<Template> cslist=hibernateTemplate.find(sql.toString());
		if(cslist!=null){
			return cslist;
		}
		return new ArrayList<Template>();
	
	}
	public List<Template> findnoParent() {
		String sql="from Template where t_scbs=1 and _parentId!=0";
		return hibernateTemplate.find(sql);
	}
}
