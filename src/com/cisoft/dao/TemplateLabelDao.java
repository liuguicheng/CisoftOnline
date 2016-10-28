package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.TemplateLabel;

@Component("templateLabelDao")
public class TemplateLabelDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(TemplateLabel gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from TemplateLabel where tl_scbs=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<TemplateLabel> getList(TemplateLabel gysinfo){
		StringBuilder sql=new StringBuilder("from TemplateLabel  where tl_scbs=1");
		sql.append(" order by tl_id desc");
		List<TemplateLabel> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(TemplateLabel GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public TemplateLabel findById(TemplateLabel GYSInfo){
		return hibernateTemplate.get(TemplateLabel.class,GYSInfo.getTl_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from TemplateLabel where tl_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<TemplateLabel> findbrandlist() {
		StringBuilder sql=new StringBuilder("from TemplateLabel  where tl_scbs=1 and _parentId=0");
		return hibernateTemplate.find(sql.toString());
	}
	public List<TemplateLabel> findbrandlistby(TemplateLabel cbrand) {
		StringBuilder sql=new StringBuilder("from TemplateLabel  where tl_scbs=1");
		if(cbrand!=null){
			if(cbrand.getTl_id()!=0){
				sql.append(" and _parentId="+cbrand.getTl_id());
			}
			if(cbrand.getTl_name()!=null&&!"".equals(cbrand.getTl_name())){
				sql.append(" and tl_name like '%"+cbrand.getTl_name().trim()+"%'");
			}
			
		}
		List<TemplateLabel> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<TemplateLabel>();
	}
}
