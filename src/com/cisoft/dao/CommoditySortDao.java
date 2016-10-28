package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommoditySort;

@Component("commoditysortDao")
public class CommoditySortDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommoditySort gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommoditySort where cs_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCs_name()!=null&&!"".equals(gysinfo.getCs_name())){
				sql.append(" and cs_name like '%"+gysinfo.getCs_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommoditySort> getList(CommoditySort gysinfo){
		StringBuilder sql=new StringBuilder("from CommoditySort  where cs_scbs=1 ");
		
		if(gysinfo!=null){
			if(gysinfo.getCs_name()!=null&&!"".equals(gysinfo.getCs_name())){
				sql.append(" and cs_name like '%"+gysinfo.getCs_name().trim()+"%'");
			}
			if(gysinfo.get_parentId()!=0){
				sql.append(" and _parentId="+gysinfo.get_parentId());
			}
		}
		
		sql.append(" order by cs_px desc");
		List<CommoditySort> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommoditySort GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommoditySort findById(CommoditySort GYSInfo){
		return hibernateTemplate.get(CommoditySort.class,GYSInfo.getCs_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommoditySort where cs_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommoditySort> findParent() {
		String sql="from CommoditySort where cs_scbs=1";
		return hibernateTemplate.find(sql);
	}
	public List<CommoditySort> findParentby(CommoditySort cbrand) {
		StringBuilder sql=new StringBuilder("from CommoditySort where cs_scbs=1");
		if(cbrand!=null){
			if(cbrand.getCs_id()!=0){
				sql.append(" and _parentId="+cbrand.getCs_id());
			}
		}
		List<CommoditySort> cslist=hibernateTemplate.find(sql.toString());
		if(cslist!=null){
			return cslist;
		}
		return new ArrayList<CommoditySort>();
	
	}
}
