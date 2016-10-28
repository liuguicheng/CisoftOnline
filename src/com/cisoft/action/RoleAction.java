package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Menu;
import com.cisoft.model.PageResponse;
import com.cisoft.model.Role;
import com.cisoft.model.User;
import com.cisoft.service.RoleService;
import com.opensymphony.xwork2.ModelDriven;

public class RoleAction extends Pages<Role> implements ModelDriven<Role>{
	private Role role=new Role();
	public Role getModel() {
		return role;
	}
	@Resource
	private RoleService roleService;
	private String result="";	
	public String getResult() {
		return result;
	}
	private List<Role> roles;
	public List<Role> getRoles() {
		return roles;
	}



	public String getList(){
		pageResponse.setRows(roleService.getList(role));
		pageResponse.setTotal(roleService.getCount(role));
		return "list";
	}
	
	public String editView(){
		role=roleService.findById(role);
		ServletActionContext.getContext().getValueStack().push(role);
		return "editView";
	}
	
	public String save(){
		if(role.getId()==0){
			role.setScbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		roleService.save(role);
		return "save";
	}
	
	private String menuid;
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	//设置权限
	public String savelimit(){		
		Role r=roleService.findById(role);
		//删除原来的权限
		List<Menu> list=r.getMenus();
		list.removeAll(list);
		
		if(menuid!=null&&menuid.trim().length()!=0){
			if(menuid.contains(",")){
				String[] menuids=menuid.split(",");
				for (String m : menuids) {
					Menu menu=new Menu();
					menu.setId(Integer.parseInt(m));
					r.getMenus().add(menu);
				}
			}else{
				Menu menu=new Menu();
				menu.setId(Integer.parseInt(menuid));
			}
		}
		roleService.save(r);
		result="分配权限成功";
		return "savelimit";
	}
	
	private List<Menu> menuss;
	public List<Menu> getMenuss() {
		return menuss;
	}
	//获取该角色拥有的权限
	public String getLimitByRoleid(){
		Role r=roleService.findById(role);
		menuss=r.getMenus();
		return "getLimitByRoleid";
	}
	
	
	public String delete(){
		role =roleService.findById(role);
		role.setScbs(0);
		roleService.save(role);
		result="删除成功";
		return "delete";
	}
}
