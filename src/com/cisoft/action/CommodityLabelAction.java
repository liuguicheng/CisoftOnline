package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommodityLabel;
import com.cisoft.service.CommodityLabelService;
import com.opensymphony.xwork2.ModelDriven;

public class CommodityLabelAction extends Pages<CommodityLabel> implements ModelDriven<CommodityLabel>{

	private CommodityLabel cbrand=new CommodityLabel();
	
	public CommodityLabel getModel() {
		// TODO Auto-generated method stub
		return cbrand;
	}
	
	@Resource
	private CommodityLabelService commodityLabelService;
	
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commodityLabelService.findbrandlist());
		pageResponse.setTotal(0);
		return "list";
	}		
	
	public String save(){
		if(cbrand.getCl_id()==0){
			cbrand.setCl_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commodityLabelService.save(cbrand);
		return "save";
	}
	
	public String addView(){
		List<CommodityLabel> cs=this.commodityLabelService.findbrandlist();
		ServletActionContext.getContext().put("cbrand", cs);
		return "addView";
	}
	public String editView(){
		List<CommodityLabel> cs=this.commodityLabelService.findbrandlist();
		ServletActionContext.getContext().put("cbrand", cs);
		cbrand=commodityLabelService.findById(cbrand);
		ServletActionContext.getContext().getValueStack().push(cbrand);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommodityLabel cbrandinfo =commodityLabelService.findById(cbrand);
		commodityLabelService.save(cbrandinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		List<CommodityLabel> cblist=commodityLabelService.findbrandlistby(cbrand);
		if(cblist.size()>0){
			result="你选择的属于父类,不能删除";
			return "delete";
		}
		CommodityLabel cbrandinfo =commodityLabelService.findById(cbrand);
		cbrandinfo.setCl_scbs(0);
		commodityLabelService.save(cbrandinfo);
		result="删除成功";
		return "delete";
	}
	

}
