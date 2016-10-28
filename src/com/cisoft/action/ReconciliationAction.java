package com.cisoft.action;


import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Reconciliation;
import com.cisoft.service.ReconciliationService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 对账信息管理
 * @author pro
 *
 */
public class ReconciliationAction extends Pages<Reconciliation> implements ModelDriven<Reconciliation>{

	private Reconciliation gys=new Reconciliation();
	public Reconciliation getModel() {
		return gys;
	}
	@Resource
	ReconciliationService reconciliationService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(reconciliationService.getList(gys));
		pageResponse.setTotal(reconciliationService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		if(gys.getR_id()==0){
			gys.setR_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		reconciliationService.save(gys);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=reconciliationService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		Reconciliation Reconciliation =reconciliationService.findById(gys);
//		Reconciliation.setG_address(gys.getG_address());
//		Reconciliation.setG_bz(gys.getG_bz());
//		Reconciliation.setG_cp(gys.getG_cp());
//		Reconciliation.setG_dh(gys.getG_dh());
//		Reconciliation.setG_lxr(gys.getG_lxr());
//		Reconciliation.setG_name(gys.getG_name());
//		Reconciliation.setG_xh(gys.getG_xh());
		reconciliationService.save(Reconciliation);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		Reconciliation Reconciliation =reconciliationService.findById(gys);
		Reconciliation.setR_scbs(0);
		reconciliationService.save(Reconciliation);
		result="删除成功";
		return "delete";
	}
	
	
	//导出
	
	//自动生成
	
	
	
	//调整手动生成页面
	public String  togeneratebill(){
		
		return "togeneratebill";
		
	}
	
	//手动生成
	public String doGenerateBill(){
		
		//条件：商户id、日期
		
		
		
		return "doGenerateBill";
	}
	
	
	
}
