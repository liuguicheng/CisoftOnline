package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Purchase;
@Component("purchaseDao")
public class PurchaseDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Purchase purchase, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("select count(*) from Purchase where p_scbs=1");
		if(purchase!=null){
			if(purchase.getP_zt()!=0){
				sql.append(" and p_zt="+purchase.getP_zt());
			}
			if(purchase.getStoreroom()!=null){
				if(purchase.getStoreroom().getS_id()!=-1){
				sql.append(" and storeroom.s_id="+purchase.getStoreroom().getS_id());
				}
			}
			if(purchase.getP_no()!=null&&!"".equals(purchase.getP_no())){
				sql.append(" and p_no like '%"+purchase.getP_no().trim()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and p_zdDate >='"+xdstartime+"' and  p_zdDate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and p_zdDate <'"+xdendtime+"'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Purchase> getList(Purchase purchase, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("from Purchase  where p_scbs=1");
		if(purchase!=null){
			if(purchase.getP_zt()!=0){
				sql.append(" and p_zt="+purchase.getP_zt());
			}
			if(purchase.getStoreroom()!=null){
				if(purchase.getStoreroom().getS_id()!=-1){
					sql.append(" and storeroom.s_id="+purchase.getStoreroom().getS_id());
					}
			}
			if(purchase.getP_no()!=null&&!"".equals(purchase.getP_no())){
				sql.append(" and p_no like '%"+purchase.getP_no().trim()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and p_zdDate >='"+xdstartime+"' and  p_zdDate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and p_zdDate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by p_zdDate desc");
		List<Purchase> Purchases= pageList.getPage(sql.toString(), purchase.getFirstsize(), purchase.getRows());
		return Purchases;
	}
	
	public void save(Purchase Purchase){
		hibernateTemplate.saveOrUpdate(Purchase);
	}
	
	public Purchase findById(Purchase Purchase){
		return hibernateTemplate.get(Purchase.class,Purchase.getP_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Purchase where p_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Purchase> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Purchase  where p_scbs=1");
		List<Purchase> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public Purchase findbyno(String p_no) {
		StringBuilder sql=new StringBuilder("from Purchase  where p_scbs=1");
		if(p_no!=null){
			sql.append(" and p_no='"+p_no+"'");
		}
		List<Purchase> gyslist= hibernateTemplate.find(sql.toString());
		if(gyslist.size()>0){
			return gyslist.get(0);
		}
		return null;
	}
	public List findpcorder(Purchase purchase, String xdstartime, String xdendtime) {
		StringBuilder sql=new StringBuilder("from Purchase  where p_scbs=1");
		if(purchase!=null){
			if(purchase.getP_zt()!=0){
				sql.append(" and p_zt="+purchase.getP_zt());
			}
			if(purchase.getStoreroom()!=null){
				if(purchase.getStoreroom().getS_id()!=-1){
					sql.append(" and storeroom.s_id="+purchase.getStoreroom().getS_id());
					}
			}
			if(purchase.getP_no()!=null&&!"".equals(purchase.getP_no())){
				sql.append(" and p_no like '%"+purchase.getP_no().trim()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and p_zdDate >='"+xdstartime+"' and  p_zdDate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and p_zdDate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by p_zdDate desc");
		List<Purchase> Purchases= hibernateTemplate.find(sql.toString());
		return Purchases;
	}
	
}
