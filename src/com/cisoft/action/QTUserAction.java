package com.cisoft.action;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Member;
import com.cisoft.model.MembershipGrade;
import com.cisoft.model.User;
import com.cisoft.service.MemberService;
import com.cisoft.service.MenuService;
import com.cisoft.service.RoleService;
import com.cisoft.service.UserService;
import com.cisoft.utils.MD5Unit;
import com.cisoft.utils.SendEmail;
import com.cisoft.utils.Unit;
import com.cisoft.utils.Until;
import com.cisoft.utils.UplodImg;
import com.opensymphony.xwork2.ModelDriven;

public class QTUserAction  extends Pages<User> implements ModelDriven<User>{
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
	//会员
	@Resource
	MemberService memberService;
	private String result="";
	public String getResult() {
		return result;
	}

	private String name;
	public void setName(String name) {
		this.name = name;
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
//			String[] str=user.getU_name().split("@");
//			if(str.length>1){
//				user.setU_name(user.getU_email());
//				user.setU_name(null);
//			}
			List<User> users=userService.findByLogin(user);	
			if(users.size()==0){
				ServletActionContext.getContext().put("error", "用户名或密码错误");
				msg="0,邮箱账号或密码错误";
				return "qt_fail";
			}
				user=users.get(0);
				if(user.getU_status()==1||user.getU_status()==4){
				ServletActionContext.getRequest().getSession().setAttribute("usersession", users.get(0));
				msg="1,"+user.getU_name();
				}else if(user.getU_status()==0){
					msg="0,邮箱账号未激活！";
				}
				result="qt_success";
		}else{
			ServletActionContext.getContext().put("error", "验证码不正确");
			msg="0,验证码不正确";
			result="qt_fail";
		}
		return result;
	}
	
	//前台退出
	public String qtexit(){
		ServletActionContext.getRequest().getSession().removeAttribute("usersession");
		return "noqtlogin";
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
	 * 检测是否存在
	 * @return
	 */
	public String checkcuname(){
		result="1";
		this.user=this.userService.findByEmail(this.name.trim(),3);
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
		String vcode=(String) ServletActionContext.getRequest().getParameter("code1");
		if(rand.equalsIgnoreCase(vcode)){
			User userinfo =this.userService.findByEmail(user.getU_email(),3);
			if(userinfo!=null){
				result="0,邮箱已注册";
			}else{
			if(!user.getU_email().equals("")&&!pwd.equals("")
					&&!pwd2.equals("")&&pwd2.equals(pwd)){
				Date date=new Date();
				user.setU_pwd(pwd);
				user.setU_name(user.getU_email());
				user.setU_scbs(1);
				user.setU_status(0);
				user.setUwx_gzbs(3);//识别
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
		        sb.append("&u_email="); 
		        sb.append(user.getU_email());
		        sb.append("\">"+Unit.testemailprocess); 
		        sb.append(user.getU_email()); 
		        sb.append("&code="); 
		        sb.append(user.getValidateCode());
		        sb.append("&u_email="); 
		        sb.append(user.getU_email());
		        sb.append("</a>");
		        
		        //发送邮件
		        SendEmail.send(user.getU_email(), sb.toString(),"账号激活邮件");
		        System.out.println("发送邮件");
		        
				result="1,"+user.getU_email();
				
			}else{
			result="0,注册失败";
			}
			}
		}else{
			result="0,验证码不正确";
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
    	this.user=this.userService.findByEmail(user.getU_email(),3);
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
                        addmember(user);
                        result="激活成功";
                    } else {  
                    	result="激活码不正确";  
                    }  
                } else { 
                	result="激活码已过期！";  
                }  
            } else {
            	result="邮箱已激活，请不要重复激活！";  
            }  
        } else {
            result="该邮箱未注册!";  
        }  
        ServletActionContext.getContext().put("error", result);
     return "processActivatesuccess";     
    } 
    
    
    /**
     * 处理激活
     * @throws ParseException 
     */
      ///传递激活码和email过来
    public String processActivate2(){  
         //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(user.getU_email(),3);
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
                        addmember(user);
                        result="激活成功";
                    } else {  
                    	result="激活码不正确";  
                    }  
                } else { 
                	result="激活码已过期！";  
                }  
            } else {
            	result="邮箱已激活，请不要重复激活！";  
            }  
        } else {
            result="该邮箱未注册!";  
        }  
        ServletActionContext.getContext().put("error", result);
     return "processActivatesuccess_2";     
    } 
    
    
    //找回密码 发送邮件
    public String forgotpassword(){
    	String rand=(String) ServletActionContext.getRequest().getSession().getAttribute("rand");
		String vcode=(String) ServletActionContext.getRequest().getParameter("code2");
		if(rand.equalsIgnoreCase(vcode)){
    	result="1";
    	  //数据访问层，通过email获取用户信息
    	User userinfo=this.userService.findByEmail(user.getU_email(),3);
        //验证用户是否存在 
        if(userinfo!=null) {  
            //验证用户激活状态  
            if(userinfo.getU_status()==1) { 
            	userinfo.setCodenum(0);
            	this.userService.save(userinfo);
            	 ///邮件的内容
		        StringBuffer sb=new StringBuffer("点击下面链接修改账号密码，48小时生效，否则请重新发送找回密码请求，链接只能使用一次，请尽快修改密码！</br>");
		        sb.append("<a href=\""+Unit.testemailforgotpassword);
		        sb.append(userinfo.getU_email()); 
		        sb.append("&code="); 
		        sb.append(userinfo.getValidateCode());
		        sb.append("&u_email="); 
		        sb.append(userinfo.getU_email());
		        sb.append("\">"+Unit.testemailforgotpassword); 
		        sb.append(userinfo.getU_email()); 
		        sb.append("&code="); 
		        sb.append(userinfo.getValidateCode());
		        sb.append("&u_email="); 
		        sb.append(userinfo.getU_email());
		        sb.append("</a>");
		        
		        //发送邮件
		        SendEmail.send(user.getU_email(), sb.toString(),"找回密码邮件");
		        System.out.println("发送找回密码邮件");
		        result="1,"+user.getU_email();
            }else{
            	 result="0,邮箱未激活!"; 
            }
        } else {
            result="0,该邮箱未注册!";  
        } 
		}else{
			result="0,验证码错误";
		}
    	return "updatepwd";
    }
    
    //修改密码
    public String forgotuppassword(){
    	if(!"".equals(user.getU_email())&&!"".equals(pwd)&&!"".equals(pwd2)&&!"".equals(code)){
    		result="1";
    	  //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(user.getU_email(),3);
        //验证用户是否存在 
        if(user!=null) {  
            //验证用户激活状态  
            if(user.getU_status()==1) { 
            	if(user.getCodenum()==0){
            	 ///邮件的内容
            	if(pwd.equals(pwd2)){
            		if(code.equals(user.getValidateCode())){
            		user.setU_pwd(pwd);
            		user.setCodenum(1);
                	this.userService.save(user);
                	result="修改成功";
            		}else{
            			result="操作失败";
            		}
            	}else{
            		result="两次密码输入不一致";
            	}
            	}else{
            		result="当前连接找回密码已过期实效，请重新申请";
            	}
            }else{
            	 result="邮箱未激活!"; 
            }
        } else {
            result="该邮箱未注册!";  
        }
    	}else{
    		result="请输入新密码和确认密码";
    	}
	
    	return "forgotuppassword";
    }
    
    
  //修改密码(页面第二版)
    public String forgotuppassword2(){
    	if(!"".equals(user.getU_email())&&!"".equals(pwd)&&!"".equals(pwd2)&&!"".equals(code)){
    		result="1";
    	  //数据访问层，通过email获取用户信息
    	this.user=this.userService.findByEmail(user.getU_email(),3);
        //验证用户是否存在 
        if(user!=null) {  
            //验证用户激活状态  
            if(user.getU_status()==1) { 
            	if(user.getCodenum()==0){
            	 ///邮件的内容
            	if(pwd.equals(pwd2)){
            		if(code.equals(user.getValidateCode())){
            		user.setU_pwd(pwd);
            		user.setCodenum(1);
                	this.userService.save(user);
                	result="修改成功";
            		}else{
            			result="操作失败";
            		}
            	}else{
            		result="两次密码输入不一致";
            	}
            	}else{
            		result="当前连接找回密码已过期实效，请重新申请";
            	}
            }else{
            	 result="邮箱未激活!"; 
            }
        } else {
            result="该邮箱未注册!";  
        }
    	}else{
    		result="请输入新密码和确认密码";
    	}
	
    	return "forgotuppassword_2";
    }
    
    //二次激活
    public String jhzh(){
    	String rand=(String) ServletActionContext.getRequest().getSession().getAttribute("rand");
		String vcode=(String) ServletActionContext.getRequest().getParameter("code4");
		User userinfo =null;
		if(rand.equalsIgnoreCase(vcode)){
			userinfo=this.userService.findByEmail(user.getU_email(),3);
			if(userinfo==null){
				result="0,账号不存在";
			}else{
				Date date=new Date();
				userinfo.setU_status(0);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(new Date());
				calendar.add(Calendar.DAY_OF_MONTH, +2);
				date = calendar.getTime();
				userinfo.setLastTime(date);
				this.userService.save(userinfo);
				 ///邮件的内容
		        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
		        sb.append("<a href=\""+Unit.testemailprocess);
		        sb.append(userinfo.getU_email()); 
		        sb.append("&code="); 
		        sb.append(userinfo.getValidateCode());
		        sb.append("&u_email="); 
		        sb.append(userinfo.getU_email());
		        sb.append("\">"+Unit.testemailprocess); 
		        sb.append(userinfo.getU_email()); 
		        sb.append("&code="); 
		        sb.append(userinfo.getValidateCode());
		        sb.append("&u_email="); 
		        sb.append(userinfo.getU_email());
		        sb.append("</a>");
		        
		        //发送邮件
		        SendEmail.send(user.getU_email(), sb.toString(),"账号激活邮件");
		        System.out.println("发送邮件");
		        
				result="1,"+user.getU_email();
				
			}
		}else{
			result="0,验证码不正确";
		}
		return "updatepwd";
    }
    
    
    //验证登录超时
	public String loginyz(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		result="1";
		if(user==null){
			result="0";
		}
		return "updatepwd";
	}
	
	//验证邮箱是否存在
	public String checkcemail(){
		result="1";
		this.user=this.userService.findByEmail(this.name.trim(),3);
		if(user!=null){
			result="2";
		}
		return "updatepwd";
	}
	
	//个人信息
	public String queryUserInfo(){
		 user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		 
		if(user==null){
			return "noqtlogin";
		}
		user=this.userService.findById(user);
		ServletActionContext.getRequest().getSession().setAttribute("usersession", user);
		return "queryUserInfosuccess";
	}
	
	private File fileProductPic;
	private String fileProductPicFileName;
	
	public File getFileProductPic() {
		return fileProductPic;
	}

	public void setFileProductPic(File fileProductPic) {
		this.fileProductPic = fileProductPic;
	}

	public String getFileProductPicFileName() {
		return fileProductPicFileName;
	}

	public void setFileProductPicFileName(String fileProductPicFileName) {
		this.fileProductPicFileName = fileProductPicFileName;
	}

	//修改或保存个人信息
	public String saveUserInfo(){
		msg="修改失败";
		if(user!=null){
			if(user.getU_id()!=0){
				User userinfo=userService.findById(user);
				if(userinfo!=null){
					if(fileProductPicFileName!=null){
						// 存储缩略图
									String imageFileName = new Date().getTime()
											+ UplodImg.getExtention(fileProductPicFileName);
									//获取tomcat路径
									// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
									String cfurl =Until.pathstr()+ imageFileName;
									File newfile = new File(cfurl);
									UplodImg.copy(fileProductPic, newfile);
									userinfo.setTximgurl(cfurl);
						}
					userinfo.setU_csny(user.getU_csny());
					userinfo.setU_xb(user.getU_xb());
					userinfo.setU_nickname(user.getU_nickname());
					userinfo.setU_zsName(user.getU_zsName());
					this.userService.save(userinfo);
					//完善会员信息
					this.addmember(user);
					msg="修改成功";
				}
				
				
				
			}
		}
		return "saveUserInfosuccess";		
	}
	
	
	private void addmember(User user){
		if(user!=null){
			if(user.getU_id()!=0){
			  Member member=	this.memberService.findbyuserid(user.getU_id());
			  if(member==null){
				//添加会员信息
			         member=new Member();
			        member.setM_name(user.getU_zsName());
			        member.setM_phone(user.getU_lxdh());
			        member.setM_scbs(1);
			        member.setM_uid(user.getU_id());
			        MembershipGrade mg=new MembershipGrade();
			        mg.setMg_id(1);
			        member.setMgrad(mg);
			        member.setM_zcsj(new Date());
			  }else{
				    member.setM_name(user.getU_zsName());
			        member.setM_phone(user.getU_lxdh());
			        member.setM_scbs(1);
			        member.setM_uid(user.getU_id());
			        MembershipGrade mg=new MembershipGrade();
			        mg.setMg_id(1);
			        member.setMgrad(mg);
			        member.setM_zcsj(new Date());
			  }
			  this.memberService.save(member);
			}
		}
		
     
	}
}

