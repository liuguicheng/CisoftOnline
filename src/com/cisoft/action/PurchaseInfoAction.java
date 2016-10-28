package com.cisoft.action;


import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Purchase;
import com.cisoft.model.PurchaseInfo;
import com.cisoft.model.PurchasePayments;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchaseService;
import com.opensymphony.xwork2.ModelDriven;

public class PurchaseInfoAction extends Pages<PurchaseInfo> implements ModelDriven<PurchaseInfo>{

	private PurchaseInfo gys=new PurchaseInfo();
	public PurchaseInfo getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	PurchaseInfoService PurchaseInfoService;
	@Resource
	PurchaseService purchaseService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(PurchaseInfoService.getList(gys));
		pageResponse.setTotal(PurchaseInfoService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		double s=gys.getPi_cgprice()*gys.getPi_num();
		if(gys.getPi_id()==0){
			gys.setPi_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		gys.setPi_price(s);
		PurchaseInfoService.save(gys);
		//修改状态
		uppurchase(gys.getPi_no());
		return "save";
	}
	
	//修改采购单状态
		private void uppurchase(String gys){
			Purchase purchase= purchaseService.findbyno(gys);
			purchase.setP_zt(1);
			this.purchaseService.save(purchase);
		}
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=PurchaseInfoService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	public PurchaseInfo getGys() {
		return gys;
	}

	public void setGys(PurchaseInfo gys) {
		this.gys = gys;
	}

	//修改信息
	public String updatepwd(){
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		PurchaseInfo PurchaseInfo =PurchaseInfoService.findById(gys);
		PurchaseInfo.setPi_scbs(0);
		PurchaseInfoService.save(PurchaseInfo);
		result="删除成功";
		return "delete";
	}
	
	
	
}
