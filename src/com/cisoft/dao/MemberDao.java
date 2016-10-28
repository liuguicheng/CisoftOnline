package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Member;
@Component("memberDao")
public class MemberDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;


	
	public int getCount(Member member){
		StringBuilder sql=new StringBuilder("select count(*) from Member where m_scbs=1");
		if(member!=null){
			if(member.getM_name()!=null&&!"".equals(member.getM_name())){
			sql.append(" and m_name like '%"+member.getM_name().trim()+"%'");
			}
		}
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<Member> getList(Member member){
		StringBuilder sql=new StringBuilder("from Member  where m_scbs=1");
		if(member!=null){
			if(member.getM_name()!=null&&!"".equals(member.getM_name())){
			sql.append(" and m_name like '%"+member.getM_name().trim()+"%'");
			}
		}
		sql.append(" order by m_id desc");
		List<Member> Members= pageList.getPage(sql.toString(), member.getFirstsize(), member.getRows());
		return Members;
	}
	
	public void save(Member member){
		hibernateTemplate.saveOrUpdate(member);
	}
	
	public Member findById(Member member){
		return hibernateTemplate.get(Member.class,member.getM_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from Member where m_scbs=1 ";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Member> findgyxlist() {
		StringBuilder sql=new StringBuilder("from Member  where m_scbs=1");
		List<Member> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	public Member findbyuserid(int u_id) {
		StringBuilder sql=new StringBuilder("from Member  where m_scbs=1");
		if(u_id!=0){
			sql.append(" and m_uid="+u_id);
		}
		List<Member> gyslist= hibernateTemplate.find(sql.toString());
		if(gyslist!=null){
			if(gyslist.size()>0){
				return gyslist.get(0);
			}
		}
		return null;
	}
	public List<Member> findmemberbyname(Member member) {
		StringBuilder sql=new StringBuilder("from Member  where m_scbs=1");
		if(member!=null){
			if(member.getM_name()!=null&&!"".equals(member.getM_name())){
				sql.append(" and m_name like '%"+member.getM_name()+"%'");
			}
			
		}
		List<Member> gyslist= hibernateTemplate.find(sql.toString());
		return gyslist;
	}
	
}
