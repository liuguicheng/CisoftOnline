package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommodityProperty;
@Component("commoditypropertyDao")
public class CommoditypropertyDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(CommodityProperty CommodityProperty){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityProperty where cp_scbs=1");
		if(CommodityProperty!=null){
			if(CommodityProperty.getCp_propertyname()!=null&&!"".equals(CommodityProperty.getCp_propertyname())){
				sql.append(" and cp_propertyname like '%"+CommodityProperty.getCp_propertyname().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityProperty> getList(CommodityProperty CommodityProperty){
		StringBuilder sql=new StringBuilder("from CommodityProperty  where cp_scbs=1");
		if(CommodityProperty!=null){
			if(CommodityProperty.getCp_propertyname()!=null&&!"".equals(CommodityProperty.getCp_propertyname())){
				sql.append(" and cp_propertyname like '%"+CommodityProperty.getCp_propertyname().trim()+"%'");
			}
		}
		
		sql.append(" order by cp_id desc");
		List<CommodityProperty> CommodityPropertys= pageList.getPage(sql.toString(), CommodityProperty.getFirstsize(), CommodityProperty.getRows());
		return CommodityPropertys;
	}
	
	public void save(CommodityProperty CommodityProperty){
		hibernateTemplate.saveOrUpdate(CommodityProperty);
	}
	
	public CommodityProperty findById(CommodityProperty CommodityProperty){
		return hibernateTemplate.get(CommodityProperty.class,CommodityProperty.getCp_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityProperty where cp_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityProperty> findgyxlist() {
		StringBuilder sql=new StringBuilder("from CommodityProperty  where cp_scbs=1");
		List<CommodityProperty> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public List<CommodityProperty> findByIdby(CommodityProperty gys) {
		StringBuilder sql=new StringBuilder("from CommodityProperty  where cp_scbs=1");
		if(gys!=null){
			if(gys.getCp_id()!=0){
				sql.append(" and _parentId="+gys.getCp_id());
			}
		}
		List<CommodityProperty> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
