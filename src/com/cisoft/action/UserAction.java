package com.cisoft.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cisoft.model.Menu;
import com.cisoft.model.OperationLog;
import com.cisoft.model.Role;
import com.cisoft.model.ShoppingCart;
import com.cisoft.model.User;
import com.cisoft.service.MenuService;
import com.cisoft.service.OperationLogService;
import com.cisoft.service.RoleService;
import com.cisoft.service.UserService;
import com.cisoft.utils.Const;
import com.cisoft.utils.ExpertSelectException;
import com.cisoft.utils.FreeMarkerTest;
import com.cisoft.utils.MD5Unit;
import com.cisoft.utils.PageData;
import com.cisoft.utils.SelectIp;
import com.cisoft.utils.SendEmail;
import com.cisoft.utils.Tools;
import com.cisoft.utils.Unit;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction  extends Pages<User> implements ModelDriven<User>{
	private User user=new User();
	public User getModel() {
		return user;
	}
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private MenuService menuService;
	@Resource
	OperationLogService operationLogService;
	private String result="";
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String login(){
		String rand=(String) ServletActionContext.getRequest().getSession().getAttribute("rand");
		String vcode=(String) ServletActionContext.getRequest().getParameter("code");
		String result="";
		int roleid=0;
		
		
		if(rand.equalsIgnoreCase(vcode)){
			//用户表		
			List<User> users=userService.findByLogin(user);	
			if(users.size()==0){
				ServletActionContext.getContext().put("error", "用户名或密码错误");
				return "fail";
			}
			    //添加日志记录
				operationloginfo(users.get(0),4,"","登录系统");
			
				ServletActionContext.getRequest().getSession().setAttribute("usersession", users.get(0));
				
				result="success";
		}else{
			ServletActionContext.getContext().put("error", "验证码不正确");
			result="fail";
		}
		
		return result;
	}
	private String msg;
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String qtlogin(){
		String rand=(String) ServletActionContext.getRequest().getSession().getAttribute("rand");
		String vcode=(String) ServletActionContext.getRequest().getParameter("code");
		String result="";
		if(rand.equalsIgnoreCase(vcode)){
			//用户表		
			String[] str=user.getU_name().split("@");
			if(str.length>1){
				user.setU_email(user.getU_name());
				user.setU_name(null);
			}
			List<User> users=userService.findByLogin(user);	
			if(users.size()==0){
				ServletActionContext.getContext().put("error", "用户名或密码错误");
				msg="用户名或密码错误";
				return "qt_fail";
			}
				user=users.get(0);
				if(user.getU_status()==1){
				ServletActionContext.getRequest().getSession().setAttribute("usersession", users.get(0));
				msg="1";
				}else if(user.getU_status()==0){
					msg="账号未激活！";
				}
				result="qt_success";
		}else{
			ServletActionContext.getContext().put("error", "验证码不正确");
			msg="验证码不正确";
			result="qt_fail";
		}
		return result;
	}
	
	
	public String getList(){
		pageResponse.setRows(userService.getList(user));
		pageResponse.setTotal(userService.getCount(user));
		return "list";
	}		
	
	public String save(){
		User userinfo=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user.getU_id()==0){
			user.setU_scbs(1);
			user.setUwx_gzbs(2);
			result="添加成功";
			//添加日志记录
			operationloginfo(userinfo,1,"","添加账号");
		}else{
			result="修改成功";
			operationloginfo(userinfo,3,"","修改账号");
		}
		userService.save(user);
		return "save";
	}
	
	public String addView(){
		selects();
		return "addView";
	}
	public String editView(){
		user=userService.findById(user);
		ServletActionContext.getContext().getValueStack().push(user);
		selects();
		return "editView";
	}
	
	public void selects(){
		//单位
//		List<Unit> units=unitService.getList(new Unit());
//		ServletActionContext.getContext().put("units", units);
		
		
		//角色
		List<Role> roles=roleService.getList();
		ServletActionContext.getContext().put("roles", roles);
	}
	//修改密码
	public String updatepwd(){
		if(result!=null&&!"".equals(result.trim())){
			
			User u=userService.findById(user);
			if(u.getU_pwd().equals(result)){
				u.setU_pwd(user.getU_pwd());
				u.setU_name(user.getU_name());
				userService.save(u);
				result="修改成功";
			}else{
				result="原密码错误";
			}
			
		}else{
			result="修改失败";
		}
		
		return "updatepwd";
	}
	//退出
	public String exit(){
		ServletActionContext.getRequest().getSession().removeAttribute("usersession");
		return "exit";
	}
	//前台退出
	public String qtexit(){
		ServletActionContext.getRequest().getSession().removeAttribute("usersession");
		msg="1";
		return "qtexit";
	}
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		User userinfo=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		User u=userService.findById(user);
		u.setU_scbs(0);
		userService.save(u);
		result="删除成功";
		//添加日志记录
		operationloginfo(userinfo,2,"","删除账号");
		return "delete";
	}
	
	//重置密码
	private String shenfen;
	public void setShenfen(String shenfen) {
		this.shenfen = shenfen;
	}
	private String name;
	public void setName(String name) {
		this.name = name;
	}
	
	public String reset(){
			try{
			User u=userService.findById(user);
			u.setU_pwd("123456");
			userService.save(u);
			User userinfo=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
			//添加日志记录
			operationloginfo(userinfo,3,"","重置账号秘密");
		        result="密码重置成功";
		    }catch(Exception e){
		    	result="密码重置失败";
		    }
		    return "reset";
	}
	//修改个人信息
	public String toupdatebyuser(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		
		user=userService.findById(user);
		ServletActionContext.getContext().getValueStack().push(user);
		selects();
		return "toupdatebyuser";
	}
	
	
	/**
	 * 前台修改密码
	 */
	public String uppwd(){
		result="1";
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
			if(!user.getU_pwd().equals(this.msg)){
				result="2";
			}else{
			   if(pwd.equals(pwd2)){
				   user.setU_pwd(pwd);
				   this.userService.save(user);
			   }else{
				   result="3";
			   }
			}
		}else{
			result="3";
		}
		
		return "updatepwd";
	}
	/**
	 * 前提检查原密码是否正确
	 */
	public String checkoldpwd(){
		result="1";
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
			if(!user.getU_pwd().equals(this.msg)){
				result="2";
			}
		}else{
			result="3";
		}
		
		return "updatepwd";
	}
	private String pwd;
	private String pwd2;
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	/**
	 * 检测用户名是否存在
	 * @return
	 */
	public String checkcuname(){
		result="1";
		this.user=this.userService.findByEmail(this.name.trim(),0);
		if(user!=null){
			result="2";
		}
		return "updatepwd";
	}
	/**
	 * 注册
	 */
	public String adduser(){
		String rand=(String) ServletActionContext.getRequest().getSession().getAttribute("rand");
		String vcode=(String) ServletActionContext.getRequest().getParameter("code2");
		if(rand.equalsIgnoreCase(vcode)){
			if(!user.getU_email().equals("")&&!pwd.equals("")
					&&!pwd2.equals("")&&pwd2.equals(pwd)&&!user.getU_name().equals("")){
				Date date=new Date();
				user.setU_pwd(pwd);
				user.setU_scbs(1);
				user.setUwx_gzbs(3);
				user.setU_status(0);
				user.setValidateCode(MD5Unit.encode2hex(user.getU_email().trim()));
				user.setRegisterTime(date);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(new Date());
				calendar.add(Calendar.DAY_OF_MONTH, +2);
				date = calendar.getTime();
				user.setLastTime(date);
				this.userService.save(user);
				 ///邮件的内容
		        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
		        sb.append("<a href=\""+Unit.testemailprocess);
		        sb.append(user.getU_email()); 
		        sb.append("&code="); 
		        sb.append(user.getValidateCode());
		        sb.append("\">"+Unit.testemailprocess); 
		        sb.append(user.getU_email());
		        sb.append("&code=");
		        sb.append(user.getValidateCode());
		        sb.append("</a>");
		        
		        //发送邮件
		        SendEmail.send(user.getU_email(), sb.toString(),"账号激活邮件");
		        System.out.println("发送邮件");
		        
				result="1";
				
			}else{
			result="注册失败，详情请联系管理员";
			}
		}else{
			result="验证码不正确";
		}
		return "updatepwd";
	}
	
	
	
	private String code;
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	/**
     * 处理激活
     * @throws ParseException 
     */
      ///传递激活码和email过来
    public String processActivate(){  
         //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(name,0);
        //验证用户是否存在 
        if(user!=null) {  
            //验证用户激活状态  
            if(user.getU_status()==0) { 
                ///没激活
                Date currentTime = new Date();//获取当前时间  
                //验证链接是否过期 
                currentTime.before(user.getRegisterTime());  
                if(currentTime.before(user.getLastTime())) {  
                    //验证激活码是否正确  
                    if(code.equals(user.getValidateCode())) {  
                        //激活成功， //并更新用户的激活状态，为已激活 
                        user.setU_status(1);//把状态改为激活
                        this.userService.save(user);
                        result="激活成功";
                    } else {  
                    	result="激活码不正确";  
                    }  
                } else { 
                	result="激活码已过期！";  
                }  
            } else {
            	result="邮箱已激活，请登录！";  
            }  
        } else {
            result="该邮箱未注册";  
        }  
     return "processActivatesuccess";     
    } 
    //找回密码 发送邮件
    public String forgotpassword(){
    	result="1";
    	  //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(name,0);
        //验证用户是否存在 
        if(user!=null) {  
            //验证用户激活状态  
            if(user.getU_status()==1) { 
            	 ///邮件的内容
		        StringBuffer sb=new StringBuffer("点击下面链接修改账号密码，48小时生效，否则请重新发送找回密码请求，链接只能使用一次，请尽快修改密码！</br>");
		        sb.append("<a href=\""+Unit.testemailforgotpassword);
		        sb.append(user.getU_email()); 
		        sb.append("&code="); 
		        sb.append(user.getValidateCode());
		        sb.append("\">"+Unit.testemailforgotpassword); 
		        sb.append(user.getU_email());
		        sb.append("&code=");
		        sb.append(user.getValidateCode());
		        sb.append("</a>");
		        
		        //发送邮件
		        SendEmail.send(user.getU_email(), sb.toString(),"找回密码邮件");
		        System.out.println("发送找回密码邮件");
            }else{
            	 result="邮箱未激活!"; 
            }
        } else {
            result="该邮箱未注册";  
        } 
    	return "updatepwd";
    }
    
    //修改密码
    public String forgotuppassword(){
    	
    	if(user.getU_email()!=null&&pwd!=null&&pwd2!=null){
    		result="1";
    	  //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(user.getU_email(),0);
        //验证用户是否存在 
        if(user!=null) {  
            //验证用户激活状态  
            if(user.getU_status()==1) { 
            	 ///邮件的内容
            	if(pwd.equals(pwd2)&&code.equals(user.getValidateCode())){
            		user.setU_pwd(pwd);
                	this.userService.save(user);
            	}else{
            		result="两次密码输入不一致";
            	}
            	
            }else{
            	 result="邮箱未激活!"; 
            }
        } else {
            result="该邮箱未注册（邮箱地址不存在）!";  
        }
    	}else{
    		result="修改密码发生错误";
    	}
    	return "updatepwd";
    }
    
    /**
     * 跳转首页
     * @return
     */
	public String toindex(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
	     	int	roleid=user.getRole().getId();//角色
			List<Menu> menus=new ArrayList<Menu>();
			if(roleid!=0){
				Role role=new Role();
				role.setId(roleid);
				Role roles=roleService.findById(role);			
				List<Menu> menu=roles.getMenus();
			
				for (Menu m : menu) {
					if(m.getParentid()==0){
						menus.add(m);
					}
				}
			}
			ServletActionContext.getContext().put("menus", menus);
			return "toindex";
		}else{
			return "fail";
		}
	}
	
	
	private void operationloginfo(User user,int type,String bz,String context){
		
		//日志实体
		String ip=SelectIp.getIpAddr(SelectIp.selectrequest());
		OperationLog ol=new OperationLog();
		ol.setOl_ip(ip);
        ol.setOl_time(new Date());
        ol.setOl_type(type);
        ol.setOl_usercode(String.valueOf(user.getU_id()));
        ol.setOl_username(user.getU_zsName());
        ol.setOl_bz(bz);
        ol.setOl_context(context);
        this.operationLogService.save(ol);
	}
	
	/**
	 * 商家版登陆
	 */
	public String sjlogin(){
		//用户表		
		List<User> users=userService.findByLogin(user);	
		if(users.size()==0){
			ServletActionContext.getContext().put("error", "用户名或密码错误");
			result="用户名或密码错误";
		}
		    //添加日志记录
			operationloginfo(users.get(0),4,"","商家版－登录系统");
		
			ServletActionContext.getRequest().getSession().setAttribute("usersession", users.get(0));
			Map<String,String> pd=new HashMap<String,String>();
			pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
			ServletActionContext.getRequest().getSession().setAttribute("pdinfo", pd);
			result="登陆成功";
			return "save";
	}
	
	/**
	 * 商家版首页
	 */
	public String sjindex(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
	     	int	roleid=user.getRole().getId();//角色
			List<Menu> menus=new ArrayList<Menu>();
			List<Menu> zmenu=new ArrayList<Menu>();
			if(roleid!=0){
				Role role=new Role();
				role.setId(roleid);
				Role roles=roleService.findById(role);			
				List<Menu> menu=roles.getMenus();
			
				for (Menu m : menu) {
					if(m.getParentid()==0){
						menus.add(m);
					}
				}
				for (Menu m : menu) {
					if(m.getParentid()!=0){
						zmenu.add(m);
					}
				}
				ServletActionContext.getContext().put("menus", menus);
				ServletActionContext.getContext().put("zmenu", zmenu);
			}
			
			return "sjindex";
		}else{
			return "sjlogin";
		}
	}
	
	/**
	 * 商家注册
	 */
	public String sjzc(){
		
		if(user!=null){
			User userinfo= this.userService.findByEmail(user.getU_email().trim(),0);
			if(userinfo!=null){
				result="邮箱或用户名已存在!";
			}
			if(user.getU_pwd().equals(pwd2)){
			user.setU_status(4);
			user.setU_scbs(1);
			user.setUwx_gzbs(4);
			user.setRegisterTime(new Date());
			this.userService.save(user);
			///邮件的内容
	        StringBuffer sb=new StringBuffer("欢迎使用cisoft电商平台,您的账号为："+user.getU_name()+" , 您的密码为："+user.getU_pwd()+" ! 首次登陆建议您修改密码!<br/>");
	        sb.append("目前您的账号属于审核阶段,审核时间为1-3个工作日,审核结果会以邮件形式通知,请及时查收!");
	        //发送邮件
	        SendEmail.send(user.getU_email(), sb.toString(),"新用户注册");
	        System.out.println("发送邮件");
	        
			result="注册成功";
			}else{
				result="两次密码不一致";
			}
		}
		
		return "save";
	}
	
	/**
	 * 商家找回密码
	 */
	public String sjzhmm(){
		if(user!=null){
			User userinfo= this.userService.findByEmail(user.getU_email().trim(),0);
			if(userinfo==null){
				result="邮箱不存在!";
			}else{
			///邮件的内容
	        StringBuffer sb=new StringBuffer("欢迎使用cisoft电商平台，您的密码为："+userinfo.getU_pwd()+" ! 请及时修改您的密码！");
	        //发送邮件
	        SendEmail.send(user.getU_email(), sb.toString(),"密码找回邮件");
	        System.out.println("发送邮件");
	        result="发送成功";
			}
		}
		return "save";
	}
	
	/**
	 * 登出
	 */
	public String sjlogout(){
		ServletActionContext.getRequest().getSession().removeAttribute("usersession");
		return "sjfail";
	}
	
	/**
	 * tab
	 * 
	 */
	public String tab(){
		return "tab";
	}
	/**
	 * default
	 */
	public String defaultd(){
		return "defaultd";	
	}
	
	/**
	 * to 登陆页面
	 */
	
	public String sjfail(){
		
		return "sjfail";
	}
	
	/**
	 * to  系统设置
	 */
	public String gosystem(){

        Map<String,String> pd=new HashMap<String,String>();
		pd.put("YSYNAME", Tools.readTxtFile(Const.SYSNAME));	 //读取系统名称
		pd.put("COUNTPAGE", Tools.readTxtFile(Const.PAGE));		 //读取每页条数
		String strEMAIL = Tools.readTxtFile(Const.EMAIL);		 //读取邮件配置
		String strSMS1 = Tools.readTxtFile(Const.SMS1);			 //读取短信1配置
		String strSMS2 = Tools.readTxtFile(Const.SMS2);			 //读取短信2配置
		String strFWATERM = Tools.readTxtFile(Const.FWATERM);	 //读取文字水印配置
		String strIWATERM = Tools.readTxtFile(Const.IWATERM);	 //读取图片水印配置
		pd.put("Token", Tools.readTxtFile(Const.WEIXIN));		 //读取微信配置
		String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置
		
		if(null != strEMAIL && !"".equals(strEMAIL)){
			String strEM[] = strEMAIL.split(",fh,");
			if(strEM.length == 4){
				pd.put("SMTP", strEM[0]);
				pd.put("PORT", strEM[1]);
				pd.put("EMAIL", strEM[2]);
				pd.put("PAW", strEM[3]);
			}
		}
		
		if(null != strSMS1 && !"".equals(strSMS1)){
			String strS1[] = strSMS1.split(",fh,");
			if(strS1.length == 2){
				pd.put("SMSU1", strS1[0]);
				pd.put("SMSPAW1", strS1[1]);
			}
		}
		
		if(null != strSMS2 && !"".equals(strSMS2)){
			String strS2[] = strSMS2.split(",fh,");
			if(strS2.length == 2){
				pd.put("SMSU2", strS2[0]);
				pd.put("SMSPAW2", strS2[1]);
			}
		}
		
		if(null != strFWATERM && !"".equals(strFWATERM)){
			String strFW[] = strFWATERM.split(",fh,");
			if(strFW.length == 5){
				pd.put("isCheck1", strFW[0]);
				pd.put("fcontent", strFW[1]);
				pd.put("fontSize", strFW[2]);
				pd.put("fontX", strFW[3]);
				pd.put("fontY", strFW[4]);
			}
		}
		
		if(null != strIWATERM && !"".equals(strIWATERM)){
			String strIW[] = strIWATERM.split(",fh,");
			if(strIW.length == 4){
				pd.put("isCheck2", strIW[0]);
				pd.put("imgUrl", strIW[1]);
				pd.put("imgX", strIW[2]);
				pd.put("imgY", strIW[3]);
			}
		}
		if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
			String strIW[] = strWEBSOCKET.split(",fh,");
			if(strIW.length == 4){
				pd.put("WIMIP", strIW[0]);
				pd.put("WIMPORT", strIW[1]);
				pd.put("OLIP", strIW[2]);
				pd.put("OLPORT", strIW[3]);
			}
		}
		ServletActionContext.getContext().put("pd",pd);
		
		return "gosystem";
	}
	

	/**
	 * 保存系统设置1
	 */
	public String saveSys() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.SYSNAME,pd.getString("YSYNAME"));	//写入系统名称
		Tools.writeFile(Const.PAGE,pd.getString("COUNTPAGE"));	//写入每页条数
		Tools.writeFile(Const.EMAIL,pd.getString("SMTP")+",fh,"+pd.getString("PORT")+",fh,"+pd.getString("EMAIL")+",fh,"+pd.getString("PAW"));	//写入邮件服务器配置
		Tools.writeFile(Const.SMS1,pd.getString("SMSU1")+",fh,"+pd.getString("SMSPAW1"));	//写入短信1配置
		Tools.writeFile(Const.SMS2,pd.getString("SMSU2")+",fh,"+pd.getString("SMSPAW2"));	//写入短信2配置
		result="ok";
		return "save";
	}
	
	/**
	 * 保存系统设置2
	 */
	public String saveSys2() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.FWATERM,pd.getString("isCheck1")+",fh,"+pd.getString("fcontent")+",fh,"+pd.getString("fontSize")+",fh,"+pd.getString("fontX")+",fh,"+pd.getString("fontY"));	//文字水印配置
		Tools.writeFile(Const.IWATERM,pd.getString("isCheck2")+",fh,"+pd.getString("imgUrl")+",fh,"+pd.getString("imgX")+",fh,"+pd.getString("imgY"));	//图片水印配置
		result="ok";
		return "save";
	}
	
	/**
	 * 保存系统设置3
	 */
	public String saveSys3() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.WEIXIN,pd.getString("Token"));	//写入微信配置
		Tools.writeFile(Const.WEBSOCKET,pd.getString("WIMIP")+",fh,"+pd.getString("WIMPORT")+",fh,"+pd.getString("OLIP")+",fh,"+pd.getString("OLPORT"));	//websocket配置
		result="ok";
		return "save";
	}
	
	
	/**
	 * 测试模版
	 */
	public String totestftl(){
		ServletActionContext.getContext().put("user", "刘贵成");
		return "totestftl";
	}
	
}
