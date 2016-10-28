package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.StockInventory;
@Component("stockInventoryDao")
public class StockInventoryDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(StockInventory stockInventory,String xdstartime,String xdendtime,String fkstratime,String fkendtime){
		StringBuilder sql=new StringBuilder("select count(*) from StockInventory where si_scbs=1");
		if(stockInventory!=null){
			if(stockInventory.getSi_zt()!=0){
				sql.append(" and si_zt="+stockInventory.getSi_zt());
			}
			if(stockInventory.getCommodity()!=null){
				if(stockInventory.getCommodity().getC_name()!=null){
					sql.append(" and commodity.c_name like '%"+stockInventory.getCommodity().getC_name().trim()+"%'");
				}
			}
			if(stockInventory.getStoreroom()!=null){
				if(stockInventory.getStoreroom().getS_id()!=0){
					sql.append(" and storeroom.s_id="+stockInventory.getStoreroom().getS_id());
				}
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date >='"+xdstartime+"' and  si_date<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
			sql.append(" and si_lastckdate >='"+fkstratime+"' and  si_lastckdate <='"+fkendtime+"'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<StockInventory> getList(StockInventory stockInventory,String xdstartime,String xdendtime,String fkstratime,String fkendtime){
		StringBuilder sql=new StringBuilder("from StockInventory  where si_scbs=1");
		if(stockInventory!=null){
			if(stockInventory.getSi_zt()!=0){
				sql.append(" and si_zt="+stockInventory.getSi_zt());
			}
			if(stockInventory.getCommodity()!=null){
				if(stockInventory.getCommodity().getC_name()!=null){
					sql.append(" and commodity.c_name like '%"+stockInventory.getCommodity().getC_name().trim()+"%'");
				}
			}
			if(stockInventory.getStoreroom()!=null){
				if(stockInventory.getStoreroom().getS_id()!=0){
					sql.append(" and storeroom.s_id="+stockInventory.getStoreroom().getS_id());
				}
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date >='"+xdstartime+"' and  si_date<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
			sql.append(" and si_lastckdate >='"+fkstratime+"' and  si_lastckdate <='"+fkendtime+"'");
			}
		}
		sql.append(" order by si_date desc");
		List<StockInventory> StockInventorys= pageList.getPage(sql.toString(), stockInventory.getFirstsize(), stockInventory.getRows());
		return StockInventorys;
	}
	
	public void save(StockInventory StockInventory){
		hibernateTemplate.saveOrUpdate(StockInventory);
	}
	
	public StockInventory findById(StockInventory stockInventory){
		return hibernateTemplate.get(StockInventory.class,stockInventory.getSi_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from StockInventory where si_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<StockInventory> findgyxlist() {
		StringBuilder sql=new StringBuilder("from StockInventory  where si_scbs=1");
		List<StockInventory> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public StockInventory findBycommdity(StockInventory si) {
		StringBuilder sql=new StringBuilder("from StockInventory  where si_scbs=1");
		if(si.getCommodity()!=null){
			sql.append(" and commodity.c_id="+si.getCommodity().getC_id());
		}
		if(si.getStoreroom()!=null){
			sql.append(" and storeroom.s_id="+si.getStoreroom().getS_id());
		}
		sql.append(" order by si_id desc");
		List<StockInventory> silist= hibernateTemplate.find(sql.toString());
		if(silist.size()>0){
			return silist.get(0);
		}
		return null;
	}
	public List queryList(StockInventory stockInventory, String xdstartime,
			String xdendtime, String fkstratime, String fkendtime) {
		StringBuilder sql=new StringBuilder("from StockInventory  where si_scbs=1");
		if(stockInventory!=null){
			if(stockInventory.getSi_zt()!=0){
				sql.append(" and si_zt="+stockInventory.getSi_zt());
			}
			if(stockInventory.getCommodity()!=null){
				if(stockInventory.getCommodity().getC_name()!=null){
					sql.append(" and commodity.c_name like '%"+stockInventory.getCommodity().getC_name().trim()+"%'");
				}
			}
			if(stockInventory.getStoreroom()!=null){
				if(stockInventory.getStoreroom().getS_id()!=0){
					sql.append(" and storeroom.s_id="+stockInventory.getStoreroom().getS_id());
				}
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date >='"+xdstartime+"' and  si_date<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and si_date <'"+xdendtime+"'");
			}
		}
		if(fkstratime!=null&&fkendtime!=null){
			if(!fkstratime.equals("")&&!fkendtime.equals("")){
			sql.append(" and si_lastckdate >='"+fkstratime+"' and  si_lastckdate <='"+fkendtime+"'");
			}
		}
		sql.append(" order by si_date desc");
		List<StockInventory> StockInventorys= this.hibernateTemplate.find(sql.toString());
		return StockInventorys;
	}
	
}
