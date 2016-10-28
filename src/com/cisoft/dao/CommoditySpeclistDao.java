package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommoditySpeclist;

@Component("commoditySpeclistDao")
public class CommoditySpeclistDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommoditySpeclist gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommoditySpeclist where cls_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCommodity()!=null){
				if(gysinfo.getCommodity().getC_id()!=0){
					sql.append(" and commodity.c_id="+gysinfo.getCommodity().getC_id());
				}
				
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommoditySpeclist> getList(CommoditySpeclist gysinfo){
		StringBuilder sql=new StringBuilder("from CommoditySpeclist  where cls_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCommodity()!=null){
				if(gysinfo.getCommodity().getC_id()!=0){
					sql.append(" and commodity.c_id="+gysinfo.getCommodity().getC_id());
				}
				
			}
		}
		List<CommoditySpeclist> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommoditySpeclist GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommoditySpeclist findById(CommoditySpeclist GYSInfo){
		return hibernateTemplate.get(CommoditySpeclist.class,GYSInfo.getCsl_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommoditySpeclist where cls_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommoditySpeclist> findbrandlist() {
		StringBuilder sql=new StringBuilder("from CommoditySpeclist  where cls_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<CommoditySpeclist> findbrandlistby(CommoditySpeclist gysinfo) {
		StringBuilder sql=new StringBuilder("from CommoditySpeclist  where cls_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCommodity()!=null){
				if(gysinfo.getCommodity().getC_id()!=0){
					sql.append(" and commodity.c_id="+gysinfo.getCommodity().getC_id());
				}
				
			}
		}
		List<CommoditySpeclist> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<CommoditySpeclist>();
	}
}
