package com.cisoft.action;


import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.User;
import com.cisoft.model.UserAddress;
import com.cisoft.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

public class UserAddressAction  extends Pages<UserAddress> implements ModelDriven<UserAddress>{
	private UserAddress useraddress=new UserAddress();
	public UserAddress getModel() {
		return useraddress;
	}
	@Resource
	private UserService userService;
	private String result="";
	public String getResult() {
		return result;
	}
	private String id;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getList(){
		User user=new User();
		user.setU_id(Integer.parseInt(id));
		useraddress.setUser(user);
		useraddress.setUa_status(-1);
		pageResponse.setRows(userService.findByUserAddressbyuser(useraddress));
		pageResponse.setTotal(userService.getUserAddressCount(useraddress));
		return "list";
	}		
	
	public String save(){
		
		if(useraddress.getUa_id()==0){
			if(useraddress.getUa_status()==1){
				User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
				//检查是否存在默认地址
				UserAddress useradd=new UserAddress();
				useradd.setUa_status(1);
				useradd.setUser(user);
				UserAddress ua=this.userService.findUserAddress(useradd);
				if(ua!=null){
					ua.setUa_status(0);
					this.userService.saveUserAddress(ua);
				}
			}
			useraddress.setUa_scbs(1);
			result="添加成功";
		}else{
			if(useraddress.getUa_status()==1){
				User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
				//检查是否存在默认地址
				UserAddress useradd=new UserAddress();
				useradd.setUa_status(1);
				useradd.setUser(user);
				UserAddress ua=this.userService.findUserAddress(useradd);
				if(ua!=null){
					ua.setUa_status(0);
					this.userService.saveUserAddress(ua);
				}
			}
			result="修改成功";
		}
		userService.saveUserAddress(useraddress);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		useraddress=userService.findUserAddressByID(useraddress);
		ServletActionContext.getContext().getValueStack().push(useraddress);
		id=String.valueOf(useraddress.getUser().getU_id());
		return "editView";
	}
	
	public String delete(){
		useraddress=new UserAddress();
		useraddress.setUa_id(Integer.parseInt(id));
		useraddress=userService.findUserAddressByID(useraddress);
		useraddress.setUa_scbs(0);
		userService.saveUserAddress(useraddress);
		result="删除成功";
		return "delete";
	}
	
	public String reset(){
		UserAddress us=new UserAddress();
		User user=new User();
		user.setU_id(useraddress.getUser().getU_id());
		us.setUser(user);
		us.setUa_status(1);
		us=userService.findUserAddress(us);
		if(us!=null){
			us.setUa_status(0);
			this.userService.saveUserAddress(us);
		}
		UserAddress	ur=userService.findUserAddressByID(useraddress);
		ur.setUa_status(1);
		this.userService.saveUserAddress(ur);
		return "reset";
	}
	
	/**
	 * 前台用户获取收货地址
	 */
	public String qtqueryuseraddress(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
		UserAddress userAddress=new UserAddress();
		userAddress.setUser(user);
		userAddress.setUa_status(-1);
		List<UserAddress> useraddress=this.userService.findByUserAddressbyuser(userAddress);
		ServletActionContext.getContext().put("useraddress", useraddress);
		return "qtqueryuseraddress_1";
		}else{
			return "noqtlogin";
		}
		
	}
	/**
	 * 前台修改收货地址
	 */
	public String toupdate(){
		useraddress=new UserAddress();
		useraddress.setUa_id(Integer.parseInt(id));
		useraddress=userService.findUserAddressByID(useraddress);
		ServletActionContext.getRequest().getSession().setAttribute("useraddressinfo", useraddress);
		return "reset";
	}
	/**
	 * 前台设为默认
	 * 
	 */
	public String toswmr(){
		UserAddress us=new UserAddress();
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		us.setUser(user);
		us.setUa_status(1);
		us=userService.findUserAddress(us);
		if(us!=null){
			us.setUa_status(0);
			this.userService.saveUserAddress(us);
		}
		
		useraddress=userService.findUserAddressByID(useraddress);
		useraddress.setUa_status(1);
		this.userService.saveUserAddress(useraddress);
		result="操作成功";
		return "delete";
	}
	public UserAddress getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(UserAddress useraddress) {
		this.useraddress = useraddress;
	}

	/**
	 * 获取选中的收货地址详情
	 */
	public String toadduser(){
		useraddress=userService.findUserAddressByID(useraddress);
		return "toadduser";
	}
}
