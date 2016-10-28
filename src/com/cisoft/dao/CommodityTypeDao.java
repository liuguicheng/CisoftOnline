package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityType;

@Component("commodityTypeDao")
public class CommodityTypeDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommodityType gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityType where ct_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCt_name()!=null&&!"".equals(gysinfo.getCt_name().trim())){
				sql.append(" and ct_name like '%"+gysinfo.getCt_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityType> getList(CommodityType gysinfo){
		StringBuilder sql=new StringBuilder("from CommodityType  where ct_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCt_name()!=null&&!"".equals(gysinfo.getCt_name().trim())){
				sql.append(" and ct_name like '%"+gysinfo.getCt_name().trim()+"%'");
			}
		}
		sql.append(" order by ct_px desc");
		List<CommodityType> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommodityType GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommodityType findById(CommodityType GYSInfo){
		return hibernateTemplate.get(CommodityType.class,GYSInfo.getCt_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityType where ct_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityType> findTypelist() {
		StringBuilder sql=new StringBuilder("from CommodityType  where ct_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<CommodityType> findTypelistby(CommodityType cType) {
		StringBuilder sql=new StringBuilder("from CommodityType  where ct_scbs=1");
		if(cType!=null){
			if(cType.getCt_id()!=0){
				sql.append(" and ct_id="+cType.getCt_id());
			}
		}
		List<CommodityType> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<CommodityType>();
	}
}
