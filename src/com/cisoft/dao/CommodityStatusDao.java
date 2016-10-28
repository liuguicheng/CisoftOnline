package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityStatus;

@Component("commoditystatusDao")
public class CommodityStatusDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommodityStatus gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityStatus where cs_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCs_name()!=null&&!"".equals(gysinfo.getCs_name())){
				sql.append(" and cs_name like '%"+gysinfo.getCs_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityStatus> getList(CommodityStatus gysinfo){
		StringBuilder sql=new StringBuilder("from CommodityStatus  where cs_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCs_name()!=null&&!"".equals(gysinfo.getCs_name())){
				sql.append(" and cs_name like '%"+gysinfo.getCs_name().trim()+"%'");
			}
		}
		sql.append(" order by cs_id desc");
		List<CommodityStatus> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommodityStatus GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommodityStatus findById(CommodityStatus GYSInfo){
		return hibernateTemplate.get(CommodityStatus.class,GYSInfo.getCs_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityStatus where cs_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityStatus> findstatus() {
		StringBuilder sql=new StringBuilder("from CommodityStatus where cs_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
}
