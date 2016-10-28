package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityLabel;
@Component("commodityLabelDao")
public class CommodityLabelDao {

	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	

	public int getCount(CommodityLabel gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityLabel where cl_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCl_name()!=null&&!"".equals(gysinfo.getCl_name())){
				sql.append(" and cl_name like '%"+gysinfo.getCl_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityLabel> getList(CommodityLabel gysinfo){
		StringBuilder sql=new StringBuilder("from CommodityLabel  where cl_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCl_name()!=null&&!"".equals(gysinfo.getCl_name())){
				sql.append(" and cl_name like '%"+gysinfo.getCl_name().trim()+"%'");
			}
		}
		sql.append(" order by cl_id desc");
		List<CommodityLabel> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommodityLabel GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommodityLabel findById(CommodityLabel GYSInfo){
		return hibernateTemplate.get(CommodityLabel.class,GYSInfo.getCl_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityLabel where cl_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityLabel> findbrandlist() {
		StringBuilder sql=new StringBuilder("from CommodityLabel  where cl_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<CommodityLabel> findbrandlistby(CommodityLabel cbrand) {
		StringBuilder sql=new StringBuilder("from CommodityLabel  where cl_scbs=1");
		if(cbrand!=null){
			if(cbrand.getCl_id()!=0){
				sql.append(" and _parentId="+cbrand.getCl_id());
			}
			
		}
		List<CommodityLabel> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<CommodityLabel>();
	}
}
