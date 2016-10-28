package com.cisoft.utils;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/*
 * 后台拦截器
 */
@SuppressWarnings("serial")
public class InterceptorUtils extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation arg) throws Exception {	
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
//		Expert expert=(Expert) ServletActionContext.getRequest().getSession().getAttribute("userexpert");
//		Company company=(Company) ServletActionContext.getRequest().getSession().getAttribute("usercompany");
		
		if(user==null){
			String methodname=ActionContext.getContext().getName();
			String[] methodnamesplit=methodname.split("_");
			if(methodname.equals("user_login")){
				//判断表单是否为空
				if(ServletActionContext.getRequest().getMethod().toLowerCase().equals("get")){
					return "nologin_1";
				}else{					
					return arg.invoke();
				}
			}else if(methodname.equals("user_qtlogin")){
				//判断表单是否为空
				if(ServletActionContext.getRequest().getMethod().toLowerCase().equals("get")){
					return "noqtlogin";
				}else{					
					return arg.invoke();
				}
			}else if("user_sjlogin".equals(methodname)||"user_sjzhmm".equals(methodname)||"user_sjzc".equals(methodname)||"user_sjlogout".equals(methodname)||"user_gosystem".equals(methodname)){
				return arg.invoke();
			}else if("user_sjindex".equals(methodname)){
				return "sjlogin";
			}else{	
				   
				 	if(methodnamesplit[0].equals("pages")&&!methodname.equals("pages_top")&&!methodname.equals("pages_foot")){
						return "nologin_1";
						
					}else if(methodnamesplit[0].equals("100nn")||
							methodnamesplit[0].equals("Supermarket")||
							methodnamesplit[0].equals("MovieTickets")||
							methodnamesplit[0].equals("cp")||
							methodnamesplit[0].equals("paypal")){
						return arg.invoke();
					} else if(methodname.equals("pages_top")||methodname.equals("pages_foot")||methodname.equals("pages_login")||
							methodname.equals("commodity_douplodimg")||methodname.equals("commodity_querycommdityList")||
							methodname.equals("commodity_querycommodityinfo")||methodname.equals("commodity_querycommdityListajax")
							||methodname.equals("commodity_houtcommodity")||methodname.equals("shoppingcar_querygwccount")
							||methodname.equals("user_checkcuname")||methodname.equals("user_adduser")||methodname.equals("user_processActivate")
							||methodname.equals("user_forgotpassword")||methodname.equals("user_forgotuppassword")
							||methodname.equals("paymentrecords_UnionReturnbackService")||methodname.equals("paymentrecords_UnionqtReturnbackService")){
						return arg.invoke();
					}
				 	
				ServletActionContext.getRequest().setAttribute("nologinmessage", "你还没有登录,不能访问");
				return "nologin_1";
			}
//			}
//			if(methodname.equals("weixinDevelop_acceptweixin")){
//				return arg.invoke();
//			}else if(methodname.equals("pages_weixinlogin")){
//				return arg.invoke();
//			}else if(methodname.equals("weixin_login")){
//				//判断表单是否为空
//				if(ServletActionContext.getRequest().getMethod().toLowerCase().equals("get")){
//					return "nologinweixin";
//				}else{					
//					return arg.invoke();
//				}
//			}else if(methodname.equals("user_login")){
//				//判断表单是否为空
//				if(ServletActionContext.getRequest().getMethod().toLowerCase().equals("get")){
//					return "nologin";
//				}else{					
//					return arg.invoke();
//				}
//			}else if(methodname.equals("user_qtlogin")){
//				//判断表单是否为空
//				if(ServletActionContext.getRequest().getMethod().toLowerCase().equals("get")){
//					return "noqtlogin";
//				}else{					
//					return arg.invoke();
//				}
//			}
//			else if(methodname.equals("pages_top")||methodname.equals("pages_foot")){
//				return arg.invoke();
//			}else{				
//				ServletActionContext.getRequest().setAttribute("nologinmessage", "你还没有登录,不能访问");
//				return "nologin";
//			}
		}else{
			return arg.invoke();
		}
	}
}
