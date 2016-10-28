package com.cisoft.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
@Component("pageList")
public class PageList {
	@Resource
	HibernateTemplate hibernateTemplate;
	
	public  List  getPage(final String hql,final int firstsize,final int maxsize){
		List lists=hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException {
				Query query=session.createQuery(hql);
				query.setFirstResult(firstsize);
				query.setMaxResults(maxsize);
				List list=query.list();
				return list;
			}		
		});
		return lists;
	}
	
	/*
	 * 为什么放在下面就会为null呢？
	 */
	public Object getCount(final String hql){
		    
			Object obj= hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException {
				 Query query = session.createQuery(hql.toString());  
				return session.createQuery(hql).uniqueResult();
			}	
		});
		return obj;
	}
	
	public  List  getsum(final String hql){
		List lists=hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException {
				Query query=session.createQuery(hql);
				List list=query.list();
				return list;
			}		
		});
		return lists;
	}
	
	
	
}
