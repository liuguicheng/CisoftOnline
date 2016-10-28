package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PurchaseReturn;
@Component("purchasereturnDao")
public class PurchaseReturnDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PurchaseReturn PurchaseReturn, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("select count(*) from PurchaseReturn where pr_scbs=1");
		if(PurchaseReturn!=null){
			if(PurchaseReturn.getPr_no()!=null){
				sql.append(" and pr_no like '%"+PurchaseReturn.getPr_no()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate >='"+xdstartime+"' and  pr_shdate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate <'"+xdendtime+"'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PurchaseReturn> getList(PurchaseReturn PurchaseReturn, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("from PurchaseReturn  where pr_scbs=1");
		if(PurchaseReturn!=null){
			if(PurchaseReturn.getPr_no()!=null){
				sql.append(" and pr_no like '%"+PurchaseReturn.getPr_no()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate >='"+xdstartime+"' and  pr_shdate<'"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by pr_id desc");
		List<PurchaseReturn> PurchaseReturns= pageList.getPage(sql.toString(), PurchaseReturn.getFirstsize(), PurchaseReturn.getRows());
		return PurchaseReturns;
	}
	
	public void save(PurchaseReturn PurchaseReturn){
		hibernateTemplate.saveOrUpdate(PurchaseReturn);
	}
	
	public PurchaseReturn findById(PurchaseReturn PurchaseReturn){
		return hibernateTemplate.get(PurchaseReturn.class,PurchaseReturn.getPr_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PurchaseReturn where pr_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PurchaseReturn> findgyxlist() {
		StringBuilder sql=new StringBuilder("from PurchaseReturn  where pr_scbs=1");
		List<PurchaseReturn> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public List<PurchaseReturn> findlist(PurchaseReturn pr, String xdstartime,
			String xdendtime) {
		StringBuilder sql=new StringBuilder("from PurchaseReturn  where pr_scbs=1");
		if(pr!=null){
			if(pr.getPr_no()!=null){
				sql.append(" and pr_no like '%"+pr.getPr_no()+"%'");
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate >='"+xdstartime+"' and  pr_shdate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pr_shdate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by pr_id desc");
		List<PurchaseReturn> PurchaseReturns= this.hibernateTemplate.find(sql.toString());
		return PurchaseReturns;
	}
	
}
