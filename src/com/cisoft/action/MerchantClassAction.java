package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Menu;
import com.cisoft.model.MerchantServices;
import com.cisoft.model.MerchantClass;
import com.cisoft.service.MerchantClassService;
import com.opensymphony.xwork2.ModelDriven;

public class MerchantClassAction extends Pages<MerchantClass> implements ModelDriven<MerchantClass>{
	private MerchantClass merchantClass=new MerchantClass();
	public MerchantClass getModel() {
		return merchantClass;
	}
	@Resource
	private MerchantClassService merchantClassService;
	private String result="";	
	public String getResult() {
		return result;
	}
	private List<MerchantClass> mclasslist;
	public List<MerchantClass> getMerchantClasss() {
		return mclasslist;
	}



	public String getList(){
		pageResponse.setRows(merchantClassService.getList(merchantClass));
		pageResponse.setTotal(merchantClassService.getCount(merchantClass));
		return "list";
	}
	
	public String editView(){
		merchantClass=merchantClassService.findById(merchantClass);
		ServletActionContext.getContext().getValueStack().push(merchantClass);
		return "editView";
	}
	
	public String save(){
		if(merchantClass.getId()==0){
			merchantClass.setScbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		merchantClassService.save(merchantClass);
		return "save";
	}
	
	private String menuid;
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	//设置权限
	public String savelimit(){		
		MerchantClass r=merchantClassService.findById(merchantClass);
		//删除原来的权限
		List<MerchantServices> list=r.getMerchs();
		list.removeAll(list);
		
		if(menuid!=null&&menuid.trim().length()!=0){
			if(menuid.contains(",")){
				String[] menuids=menuid.split(",");
				for (String m : menuids) {
					MerchantServices menu=new MerchantServices();
					menu.setId(Integer.parseInt(m));
					r.getMerchs().add(menu);
				}
			}else{
				Menu menu=new Menu();
				menu.setId(Integer.parseInt(menuid));
			}
		}
		merchantClassService.save(r);
		result="分配权限成功";
		return "savelimit";
	}
	
	private List<MerchantServices> menuss;
	public List<MerchantServices> getMenuss() {
		return menuss;
	}
	//获取该角色拥有的权限
	public String getLimitByRoleid(){
		MerchantClass r=merchantClassService.findById(merchantClass);
		menuss=r.getMerchs();
		return "getLimitByRoleid";
	}
	
	
	public String delete(){
		merchantClass =merchantClassService.findById(merchantClass);
		merchantClass.setScbs(0);
		merchantClassService.save(merchantClass);
		result="删除成功";
		return "delete";
	}
}
