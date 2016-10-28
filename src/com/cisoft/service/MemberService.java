package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MemberDao;
import com.cisoft.model.Member;

@Component("memberService")
@Transactional
public class MemberService {
	@Resource
	private MemberDao memberDao;
	
	public int getCount(Member member){
		return memberDao.getCount(member);
	}
	public List<Member> getList(Member member){
		return memberDao.getList(member);
	}
	
	public void save(Member member){
		memberDao.save(member);
	}
	
	public Member findById(Member member){
		return memberDao.findById(member);
	}
	
	public int isunitexit(int unitid){
		return memberDao.isunitexit(unitid);
	}
	public List<Member> findgyxlist() {
		// TODO Auto-generated method stub
		return memberDao.findgyxlist();
	}
	public Member findbyuserid(int u_id) {
		// TODO Auto-generated method stub
		return memberDao.findbyuserid(u_id);
	}
	public List<Member> findmemberbyname(Member member) {
		// TODO Auto-generated method stub
		return memberDao.findmemberbyname(member);
	}
}
