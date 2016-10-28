package com.cisoft.action;


import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommoditySort;
import com.cisoft.service.CommoditySortService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品分类
 * @author lgc
 *
 */
public class CommoditySortAction extends Pages<CommoditySort> implements ModelDriven<CommoditySort>{

	private CommoditySort cbrand=new CommoditySort();
	

	
	
	public CommoditySort getModel() {
		// TODO Auto-generated method stub
		return cbrand;
	}
	@Resource
	CommoditySortService commoditysortService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commoditysortService.findParent());
		pageResponse.setTotal(0);
		return "list";
	}		
	
	public String save(){
		if(cbrand.getCs_id()==0){
			cbrand.setCs_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commoditysortService.save(cbrand);
		return "save";
	}
	
	public String addView(){
		List<CommoditySort> cs=this.commoditysortService.findParent();
		ServletActionContext.getContext().put("cbrand", cs);
		return "addView";
	}
	public String editView(){
		List<CommoditySort> cs=this.commoditysortService.findParent();
		ServletActionContext.getContext().put("cbrand", cs);
		cbrand=commoditysortService.findById(cbrand);
		ServletActionContext.getContext().getValueStack().push(cbrand);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommoditySort cbrandinfo =commoditysortService.findById(cbrand);
		commoditysortService.save(cbrandinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		List<CommoditySort> cslist=this.commoditysortService.findParentby(cbrand);
		if(cslist.size()>0){
			result="你选择的属于父类,不能删除";
			return "delete";
		}
		CommoditySort cbrandinfo =commoditysortService.findById(cbrand);
		cbrandinfo.setCs_scbs(0);
		commoditysortService.save(cbrandinfo);
		result="删除成功";
		return "delete";
	}
	
	
}
