package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CommoditySpec;
import com.cisoft.model.CommoditySpecVlaue;
@Component("commoditSpecDao")
public class CommoditySpecDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(CommoditySpec commoditySpec){
		StringBuilder sql=new StringBuilder("select count(*) from CommoditySpec where 1=1");
        if(commoditySpec!=null){
        	if(commoditySpec.getCp_name()!=null&&!"".equals(commoditySpec.getCp_name().trim())){
        		sql.append(" and cp_name like '%"+commoditySpec.getCp_name().trim()+"%'");
        	}
        }
        
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<CommoditySpec> getList(CommoditySpec commoditySpec){
		StringBuilder sql=new StringBuilder("from CommoditySpec  where 1=1");
		if(commoditySpec!=null){
        	if(commoditySpec.getCp_name()!=null&&!"".equals(commoditySpec.getCp_name().trim())){
        		sql.append(" and cp_name like '%"+commoditySpec.getCp_name().trim()+"%'");
        	}
        }
		List<CommoditySpec> CommoditySpecs= pageList.getPage(sql.toString(), commoditySpec.getFirstsize(), commoditySpec.getRows());
		return CommoditySpecs;
	}
	
	public void save(CommoditySpec commoditySpec){
		hibernateTemplate.saveOrUpdate(commoditySpec);
	}
	
	public CommoditySpec findById(CommoditySpec commoditySpec){
		return hibernateTemplate.get(CommoditySpec.class,commoditySpec.getCp_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from CommoditySpec  ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<CommoditySpec> findlist(CommoditySpec cspec) {
		StringBuilder sql=new StringBuilder("from CommoditySpec  where 1=1");
		if(cspec!=null){
			if(cspec.getCp_id()!=0){
				sql.append(" and cp_id="+cspec.getCp_id());
			}
		}
		List<CommoditySpec> CommoditySpecs=hibernateTemplate.find(sql.toString());
		return CommoditySpecs;
	}
	public void delete(CommoditySpec cbrandinfo) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(cbrandinfo);
	}
	public void savespecval(CommoditySpecVlaue cs) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(cs);
	}
	public List<CommoditySpecVlaue> findspecvallist(CommoditySpec cspec) {
		StringBuilder sql=new StringBuilder("from CommoditySpecVlaue  where 1=1");
		if(cspec!=null){
			if(cspec.getCp_id()!=0){
				sql.append(" and commoditySpec.cp_id="+cspec.getCp_id());
			}
		}
		sql.append(" order by cpv_xh desc");
		List<CommoditySpecVlaue> CommoditySpecs=hibernateTemplate.find(sql.toString());
		return CommoditySpecs;
	}
	public void deletespecval(CommoditySpecVlaue cspec) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(cspec);
	}
	
	
}
