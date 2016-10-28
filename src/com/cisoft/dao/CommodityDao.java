package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.jk.ServiceHallPhoto;
import com.cisoft.model.Commodity;
import com.cisoft.model.GYSInfo;
@Component("commoditDao")
public class CommodityDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Commodity commodity){
		StringBuilder sql=new StringBuilder("select count(*) from Commodity where c_scbs=1");
        
        if(commodity.getGysInfo()!=null){
        	if(commodity.getGysInfo().getG_id()!=0){
        	sql.append(" and gysInfo.g_id="+commodity.getGysInfo().getG_id());
        	}
        }
        if(commodity.getC_name()!=null&&!commodity.getC_name().equals("")){
        	sql.append(" and c_name like '%"+commodity.getC_name()+"%'");
        }
        if(commodity.getC_sj()!=0){
        	sql.append(" and c_sj="+commodity.getC_sj());
        }
        if(commodity.getCommodityBrand()!=null){
        	if(commodity.getCommodityBrand().getCb_id()!=0){
        		sql.append(" and commodityBrand.cb_id="+commodity.getCommodityBrand().getCb_id());
        	}
        	
        }
        if(commodity.getCommodlabel()!=null){
        	if(commodity.getCommodlabel().getCl_id()!=0){
        		sql.append(" and commodlabel.cl_id="+commodity.getCommodlabel().getCl_id());
        	}
        	
        }
        if(commodity.getCommodityStatus()!=null){
        	if(commodity.getCommodityStatus().getCs_id()!=0){
        		sql.append(" and commodityStatus.cs_id="+commodity.getCommodityStatus().getCs_id());
        	}
        	
        }
        if(commodity.getCommoditySort()!=null){
        	if(commodity.getCommoditySort().getCs_id()!=0){
        		sql.append(" and commoditySort.cs_id="+commodity.getCommoditySort().getCs_id());
        	}
        	
        }
        if(commodity.getC_spbh()!=null){
        	if(!"".equals(commodity.getC_spbh())){
        		sql.append(" and c_spbh='"+commodity.getC_spbh()+"'");
        	}
        	
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Commodity> getList(Commodity commodity){
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
        
        if(commodity.getGysInfo()!=null){
        	if(commodity.getGysInfo().getG_id()!=0){
        	sql.append(" and gysInfo.g_id="+commodity.getGysInfo().getG_id());
        	}
        }
        if(commodity.getC_name()!=null&&!commodity.getC_name().equals("")){
        	sql.append(" and c_name like '%"+commodity.getC_name()+"%'");
        }
        if(commodity.getC_sj()!=0){
        	sql.append(" and c_sj="+commodity.getC_sj());
        }
        if(commodity.getCommodityBrand()!=null){
        	if(commodity.getCommodityBrand().getCb_id()!=0){
        		sql.append(" and commodityBrand.cb_id="+commodity.getCommodityBrand().getCb_id());
        	}
        	
        }
        if(commodity.getCommodlabel()!=null){
        	if(commodity.getCommodlabel().getCl_id()!=0){
        		sql.append(" and commodlabel.cl_id="+commodity.getCommodlabel().getCl_id());
        	}
        	
        }
        if(commodity.getCommodityStatus()!=null){
        	if(commodity.getCommodityStatus().getCs_id()!=0){
        		sql.append(" and commodityStatus.cs_id="+commodity.getCommodityStatus().getCs_id());
        	}
        	
        }
        if(commodity.getCommoditySort()!=null){
        	if(commodity.getCommoditySort().getCs_id()!=0){
        		sql.append(" and commoditySort.cs_id="+commodity.getCommoditySort().getCs_id());
        	}
        	
        }
        if(commodity.getC_spbh()!=null){
        	if(!"".equals(commodity.getC_spbh())){
        		sql.append(" and c_spbh='"+commodity.getC_spbh()+"'");
        	}
        	
        }
		sql.append(" order by c_id desc");
		List<Commodity> commoditys= pageList.getPage(sql.toString(), commodity.getFirstsize(), commodity.getRows());
		return commoditys;
	}
	
	public void save(Commodity commodity){
		hibernateTemplate.saveOrUpdate(commodity);
	}
	
	public Commodity findById(Commodity commodity){
		return hibernateTemplate.get(Commodity.class,commodity.getC_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Commodity where c_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Commodity> getLists(Commodity commodity) {
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
		if(commodity.getGysInfo()!=null){
			if(commodity.getGysInfo().getG_id()!=0){
				sql.append(" and gysInfo.g_id="+commodity.getGysInfo().getG_id());
			}
        }
        if(commodity.getC_name()!=null&&!commodity.getC_name().equals("")){
        	sql.append(" and c_name like '%"+commodity.getC_name()+"%'");
        }
        if(commodity.getC_sj()!=0){
        	sql.append(" and c_sj="+commodity.getC_sj());
        }
        if(commodity.getCommodityBrand()!=null){
        	if(commodity.getCommodityBrand().getCb_id()!=0){
        		sql.append(" and commodityBrand.cb_id="+commodity.getCommodityBrand().getCb_id());
        	}
        	
        }
        if(commodity.getCommodlabel()!=null){
        	if(commodity.getCommodlabel().getCl_id()!=0){
        		sql.append(" and commodlabel.cl_id="+commodity.getCommodlabel().getCl_id());
        	}
        	
        }
        if(commodity.getCommodityStatus()!=null){
        	if(commodity.getCommodityStatus().getCs_id()!=0){
        		sql.append(" and commodityStatus.cs_id="+commodity.getCommodityStatus().getCs_id());
        	}
        	
        }
        if(commodity.getCommoditySort()!=null){
        	if(commodity.getCommoditySort().getCs_id()!=0){
        		sql.append(" and commoditySort.cs_id="+commodity.getCommoditySort().getCs_id());
        	}
        	
        }
        if(commodity.getC_spbh()!=null){
        	if(!"".equals(commodity.getC_spbh())){
        		sql.append(" and c_spbh='"+commodity.getC_spbh()+"'");
        	}
        	
        }
		sql.append(" order by c_id desc");
		List<Commodity> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public List<Commodity> findlist() {
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
		sql.append(" order by c_id desc");
		List<Commodity> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public Commodity findBybh(String spbh) {
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
		sql.append(" and c_spbh='"+spbh+"'");
		List<Commodity> commoditys= hibernateTemplate.find(sql.toString());
		if(commoditys.size()>0){
			return commoditys.get(0);
		}
		return null;
	}
	public List<Commodity> findbymoid(ServiceHallPhoto serviceHallPhoto) {
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
		if(serviceHallPhoto!=null){
			if(serviceHallPhoto.getId()!=null){
				sql.append(" and c_spbh='"+serviceHallPhoto.getId()+"'");
			}
			if(serviceHallPhoto.getName()!=null){
				sql.append(" and c_name like '%"+serviceHallPhoto.getName()+"%'");
			}
		}
		List<Commodity> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public List<Commodity> findlist(Commodity commodity) {
		StringBuilder sql=new StringBuilder("from Commodity  where c_scbs=1");
		if(commodity!=null){
			if(commodity.getCommoditySort()!=null){
				sql.append(" and commoditySort.cs_id="+commodity.getCommoditySort().getCs_id());
			}
			if(commodity.getC_name()!=null){
				sql.append(" and c_name like '%"+commodity.getC_name().trim()+"%'");
			}
			if(commodity.getC_sj()!=0){
				sql.append(" and c_sj="+commodity.getC_sj());
			}
		}
		List<Commodity> commoditys= hibernateTemplate.find(sql.toString());
		return commoditys;
	}
	public int findlistcount(Commodity commodity) {
		StringBuilder sql=new StringBuilder("select count(*) from Commodity where c_scbs=1");
		if(commodity.getC_sj()!=0){
        	sql.append(" and c_sj="+commodity.getC_sj());
        }
        
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	
}
