package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.ShoppingCart;
import com.cisoft.model.User;
import com.cisoft.model.UserAddress;
import com.cisoft.service.UserService;

public class WxUseraddressAction {
	private UserAddress useraddress;
	@Resource
	private UserService userService;
	private List<UserAddress> useraddresslist;
	private String result;
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
	 private String cdbs;//判断惨淡标识
	    
	    
		public String getCdbs() {
			return cdbs;
		}

		public void setCdbs(String cdbs) {
			this.cdbs = cdbs;
		}
	    private String bsid;
	    
		public String getBsid() {
			return bsid;
		}

		public void setBsid(String bsid) {
			this.bsid=bsid;
		}
	public String getList(){
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		if(user!=null){
		useraddress=new UserAddress();
		useraddress.setUser(user);
		useraddress.setUa_status(-1);
		useraddresslist=userService.findByUserAddressbyuser(useraddress);
		}else{
			if(bsid!=null){
				//验证是否登录
				List<User> users=userService.findBywxbs(bsid.toLowerCase().trim());
				if(users.size()>0){
					ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
				}else{
					 user=new User();
					user.setUwx_bs(bsid.toLowerCase().trim());
					user.setU_scbs(1);
					user.setUwx_gzbs(0);
					userService.save(user);
					ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
				}
				return "returnlist";
			}else{
			cdbs ="3";
			return "wxlist";
			}
		}
		return "list";
	}		
	
	public List<UserAddress> getUseraddresslist() {
		return useraddresslist;
	}

	public void setUserlist(List<UserAddress> useraddresslist) {
		this.useraddresslist = useraddresslist;
	}
    public String toadd(){
    	id=id;
    	return "addpage";
    }
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
			if(useraddress.getUa_id()==0){
				UserAddress useradd=new UserAddress();
				useradd.setUa_status(1);
				useradd.setUser(user);
				UserAddress ua=this.userService.findUserAddress(useradd);
				if(useraddress.getUa_status()==1){
					
					//检查是否存在默认地址
					
					if(ua!=null){
						ua.setUa_status(0);
						this.userService.saveUserAddress(ua);
					}
				}else{
					if(ua==null){
						useraddress.setUa_status(1);
					}
				}
				useraddress.setUser(user);
				useraddress.setUa_scbs(1);
			}else{
				//检查是否存在默认地址
				UserAddress useradd=new UserAddress();
				useradd.setUa_status(1);
				useradd.setUser(user);
				UserAddress ua=this.userService.findUserAddress(useradd);
				if(useraddress.getUa_status()==1){
				
					if(ua!=null){
						ua.setUa_status(0);
						this.userService.saveUserAddress(ua);
					}
					
				}else{
					if(ua==null){
						useraddress.setUa_status(1);
					}
				}
				
			}
			id=String.valueOf(user.getU_id());
			try{
			userService.saveUserAddress(useraddress);
			result="1";
			}catch(Exception e){
				result="2";
				System.out.println(e.getMessage());
			}
			System.out.println(result);
			
		
		
		
		}
		return "success";
		
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	private String quString;
	private String jdString;
	
	public String getQuString() {
		return quString;
	}

	public void setQuString(String quString) {
		this.quString = quString;
	}

	public String getJdString() {
		return jdString;
	}

	public void setJdString(String jdString) {
		this.jdString = jdString;
	}

	public String addView(){
		return "addView";
	}
	public String editView(){
		useraddress=userService.findUserAddressByID(useraddress);
		String[] shdz=useraddress.getUa_address().split("-");
		quString=shdz[2];
		jdString=shdz[3];
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
		UserAddress userAddress=new UserAddress();
		userAddress.setUser(user);
		userAddress.setUa_status(-1);
		List<UserAddress> useraddress=this.userService.findByUserAddressbyuser(userAddress);
		ServletActionContext.getContext().put("useraddress", useraddress);
		return "qtqueryuseraddress";
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
	/**
	 * 选择收货地址
	 */
	public String xzuseraddress(){
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		if(user!=null){
		useraddress=new UserAddress();
		useraddress.setUser(user);
		useraddress.setUa_status(-1);
		useraddresslist=userService.findByUserAddressbyuser(useraddress);
		id=id;
		result=result;
		}
		
		return "xzuseraddress";
	}
	
	/**
	 * 跳转个人中心
	 */
	public String touserinfo(){
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		if(user==null){
			if(bsid!=null){
				//验证是否登录
				List<User> users=userService.findBywxbs(bsid.toLowerCase().trim());
				if(users.size()>0){
					ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
				}else{
					 user=new User();
					user.setUwx_bs(bsid.toLowerCase().trim());
					user.setU_scbs(1);
					userService.save(user);
					ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
				}
			}else{
			cdbs ="7";
			return "wxlist";
			}
		}
		return "touserinfo";
	}
	
	/**
	 * 同步微信用户基本信息
	 */
	public String towxinfo(){
		cdbs ="8";
		return "wxlist";
	}
}
