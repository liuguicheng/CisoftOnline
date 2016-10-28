package com.cisoft.action;


import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommodityStatus;
import com.cisoft.service.CommodityStatusService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品状态
 * @author lgc
 *
 */
public class CommodityStatusAction extends Pages<CommodityStatus> implements ModelDriven<CommodityStatus>{

	private CommodityStatus cbrand=new CommodityStatus();
	public CommodityStatus getModel() {
		// TODO Auto-generated method stub
		return cbrand;
	}
	@Resource
	CommodityStatusService commoditystatusService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commoditystatusService.getList(cbrand));
		pageResponse.setTotal(commoditystatusService.getCount(cbrand));
		return "list";
	}		
	
	public String save(){
		if(cbrand.getCs_id()==0){
			cbrand.setCs_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commoditystatusService.save(cbrand);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		cbrand=commoditystatusService.findById(cbrand);
		ServletActionContext.getContext().getValueStack().push(cbrand);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommodityStatus cbrandinfo =commoditystatusService.findById(cbrand);
		commoditystatusService.save(cbrandinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		CommodityStatus cbrandinfo =commoditystatusService.findById(cbrand);
		cbrandinfo.setCs_scbs(0);
		commoditystatusService.save(cbrandinfo);
		result="删除成功";
		return "delete";
	}
	
	
}
