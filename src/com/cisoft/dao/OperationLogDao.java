package com.cisoft.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.OperationLog;

@Component("operationLogDao")
public class OperationLogDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;
	
	public int getCount(OperationLog gysinfo){
		StringBuilder sql=new StringBuilder("select count(*) from OperationLog where 1=1");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<OperationLog> getList(OperationLog gysinfo){
		StringBuilder sql=new StringBuilder("from OperationLog  where 1=1");
		sql.append(" order by ol_id desc");
		List<OperationLog> GYSInfos= pageList.getPage(sql.toString(), gysinfo.getFirstsize(), gysinfo.getRows());
		return GYSInfos;
	}
	
	public void save(OperationLog GYSInfo){
		hibernateTemplate.saveOrUpdate(GYSInfo);
	}
	
	public OperationLog findById(OperationLog GYSInfo){
		return hibernateTemplate.get(OperationLog.class,GYSInfo.getOl_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from OperationLog where 1=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<OperationLog> findbrandlist(OperationLog OperationLog) {
		StringBuilder sql=new StringBuilder("from OperationLog  where 1=1");
		return hibernateTemplate.find(sql.toString());
	}
	public List<OperationLog> findbrandlistby(OperationLog cbrand) {
		StringBuilder sql=new StringBuilder("from OperationLog  where 1=1");
		List<OperationLog> brli=hibernateTemplate.find(sql.toString());
		if(brli!=null){
			return brli;
		}
		return new ArrayList<OperationLog>();
	}
}
