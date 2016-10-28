package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MembershipGradeDao;
import com.cisoft.model.MembershipGrade;

@Component("membershipGradeService")
@Transactional
public class MembershipGradeService {
	@Resource
	private MembershipGradeDao membershipGradeDao;
	
	public int getCount(MembershipGrade membershipGrade){
		return membershipGradeDao.getCount(membershipGrade);
	}
	public List<MembershipGrade> getList(MembershipGrade membershipGrade){
		return membershipGradeDao.getList(membershipGrade);
	}
	
	public void save(MembershipGrade membershipGrade){
		membershipGradeDao.save(membershipGrade);
	}
	
	public MembershipGrade findById(MembershipGrade membershipGrade){
		return membershipGradeDao.findById(membershipGrade);
	}
	
	public int isunitexit(int unitid){
		return membershipGradeDao.isunitexit(unitid);
	}
	public List<MembershipGrade> findgyxlist() {
		// TODO Auto-generated method stub
		return membershipGradeDao.findgyxlist();
	}
}
