package com.cisoft.action;


import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Storehouse;
import com.cisoft.model.Storeroom;
import com.cisoft.service.StorehouseService;
import com.cisoft.service.StoreroomService;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 库房
 * @author pro
 *
 */
public class StorehouseAction extends Pages<Storehouse> implements ModelDriven<Storehouse>{

	private Storehouse storeroom=new Storehouse();
	public Storehouse getModel() {
		// TODO Auto-generated method stub
		return storeroom;
	}
	@Resource
	StorehouseService storehouseService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(storehouseService.getList(storeroom));
		pageResponse.setTotal(storehouseService.getCount(storeroom));
		return "list";
	}		
	
	public String save(){
		if(storeroom.getSh_id()==0){
			storeroom.setSh_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		storehouseService.save(storeroom);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		storeroom=storehouseService.findById(storeroom);
		ServletActionContext.getContext().getValueStack().push(storeroom);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		storehouseService.save(storeroom);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * 
	 */
	public String delete(){
		Storehouse storerooms =storehouseService.findById(storeroom);
		storerooms.setSh_scbs(0);
		storehouseService.save(storerooms);
		result="删除成功";
		return "delete";
	}
	
	private List<Storehouse> stroehomelist;
	public List<Storehouse> getStroehomelist() {
		return stroehomelist;
	}
	public void setStroehomelist(List<Storehouse> stroehomelist) {
		this.stroehomelist = stroehomelist;
	}
	//获取仓库
	public String querystorehomelist(){
		stroehomelist=storehouseService.findgyxlist();
		return "listsuccess";
	}
}
