package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PurchaseReceipt;
import com.cisoft.model.PurchaseReturn;
@Component("purchasereceiptDao")
public class PurchasereceiptDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PurchaseReceipt PurchaseReceipt, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("select count(*) from PurchaseReceipt where pr_scbs=1");
		if(PurchaseReceipt!=null){
			if(PurchaseReceipt.getPr_no()!=null){
				if(!"".equals(PurchaseReceipt.getPr_no())){
				sql.append(" and pr_no like '%"+PurchaseReceipt.getPr_no().trim()+"%'");
				}
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
	public List<PurchaseReceipt> getList(PurchaseReceipt PurchaseReceipt, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("from PurchaseReceipt  where pr_scbs=1");
		if(PurchaseReceipt.getPr_no()!=null){
			if(!"".equals(PurchaseReceipt.getPr_no())){
			sql.append(" and pr_no like '%"+PurchaseReceipt.getPr_no().trim()+"%'");
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
		List<PurchaseReceipt> PurchaseReceipts= pageList.getPage(sql.toString(), PurchaseReceipt.getFirstsize(), PurchaseReceipt.getRows());
		return PurchaseReceipts;
	}
	
	public void save(PurchaseReceipt PurchaseReceipt){
		hibernateTemplate.saveOrUpdate(PurchaseReceipt);
	}
	
	public PurchaseReceipt findById(PurchaseReceipt PurchaseReceipt){
		return hibernateTemplate.get(PurchaseReceipt.class,PurchaseReceipt.getPr_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PurchaseReceipt where pr_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PurchaseReceipt> findgyxlist() {
		StringBuilder sql=new StringBuilder("from PurchaseReceipt  where pr_scbs=1");
		List<PurchaseReceipt> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public List findlist(PurchaseReturn pr, String xdstartime, String xdendtime) {
		StringBuilder sql=new StringBuilder("from PurchaseReceipt  where pr_scbs=1");
		if(pr.getPr_no()!=null){
			if(!"".equals(pr.getPr_no())){
			sql.append(" and pr_no like '%"+pr.getPr_no().trim()+"%'");
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
		List<PurchaseReceipt> PurchaseReceipts= this.hibernateTemplate.find(sql.toString());
		return PurchaseReceipts;
	}
	
}
