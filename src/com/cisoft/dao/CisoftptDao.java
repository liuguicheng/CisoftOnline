package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.CisoftPt;
@Component("cisoftptDao")
public class CisoftptDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	
	public void save(CisoftPt cisoftpt){
		hibernateTemplate.saveOrUpdate(cisoftpt);
	}
	
	public List<CisoftPt> findbrandlist() {
		StringBuilder sql=new StringBuilder("from CisoftPt");
		return hibernateTemplate.find(sql.toString());
	}
}
