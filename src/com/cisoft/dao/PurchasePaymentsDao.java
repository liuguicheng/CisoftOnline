package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.PurchasePayments;
@Component("purchasepaymentsDao")
public class PurchasePaymentsDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(PurchasePayments PurchasePayments, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("select count(*) from PurchasePayments where pp_scbs=1");
		if(PurchasePayments.getPp_no()!=null){
			if(PurchasePayments.getPp_no()!=null){
				sql.append(" and pp_no like '%"+PurchasePayments.getPp_no().trim()+"%'");
			}
			if(PurchasePayments.getPp_zflx()!=0){
				sql.append(" and pp_zflx="+PurchasePayments.getPp_zflx());
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and pp_fkdate >='"+xdstartime+"' and  pp_fkdate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pp_fkdate <'"+xdendtime+"'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<PurchasePayments> getList(PurchasePayments PurchasePayments, String xdstartime, String xdendtime){
		StringBuilder sql=new StringBuilder("from PurchasePayments  where pp_scbs=1");
		if(PurchasePayments!=null){
			if(PurchasePayments.getPp_no()!=null){
				sql.append(" and pp_no like '%"+PurchasePayments.getPp_no().trim()+"%'");
			}
			if(PurchasePayments.getPp_zflx()!=0){
				sql.append(" and pp_zflx="+PurchasePayments.getPp_zflx());
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and pp_fkdate >='"+xdstartime+"' and  pp_fkdate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pp_fkdate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by pp_id desc");
		List<PurchasePayments> PurchasePaymentss= pageList.getPage(sql.toString(), PurchasePayments.getFirstsize(), PurchasePayments.getRows());
		return PurchasePaymentss;
	}
	
	public void save(PurchasePayments PurchasePayments){
		hibernateTemplate.saveOrUpdate(PurchasePayments);
	}
	
	public PurchasePayments findById(PurchasePayments PurchasePayments){
		return hibernateTemplate.get(PurchasePayments.class,PurchasePayments.getPp_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from PurchasePayments where pp_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<PurchasePayments> findgyxlist() {
		StringBuilder sql=new StringBuilder("from PurchasePayments  where pp_scbs=1");
		List<PurchasePayments> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public List findlistby(PurchasePayments gys, String xdstartime,
			String xdendtime) {
		StringBuilder sql=new StringBuilder("from PurchasePayments  where pp_scbs=1");
		if(gys!=null){
			if(gys.getPp_no()!=null){
				sql.append(" and pp_no like '%"+gys.getPp_no().trim()+"%'");
			}
			if(gys.getPp_zflx()!=0){
				sql.append(" and pp_zflx="+gys.getPp_zflx());
			}
		}
		if(xdstartime!=null&&xdendtime!=null){
			if(!xdstartime.equals("")&&!xdendtime.equals("")){
//				sql.append(" and ( order.o_startTime between STR_TO_DATE('"+xdstartime+"','%Y-%m-%d') and STR_TO_DATE('"+xdendtime+"','%Y-%m-%d') )");
				sql.append(" and pp_fkdate >='"+xdstartime+"' and  pp_fkdate<='"+xdendtime+"'");
			}else if(xdstartime.equals("")&&!xdendtime.equals("")){
				sql.append(" and pp_fkdate <'"+xdendtime+"'");
			}
		}
		sql.append(" order by pp_id desc");
		List<PurchasePayments> PurchasePaymentss= this.hibernateTemplate.find(sql.toString());
		return PurchasePaymentss;
	}
	
}
