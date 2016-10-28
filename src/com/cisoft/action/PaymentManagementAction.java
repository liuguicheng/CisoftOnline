package com.cisoft.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.PaymentManagement;
import com.cisoft.service.PaymentManagementService;
import com.opensymphony.xwork2.ModelDriven;

public class PaymentManagementAction extends Pages<PaymentManagement> implements ModelDriven<PaymentManagement>{

	private PaymentManagement pman=new PaymentManagement();
	public PaymentManagement getModel() {
		// TODO Auto-generated method stub
		return pman;
	}
	@Resource
	PaymentManagementService paymentManagementService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(paymentManagementService.getList(pman));
		pageResponse.setTotal(paymentManagementService.getCount(pman));
		return "list";
	}		
	
	public String save(){
		if(pman.getPm_id()==0){
			pman.setPm_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		paymentManagementService.save(pman);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		pman=paymentManagementService.findById(pman);
		ServletActionContext.getContext().getValueStack().push(pman);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		PaymentManagement PaymentManagement =paymentManagementService.findById(pman);
		
		paymentManagementService.save(PaymentManagement);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		PaymentManagement PaymentManagement =paymentManagementService.findById(pman);
		PaymentManagement.setPm_scbs(0);
		paymentManagementService.save(PaymentManagement);
		result="删除成功";
		return "delete";
	}
	
	
}
