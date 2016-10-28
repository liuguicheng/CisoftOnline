package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommodityImg;
import com.cisoft.model.GYSInfo;
@Component("commoditimgDao")
public class CommodityImgDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(CommodityImg commodityimg){
		StringBuilder sql=new StringBuilder("select count(*) from CommodityImg where ci_scbs=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommodityImg> getList(CommodityImg commodityimg){
		StringBuilder sql=new StringBuilder("from CommodityImg  where ci_scbs=1");
		sql.append(" order by ci_id desc");
		List<CommodityImg> commodityimgs= pageList.getPage(sql.toString(), commodityimg.getFirstsize(), commodityimg.getRows());
		return commodityimgs;
	}
	
	public void save(CommodityImg commodityimg){
		hibernateTemplate.saveOrUpdate(commodityimg);
	}
	
	public CommodityImg findById(CommodityImg commodityimg){
		return hibernateTemplate.get(CommodityImg.class,commodityimg.getCi_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommodityImg where ci_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommodityImg> commodityimgDao(CommodityImg commodityImg) {
		StringBuilder sql=new StringBuilder("from CommodityImg  where ci_scbs=1");
				
		if(commodityImg!=null){
			if(commodityImg.getCommodity()!=null){
				sql.append(" and commodity.c_id="+commodityImg.getCommodity().getC_id());
			}
		}
		sql.append(" order by ci_id desc");
		List<CommodityImg> commodityimgs= hibernateTemplate.find(sql.toString());
		return commodityimgs;
	}
	
}
