package com.cisoft.action;


import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Distribution;
import com.cisoft.service.DistributionService;
import com.opensymphony.xwork2.ModelDriven;

public class DistributionAction extends Pages<Distribution> implements ModelDriven<Distribution>{

	private Distribution gys=new Distribution();
	public Distribution getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	DistributionService distributionService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(distributionService.getList(gys));
		pageResponse.setTotal(distributionService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		if(gys.getD_id()==0){
			gys.setD_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		distributionService.save(gys);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=distributionService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		distributionService.save(gys);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		Distribution distribution =distributionService.findById(gys);
		distribution.setD_scbs(0);
		distributionService.save(distribution);
		result="删除成功";
		return "delete";
	}
	
	
}
