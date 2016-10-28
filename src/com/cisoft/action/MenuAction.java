package com.cisoft.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommodityBrand;
import com.cisoft.model.Menu;
import com.cisoft.model.MenuTree;
import com.cisoft.model.Role;
import com.cisoft.model.User;
import com.cisoft.service.MenuService;
import com.cisoft.service.RoleService;
import com.opensymphony.xwork2.ModelDriven;

public class MenuAction extends Pages<Menu> implements ModelDriven<Menu>{
	private Menu menu=new Menu();
	public Menu getModel() {
		return menu;
	}
	@Resource
	private MenuService menuService;
	@Resource
	private RoleService roleService;
	
	private List<Menu> menus=new ArrayList<Menu>();
	public List<Menu> getMenus() {
		return menus;
	}
	private String result;
	public String getResult() {
		return result;
	}
	
	
	public String getList(){
		pageResponse.setRows(menuService.getList());
		pageResponse.setTotal(0);
//		menus=menuService.getList();
		return "list";
		
	}
	public String addView(){
		List<Menu> ms=menuService.getParent();
		ServletActionContext.getRequest().setAttribute("abc",ms.size());
		ServletActionContext.getContext().put("menus", ms);
		return "addView";
	}
	public String editView(){
		List<Menu> ms=menuService.getParent();
		ServletActionContext.getContext().put("menus", ms);
		
		Menu m=menuService.findById(menu.getId());
		ServletActionContext.getContext().getValueStack().push(m);
		return "editView";
	}
	public String save(){
		if(menu.getId()==0){
			result="添加成功";
		}else{
			result="修改成功";
		}
		menuService.save(menu);
		return "save";
	}

	public String getMenu(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		List<Menu> ms=new ArrayList<Menu>();
		if(user!=null){
			ms=roleService.findById(user.getRole().getId()).getMenus();
		}
		getMenu1(ms,menu.getId());
		return "getMenu";
	}
	public void getMenu1(List<Menu> ms,int parentid){
		for (Menu m : ms) {
			if(m.getParentid()==parentid){
				menus.add(m);
				//审查递归
				getMenu1(ms,m.getId());
			}
		}
	}
		
	//树形
	private List<MenuTree> menutrees=new ArrayList<MenuTree>();
	public List<MenuTree> getMenutrees() {
		return menutrees;
	}
	//["id":1,"text":"测试",children:[....]]
	public String tree(){
		menus=menuService.getFirstMenu();
		for (Menu list : menus) {
			MenuTree menuTree=new MenuTree();
			menuTree.setId(list.getId());
			menuTree.setText(list.getMenuname());
			
			tree1(list,menuTree);
			menutrees.add(menuTree);
		}
		return "tree";
	}
	public void tree1(Menu menu,MenuTree menuTree){
		List<Menu> ms=menuService.getByPid(menu.getId());
		for (Menu m : ms) {
			MenuTree tree=new MenuTree();
			tree.setId(m.getId());
			tree.setText(m.getMenuname());
			
			tree1(m,tree);
			menuTree.getChildren().add(tree);
		}
	}
}
