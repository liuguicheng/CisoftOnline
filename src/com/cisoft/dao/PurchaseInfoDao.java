package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PurchaseInfo;
@Component("purchaseinfoDao")
public class PurchaseInfoDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PurchaseInfo purchaseInfo){
		StringBuilder sql=new StringBuilder("select count(*) from PurchaseInfo where pi_scbs=1");
		if(purchaseInfo.getPi_no()!=null){
			sql.append(" and pi_no ='"+purchaseInfo.getPi_no()+"'");
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PurchaseInfo> getList(PurchaseInfo purchaseInfo){
		StringBuilder sql=new StringBuilder("from PurchaseInfo  where pi_scbs=1");
		if(purchaseInfo.getPi_no()!=null){
			sql.append(" and pi_no ='"+purchaseInfo.getPi_no()+"'");
		}
		sql.append(" order by pi_id desc");
		List<PurchaseInfo> PurchaseInfos= pageList.getPage(sql.toString(), purchaseInfo.getFirstsize(), purchaseInfo.getRows());
		return PurchaseInfos;
	}
	
	public void save(PurchaseInfo PurchaseInfo){
		hibernateTemplate.saveOrUpdate(PurchaseInfo);
	}
	
	public PurchaseInfo findById(PurchaseInfo PurchaseInfo){
		return hibernateTemplate.get(PurchaseInfo.class,PurchaseInfo.getPi_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PurchaseInfo where pi_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PurchaseInfo> findgyxlist() {
		StringBuilder sql=new StringBuilder("from PurchaseInfo  where pi_scbs=1");
		List<PurchaseInfo> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public List<PurchaseInfo> findbyno(String p_no) {
		StringBuilder sql=new StringBuilder("from PurchaseInfo  where pi_scbs=1");
		if(p_no!=null){
			sql.append(" and pi_no='"+p_no+"'");
		}
		List<PurchaseInfo> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
