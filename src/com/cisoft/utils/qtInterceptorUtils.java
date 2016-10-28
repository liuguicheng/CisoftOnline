package com.cisoft.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cisoft.action.BaseAction;
import com.cisoft.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/*
 * 前台拦截器
 */
@SuppressWarnings("serial")
public class qtInterceptorUtils extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation arg) throws Exception {	
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		HttpServletRequest request = ServletActionContext.getRequest();
		String methodname=ActionContext.getContext().getName();
		 
		 if (user == null && isAjaxRequest(request)) {
			 if( methodname.equals("commodity_houtcommodity")||methodname.equals("shoppingcar_querygwccount")||
					 methodname.equals("commodity_commoditycount")
					 ||methodname.equals("paymentrecords_UnionReturnbackService")
					 ||methodname.equals("paymentrecords_UnionqtReturnbackService")||
					 methodname.equals("paymentrecords_zfbybtz")||
					 methodname.equals("paymentrecords_zfbtb")||methodname.equals("order_qtorderinfo")){
				 return arg.invoke();
			 }
			 return "ajaxtimeout";
	        }else if(user == null){
	        	if( methodname.equals("commodity_houtcommodity")||methodname.equals("shoppingcar_querygwccount")
	        			||methodname.equals("commodity_commoditycount")
	        			||methodname.equals("paymentrecords_UnionReturnbackService")
						 ||methodname.equals("paymentrecords_UnionqtReturnbackService")||
						 methodname.equals("paymentrecords_zfbybtz")||
						 methodname.equals("paymentrecords_zfbtb")||methodname.equals("order_qtorderinfo")){
					 return arg.invoke();
				 }
	            return "timeout_1";
	        }
	        return arg.invoke();
	}
	 private boolean isAjaxRequest(HttpServletRequest request) {  
	        String header = request.getHeader("X-Requested-With");  
	        if (header != null && "XMLHttpRequest".equals(header))  
	            return true;  
	        else  
	            return false;  
	    }
}
