package com.cisoft.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.MenuTree;
import com.cisoft.model.MerchantServices;
import com.cisoft.model.Template;
import com.cisoft.model.User;
import com.cisoft.service.MerchantClassService;
import com.cisoft.service.MerchantServicessService;
import com.opensymphony.xwork2.ModelDriven;

public class MerchantServicesAction extends Pages<MerchantServices> implements ModelDriven<MerchantServices>{
	private MerchantServices merchantServices=new MerchantServices();
	public MerchantServices getModel() {
		return merchantServices;
	}
	@Resource
	private MerchantServicessService merchantServicesService;
	@Resource
	private MerchantClassService merchantClassService;
	
	private List<MerchantServices> mercslist=new ArrayList<MerchantServices>();
	public List<MerchantServices> getMerchantServicess() {
		return mercslist;
	}
	private String result;
	public String getResult() {
		return result;
	}
	
	
	public String getList(){
		pageResponse.setRows(merchantServicesService.getList());
		pageResponse.setTotal(0);
//		MerchantServicess=merchantServicesService.getList();
		return "list";
		
	}
	public String addView(){
		List<MerchantServices> ms=merchantServicesService.getParent();
		ServletActionContext.getRequest().setAttribute("abc",ms.size());
		ServletActionContext.getContext().put("merchantServices", ms);
		return "addView";
	}
	public String editView(){
		List<MerchantServices> ms=merchantServicesService.getParent();
		ServletActionContext.getContext().put("merchantServices", ms);
		
		MerchantServices m=merchantServicesService.findById(merchantServices.getId());
		ServletActionContext.getContext().getValueStack().push(m);
		return "editView";
	}
	public String save(){
		if(merchantServices.getId()==0){
			merchantServices.setScbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		merchantServicesService.save(merchantServices);
		return "save";
	}

	public String getMerchantServices(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		List<MerchantServices> ms=new ArrayList<MerchantServices>();
		if(user!=null){
			ms=merchantClassService.findById(merchantServices.getId()).getMerchs();
		}
		getMerchantServices1(ms,merchantServices.getId());
		return "getMerchantServices";
	}
	
	public void getMerchantServices1(List<MerchantServices> ms,int parentid){
		for (MerchantServices m : ms) {
			if(m.getParentid()==parentid){
				mercslist.add(m);
				//审查递归
				getMerchantServices1(ms,m.getId());
			}
		}
	}
		
	//树形
	//树形
		private List<MenuTree> menutrees=new ArrayList<MenuTree>();
		public List<MenuTree> getMenutrees() {
			return menutrees;
		}
		//["id":1,"text":"测试",children:[....]]
		public String tree(){
			mercslist=merchantServicesService.getFirstMerchantServices();
			for (MerchantServices list : mercslist) {
				MenuTree menuTree=new MenuTree();
				menuTree.setId(list.getId());
				menuTree.setText(list.getMenuname());
				
				tree1(list,menuTree);
				menutrees.add(menuTree);
			}
			return "tree";
		}
		public void tree1(MerchantServices menu,MenuTree menuTree){
			List<MerchantServices> ms=merchantServicesService.getByPid(menu.getId());
			for (MerchantServices m : ms) {
				MenuTree tree=new MenuTree();
				tree.setId(m.getId());
				tree.setText(m.getMenuname());
				
				tree1(m,tree);
				menuTree.getChildren().add(tree);
			}
		}
		
		
		public String delete() {
			List<MerchantServices> cslist = this.merchantServicesService.getByPid(this.merchantServices.getId());
			if (cslist.size() > 0) {
				result = "你选择的属于父类,不能删除";
				return "delete";
			}
			MerchantServices templateinfo = merchantServicesService.findById(this.merchantServices.getId());
			templateinfo.setScbs(0);
			merchantServicesService.save(templateinfo);
			result = "删除成功";
			return "delete";
		}
	
		
		
}
