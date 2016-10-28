package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityBinding;

@Component("commodityBindingDao")
public class CommodityBindingDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(CommodityBinding gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityBinding where cb_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCb_zid()!=0){
				sql.append(" and cb_zid="+gysinfo.getCb_zid());
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityBinding> getList(CommodityBinding gysinfo){
		StringBuilder sql=new StringBuilder("from CommodityBinding  where cb_scbs=1");
		if(gysinfo!=null){
			if(gysinfo.getCb_zid()!=0){
				sql.append(" and cb_zid="+gysinfo.getCb_zid());
			}
		}
		sql.append(" order by cb_id desc");
		List<CommodityBinding> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(CommodityBinding GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public CommodityBinding findById(CommodityBinding GYSInfo){
		return hibernateTemplate.get(CommodityBinding.class,GYSInfo.getCb_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityBinding where cb_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityBinding> findbrandlist(CommodityBinding commodityBinding) {
		StringBuilder sql=new StringBuilder("from CommodityBinding  where cb_scbs=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<CommodityBinding> findbrandlistby(CommodityBinding cbrand) {
		StringBuilder sql=new StringBuilder("from CommodityBinding  where cb_scbs=1");
		if(cbrand!=null){
			if(cbrand.getCb_zid()!=0){
				sql.append(" and cb_zid="+cbrand.getCb_zid());
			}
			
		}
		List<CommodityBinding> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<CommodityBinding>();
	}
}
