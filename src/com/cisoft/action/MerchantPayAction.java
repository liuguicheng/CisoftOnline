package com.cisoft.action;


import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.MerchantPay;
import com.cisoft.model.PaymentManagement;
import com.cisoft.service.MerchantPayService;
import com.cisoft.service.PaymentManagementService;
import com.opensymphony.xwork2.ModelDriven;

public class MerchantPayAction extends Pages<MerchantPay> implements ModelDriven<MerchantPay>{

	private MerchantPay mpay=new MerchantPay();
	public MerchantPay getModel() {
		// TODO Auto-generated method stub
		return mpay;
	}
	@Resource
	MerchantPayService merchantPayService;
	@Resource
	PaymentManagementService paymentManagementService;
	
	private List<PaymentManagement> pmlist;
	
	
	public List<PaymentManagement> getPmlist() {
		return pmlist;
	}

	public void setPmlist(List<PaymentManagement> pmlist) {
		this.pmlist = pmlist;
	}
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(merchantPayService.getList(mpay));
		pageResponse.setTotal(merchantPayService.getCount(mpay));
		return "list";
	}		
	
	public String save(){
		if(mpay.getMp_id()==0){
			mpay.setMp_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		merchantPayService.save(mpay);
		return "save";
	}
	
	public String addView(){
		pmlist=this.paymentManagementService.findgyxlist();
		ServletActionContext.getContext().put("pmlist", pmlist);
		return "addView";
	}
	public String editView(){
		pmlist=this.paymentManagementService.findgyxlist();
		ServletActionContext.getContext().put("pmlist", pmlist);
		mpay=merchantPayService.findById(mpay);
		ServletActionContext.getContext().getValueStack().push(mpay);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		MerchantPay MerchantPay =merchantPayService.findById(mpay);
		merchantPayService.save(MerchantPay);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		MerchantPay MerchantPay =merchantPayService.findById(mpay);
		MerchantPay.setMp_scbs(0);
		merchantPayService.save(MerchantPay);
		result="删除成功";
		return "delete";
	}
	
	
}
