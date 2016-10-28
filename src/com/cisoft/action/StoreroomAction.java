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
public class StoreroomAction extends Pages<Storeroom> implements ModelDriven<Storeroom>{

	private Storeroom storeroom=new Storeroom();
	public Storeroom getModel() {
		// TODO Auto-generated method stub
		return storeroom;
	}
	@Resource
	StoreroomService storeroomService;
	
	@Resource
	StorehouseService storehouseService;
	
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(storeroomService.getList(storeroom));
		pageResponse.setTotal(storeroomService.getCount(storeroom));
		return "list";
	}		
	
	public String save(){
		if(storeroom.getS_id()==0){
			storeroom.setS_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		storeroomService.save(storeroom);
		return "save";
	}
	
	public String addView(){
		select();
		return "addView";
	}
	public  void select(){
		List<Storehouse> storehouselist=storehouseService.findgyxlist();
		ServletActionContext.getContext().put("storehouse", storehouselist);
		
	}
	public String editView(){
		select();
		storeroom=storeroomService.findById(storeroom);
		ServletActionContext.getContext().getValueStack().push(storeroom);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		storeroomService.save(storeroom);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * 
	 */
	public String delete(){
		Storeroom storerooms =storeroomService.findById(storeroom);
		storerooms.setS_scbs(0);
		storeroomService.save(storerooms);
		result="删除成功";
		return "delete";
	}
	
	private String houseid;
	private List<Storeroom> storeroomlist;
	
	public String getHouseid() {
		return houseid;
	}

	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}

	public List<Storeroom> getStoreroomlist() {
		return storeroomlist;
	}

	public void setStoreroomlist(List<Storeroom> storeroomlist) {
		this.storeroomlist = storeroomlist;
	}

	//获取库房信息
	public String querystoreroomlist(){
		storeroomlist=storeroomService.findroombyhouse(Integer.parseInt(houseid));
		return "querystoreroomlist";
	}
	
}
