package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityBrand;

@Component("commoditybrandDao")
public class CommodityBrandDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommodityBrand gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityBrand where cb_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCb_name()!=null&&!"".equals(gysinfo.getCb_name())){
				sql.append(" and cb_name like '%"+gysinfo.getCb_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityBrand> getList(CommodityBrand gysinfo){
		StringBuilder sql=new StringBuilder("from CommodityBrand  where cb_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCb_name()!=null&&!"".equals(gysinfo.getCb_name())){
				sql.append(" and cb_name like '%"+gysinfo.getCb_name().trim()+"%'");
			}
		}
		sql.append(" order by cb_id desc");
		List<CommodityBrand> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommodityBrand GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommodityBrand findById(CommodityBrand GYSInfo){
		return hibernateTemplate.get(CommodityBrand.class,GYSInfo.getCb_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityBrand where cb_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityBrand> findbrandlist() {
		StringBuilder sql=new StringBuilder("from CommodityBrand  where cb_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<CommodityBrand> findbrandlistby(CommodityBrand cbrand) {
		StringBuilder sql=new StringBuilder("from CommodityBrand  where cb_scbs=1");
		if(cbrand!=null){
			if(cbrand.getCb_id()!=0){
				sql.append(" and _parentId="+cbrand.getCb_id());
			}
			
		}
		List<CommodityBrand> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<CommodityBrand>();
	}
}
