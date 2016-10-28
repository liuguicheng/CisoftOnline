package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Storeroom;
@Component("storeDao")
public class StoreroomDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Storeroom gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from Storeroom where s_scbs=1");
		if(gysinfo.getS_name()!=null){
			sql.append(" and s_name like '%"+gysinfo.getS_name().trim()+"%'");
			
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Storeroom> getList(Storeroom gysinfo){
		StringBuilder sql=new StringBuilder("from Storeroom  where s_scbs=1");
		if(gysinfo.getS_name()!=null){
			sql.append(" and s_name like '%"+gysinfo.getS_name().trim()+"%'");
			
		}
		sql.append(" order by s_id desc");
		List<Storeroom> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(Storeroom GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public Storeroom findById(Storeroom storeroom){
		return hibernateTemplate.get(Storeroom.class,storeroom.getS_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Storeroom where s_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Storeroom> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Storeroom  where s_scbs=1");
		List<Storeroom> storeroomlist= hibernateTemplate.find(sql.toString());
		return storeroomlist;
	}
	public List<Storeroom> findroombyhouse(int parseInt) {
		StringBuilder sql=new StringBuilder("from Storeroom  where s_scbs=1");
		if(parseInt!=0){
			sql.append(" and storehouse.sh_id="+parseInt);
		}
		List<Storeroom> storeroomlist= hibernateTemplate.find(sql.toString());
		return storeroomlist;
	}
	
}
