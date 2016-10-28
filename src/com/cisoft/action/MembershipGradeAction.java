package com.cisoft.action;


import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.MembershipGrade;
import com.cisoft.service.MembershipGradeService;
import com.opensymphony.xwork2.ModelDriven;

public class MembershipGradeAction extends Pages<MembershipGrade> implements ModelDriven<MembershipGrade>{

	private MembershipGrade membershipGrade=new MembershipGrade();
	public MembershipGrade getModel() {
		// TODO Auto-generated method stub
		return membershipGrade;
	}
	@Resource
	MembershipGradeService membershipGradeService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(membershipGradeService.getList(membershipGrade));
		pageResponse.setTotal(membershipGradeService.getCount(membershipGrade));
		return "list";
	}		
	
	public String save(){
		if(membershipGrade.getMg_id()==0){
			membershipGrade.setMg_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		membershipGradeService.save(membershipGrade);
		return "save";
	}
	
	public String addView(){
		ServletActionContext.getContext().getSession().remove("membershipGrade");
		return "editView";
	}
	public String editView(){
		membershipGrade=membershipGradeService.findById(membershipGrade);
		
		ServletActionContext.getContext().getSession().put("membershipGrade",membershipGrade);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		membershipGradeService.save(membershipGrade);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		MembershipGrade MembershipGrade =membershipGradeService.findById(membershipGrade);
		MembershipGrade.setMg_scbs(0);
		membershipGradeService.save(MembershipGrade);
		result="删除成功";
		return "delete";
	}
	
	
}
