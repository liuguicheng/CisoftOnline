package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.GYSInfo;
import com.cisoft.service.GysService;
import com.opensymphony.xwork2.ModelDriven;

public class GysAction extends Pages<GYSInfo> implements ModelDriven<GYSInfo>{

	private GYSInfo gys=new GYSInfo();
	public GYSInfo getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	GysService gysService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(gysService.getList(gys));
		pageResponse.setTotal(gysService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		if(gys.getG_id()==0){
			gys.setG_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		gysService.save(gys);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=gysService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		GYSInfo gysinfo =gysService.findById(gys);
		gysinfo.setG_address(gys.getG_address());
		gysinfo.setG_bz(gys.getG_bz());
		gysinfo.setG_cp(gys.getG_cp());
		gysinfo.setG_dh(gys.getG_dh());
		gysinfo.setG_lxr(gys.getG_lxr());
		gysinfo.setG_name(gys.getG_name());
		gysinfo.setG_xh(gys.getG_xh());
		gysService.save(gysinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		GYSInfo gysinfo =gysService.findById(gys);
		gysinfo.setG_scbs(0);
		gysService.save(gysinfo);
		result="删除成功";
		return "delete";
	}
	
	
}
