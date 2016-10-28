package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.MembershipGrade;
@Component("membershipGradeDao")
public class MembershipGradeDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(MembershipGrade membershipGrade){
		StringBuilder sql=new StringBuilder("select count(*) from MembershipGrade where mg_scbs=1");
		if(membershipGrade!=null){
			if(membershipGrade.getMg_name()!=null&&!"".equals(membershipGrade.getMg_name())){
			sql.append(" and mg_name like '%"+membershipGrade.getMg_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<MembershipGrade> getList(MembershipGrade membershipGrade){
		StringBuilder sql=new StringBuilder("from MembershipGrade  where mg_scbs=1");
		if(membershipGrade!=null){
			if(membershipGrade.getMg_name()!=null&&!"".equals(membershipGrade.getMg_name())){
			sql.append(" and mg_name like '%"+membershipGrade.getMg_name().trim()+"%'");
			}
		}
		sql.append(" order by mg_id desc");
		List<MembershipGrade> MembershipGrades= pageList.getPage(sql.toString(), membershipGrade.getFirstsize(), membershipGrade.getRows());
		return MembershipGrades;
	}
	
	public void save(MembershipGrade MembershipGrade){
		hibernateTemplate.saveOrUpdate(MembershipGrade);
	}
	
	public MembershipGrade findById(MembershipGrade MembershipGrade){
		return hibernateTemplate.get(MembershipGrade.class,MembershipGrade.getMg_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from MembershipGrade where mg_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<MembershipGrade> findgyxlist() {
		StringBuilder sql=new StringBuilder("from MembershipGrade  where mg_scbs=1");
		List<MembershipGrade> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
