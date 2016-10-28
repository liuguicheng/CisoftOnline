package com.cisoft.dao;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityP;
@Component("commoditPDao")
public class CommodityPDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	
	public void save(CommodityP commodity){
		hibernateTemplate.saveOrUpdate(commodity);
	}
	
	public CommodityP findById(CommodityP commodity){
		return hibernateTemplate.get(CommodityP.class,commodity.getCp_id());
	}
	
	public List<CommodityP> findCommodityPlist(CommodityP commodity){
		if(commodity!=null){
			StringBuilder sql=new StringBuilder("from CommodityP  where cp_scbs=1");
	        if(commodity.getCommodity()!=null){
	        	sql.append(" and commodity.c_id="+commodity.getCommodity().getC_id());
	        }
			sql.append(" order by cp_id desc");
			List<CommodityP> commodityps= hibernateTemplate.find(sql.toString());
			return commodityps;
		}
		
		return null;
	}
	
	
	
}
