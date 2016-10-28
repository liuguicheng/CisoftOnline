package com.cisoft.weixin;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Articles;
import com.cisoft.model.Item;
import com.cisoft.model.User;
import com.cisoft.model.WeixinAccept;
import com.cisoft.service.UserService;
import com.opensymphony.xwork2.ModelDriven;



public class WeixinDevelop implements ModelDriven<User>{
		@Resource
		private UserService userService;
		private User user=new User();
		
		public User getModel() {
			return user;
		}
		//微信接口
		String token="ec1fa6e5d29d46cc8eb6346eee9d8123";
		String appid="wx0ba9c645cf928bdd";
		String appsecret="bf8e94ee8cacf082371cdf25efedb84e";
		/*
		 * signature、timestamp、nonce、echostr是微信服务器发送过来的参数
		 * 可以从request里面获取
		 */
		private String signature;
		private String timestamp;
		private String nonce;
		private String echostr;
		private String code;
		private String state;
		private String msg="";
		public void setSignature(String signature) {
			this.signature = signature;
		}
		public void setTimestamp(String timestamp) {
			this.timestamp = timestamp;
		}
		public void setNonce(String nonce) {
			this.nonce = nonce;
		}
		public void setEchostr(String echostr) {
			this.echostr = echostr;
		}
		
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		/*
		 * 处理微信服务器发送过来的请求
		 */
		public String acceptweixin() throws IOException{
		
			/*
			  *将token、timestamp、nonce三个参数进行字典序排序
			 */
			String[] a = {token,timestamp,nonce};  
	        Arrays.sort(a);//数组排序  
	        String str="";  
	        for(int i=0;i<a.length;i++){  
	        	str=str+a[i];  
	        }  
	        
	        /*
	         * 将三个参数字符串拼接成一个字符串进行sha1加密
	         */
	        String echo=DigestUtils.shaHex(str);
	        /*
	         * 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
	         */
//	        if(echo.equals(signature)){        	
//	        	HttpServletResponse response=ServletActionContext.getResponse();
//	        	//如果加密后的结果和"signature"相同则把echostr返回给微信服务器
//	        	response.getWriter().write(echostr);
//	        }
	        System.out.println("signature="+signature);
	        System.out.println("echo="+echo);
	        if(echo.equals(signature)){    
	        	System.out.println("进入：1");
	        	HttpServletResponse response=ServletActionContext.getResponse();
	            HttpServletRequest request=ServletActionContext.getRequest();
//	            System.out.println("post="+request.getMethod().toLowerCase());
	            msg=processRequest(request);
	            System.out.println("msg="+msg);
	            response.setCharacterEncoding("UTF-8");
	            response.setContentType("UTF-8");
	            response.getWriter().write(msg);
	            response.getWriter().flush(); 

	        }
			return null;
		}
		private String processRequest(HttpServletRequest request) throws IOException {
			String data="";
			System.out.println(request.getMethod().toLowerCase());
			String fromusername="";
			String eventtype="";
			String msgtype="";
			String tousername="";
			 XmlUtils<WeixinAccept> xu=new XmlUtils<WeixinAccept>();
			//接受数据
			if(request.getMethod().toLowerCase().equals("post")){
				InputStream inputStream=request.getInputStream();
				
				ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int len = 0;
		        while( (len = inputStream.read(buffer)) !=-1 ){
		            outStream.write(buffer, 0, len);
		        }
		        data = outStream.toString();
		        System.out.println("data="+data);
		        outStream.close();
		        inputStream.close();
		       
				//解释数据
				WeixinAccept weixinAccept=xu.parsexml(data,"xml",WeixinAccept.class);
				 fromusername=weixinAccept.getFromUserName();//用户
//				System.out.println("fromusername="+fromusername);
				 tousername=weixinAccept.getToUserName();//开发者
				 msgtype=weixinAccept.getMsgType();
				 eventtype=weixinAccept.getEvent();
	 			System.out.println("openid="+fromusername+"| type="+msgtype+"| event="+eventtype);
				ServletActionContext.getRequest().getSession().setAttribute("openid",fromusername);
			}else{
				code=request.getParameter("code");
				System.out.println("code="+code);
				//修改公众平台 配置文件时需加上以下几行
//				String echostr=request.getParameter("echostr");
//				System.out.println("echostr:=="+echostr);
//				return echostr;
	 		}
			
			if(eventtype.toLowerCase().equals("subscribe")&&msgtype.toLowerCase().equals("event")){
				System.out.println("进入关注：");
				//关注事件
				//查询是否存在openID在系统
				queryWeixinInfo(fromusername);
				//返回信息
				WeixinAccept weixinSend=new WeixinAccept();
				weixinSend.setToUserName(fromusername);//用户
				weixinSend.setFromUserName(tousername);//开发者
				weixinSend.setArticleCount("1");
				Item item=new Item();
				item.setTitle("100南宁同城配送超市，百种商品免费配送到家！");
//				item.setDescription("阅读全文");
				item.setPicUrl("http://www.100nn.cn/100nnwx/img/banner.jpg");
				item.setUrl("http://www.100nn.cn/wxcommodity_querycommdityList?bsid="+fromusername.toLowerCase().trim());
				Articles ac=new Articles();
				ac.setItem(item);
				weixinSend.setArticles(ac);
				weixinSend.setCreateTime(new Date().getTime());
				weixinSend.setMsgType("news");
				String xml=xu.toxml(weixinSend, "xml", WeixinAccept.class);
				return xml;
				
			} else if(eventtype.toLowerCase().equals("unsubscribe")&&msgtype.toLowerCase().equals("event")){
				System.out.println("进入取消关注：");
				//取消关注事件
				List<User> users=userService.findBywxbs(fromusername.toLowerCase().trim());
				if(users.size()>0){
					user=users.get(0);
					System.out.println("修改关注状态"+user.getU_id());
					System.out.println("修改关注前id中标示"+user.getUwx_gzbs());
					user.setUwx_gzbs(0);
					userService.save(user);
					ServletActionContext.getRequest().getSession().removeAttribute("usersession");
					ServletActionContext.getRequest().getSession().invalidate();
					System.out.println("更新后的标识5："+user.getUwx_gzbs());
//					ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
					System.out.println("修改关注后id中标示"+user.getUwx_gzbs());
				}
			}else if(eventtype.toLowerCase().equals("click")&&msgtype.toLowerCase().equals("event")){
				//返回信息
				WeixinAccept weixinSend=new WeixinAccept();
				weixinSend.setToUserName(fromusername);//用户
				weixinSend.setFromUserName(tousername);//开发者
				weixinSend.setCreateTime(new Date().getTime());
				weixinSend.setMsgType("text");
				weixinSend.setContent("即将开通,敬请期待！");
				String xml=xu.toxml(weixinSend, "xml", WeixinAccept.class);
				return xml;
			} else{
					if(fromusername!=null){
						List<User> users=userService.findBywxbs(fromusername.toLowerCase().trim());
						if(users.size()>0){
							ServletActionContext.getRequest().getSession().removeAttribute("usersession");
							ServletActionContext.getRequest().getSession().invalidate();
							System.out.println("更新后的标识4："+user.getUwx_gzbs());
//							ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
						}
					}	

				
				
				
			}
			
			
			
			return null;
		}
		
		public String sendtosocket(){
			System.out.println("code="+code);
			System.out.println("state="+state);
			String result="";
			try{	
//			String urlstr="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxac6fc2bbd219962b&secret=c659ae8a8aa4d525b80630a1282d5885&code="+code+"&grant_type=authorization_code";
				String urlstr="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
				URL url = new URL(urlstr);
				HttpURLConnection httpCon = (HttpURLConnection)url.openConnection();
				httpCon.setRequestMethod("POST");
				httpCon.setDoOutput(true);
				PrintStream out = new PrintStream(httpCon.getOutputStream());
				httpCon.connect();		     // 与服务器连接
				int code = httpCon.getResponseCode();// 获取服务器响应码
				if(code == 200) {
					BufferedReader br = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));
					String line;
					StringBuilder sb = new StringBuilder();
					while((line = br.readLine()) != null) {
						sb.append(line).append("\r\n");
					}
					JSONObject json=JSONObject.fromObject(sb.toString());
					String value=json.getString("openid");
					System.out.println("value:"+value);
					System.out.println("state:"+state);
					ServletActionContext.getRequest().getSession().setAttribute("openid",value);
					if(state.equals("1")){
						state=value;
						//购物车
						return "gwclist";
					}else if(state.equals("2")){
						state=value;
						//订单
						return "ddlist";

					}else if(state.equals("3")){
						state=value;
						//地址
						return "dzlist";
					}else
					if(state.equals("4")){
						//跳转添加购物车
						state=value;
						return  "addgwc";
					}else if(state.equals("5")){
						//跳转首页
						state=value;
						return "toindex";
					}else if(state.equals("7")){
						//跳转个人中心
						state=value;
						return "togrzx";
					}else if(state.equals("8")){
						//获取微信用户基本信息
						state=value;
						return "towxinfo";
					}else{
						//跳转首页
						state=value;
						return "toindex";
					}
				}
				httpCon.disconnect();
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
				return "toindex";
		}
		
		//获取access_token
		private String queryaccesstoken(){
			String access_token="";
//			String urlstr="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxac6fc2bbd219962b&secret=c659ae8a8aa4d525b80630a1282d5885";
			String urlstr="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appid+"&secret="+appsecret;
			try{
			URL url = new URL(urlstr);
			HttpURLConnection httpCon = (HttpURLConnection)url.openConnection();
			httpCon.setRequestMethod("POST");
			httpCon.setDoOutput(true);
			PrintStream out = new PrintStream(httpCon.getOutputStream());
			httpCon.connect();		     // 与服务器连接
			int code = httpCon.getResponseCode();// 获取服务器响应码
			if(code == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));
				String line;
				StringBuilder sb = new StringBuilder();
				while((line = br.readLine()) != null) {
					sb.append(line).append("\r\n");
				}
				JSONObject json=JSONObject.fromObject(sb.toString());
				access_token=json.getString("access_token");
			}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return access_token;
		}
		//获取openid
		private String queryOpenid(){
			String openid="";
			try{	
//				String urlstr="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxac6fc2bbd219962b&secret=c659ae8a8aa4d525b80630a1282d5885&code="+code+"&grant_type=authorization_code";
				String urlstr="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";	
				URL url = new URL(urlstr);
					HttpURLConnection httpCon = (HttpURLConnection)url.openConnection();
					httpCon.setRequestMethod("POST");
					httpCon.setDoOutput(true);
					PrintStream out = new PrintStream(httpCon.getOutputStream());
					httpCon.connect();		     // 与服务器连接
					int code = httpCon.getResponseCode();// 获取服务器响应码
					if(code == 200) {
						BufferedReader br = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));
						String line;
						StringBuilder sb = new StringBuilder();
						while((line = br.readLine()) != null) {
							sb.append(line).append("\r\n");
						}
						JSONObject json=JSONObject.fromObject(sb.toString());
						openid=json.getString("openid");
						//查询是否存在openID在系统
						List<User> users=userService.findBywxbs(openid.toLowerCase().trim());
						if(users.size()==0){
							User user=new User();
							user.setUwx_bs(openid.toLowerCase().trim());
							user.setU_scbs(1);
							user.setUwx_gzbs(0);
							userService.save(user);
							ServletActionContext.getRequest().getSession().removeAttribute("usersession");
							ServletActionContext.getRequest().getSession().invalidate();
							System.out.println("更新后的标识2："+user.getUwx_gzbs());
//							ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
						}else{
							ServletActionContext.getRequest().getSession().removeAttribute("usersession");
							ServletActionContext.getRequest().getSession().invalidate();
							System.out.println("更新后的标识3："+user.getUwx_gzbs());
//							ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
						}
						
					}
					httpCon.disconnect();
				}catch(Exception e){
					System.out.println(e.getMessage());
				}
			return openid;
		}
		//获取微信基础信息
		private void queryWeixinInfo(String openid){
			//获取access_token
			String accesstoken=queryaccesstoken();
			try{	
				String urlstr="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+accesstoken+"&openid="+openid+"&lang=zh_CN";
					URL url = new URL(urlstr);
					HttpURLConnection httpCon = (HttpURLConnection)url.openConnection();
					httpCon.setRequestMethod("POST");
					httpCon.setDoOutput(true);
					httpCon.connect();		     // 与服务器连接
					int code = httpCon.getResponseCode();// 获取服务器响应码
					if(code == 200) {
						BufferedReader br = new BufferedReader(new InputStreamReader(httpCon.getInputStream(),"UTF-8"));
						String line;
						StringBuilder sb = new StringBuilder();
						while((line = br.readLine()) != null) {
							sb.append(line).append("\r\n");
						}
						br.close();
						String info=sb.toString();
						System.out.println("返回参数："+info);
						JSONObject json=JSONObject.fromObject(info);
						System.out.println("获取用户基本信息json："+json);
						String nickname=json.getString("nickname");
						String headimgurl=json.getString("headimgurl");
						openid=json.getString("openid").toLowerCase().trim();
						List<User> users=userService.findBywxbs(openid);
						if(users.size()>0){
							user=users.get(0);
							if(user.getUwx_bs().equals(openid)){
								System.out.println("openid已存在"+user.getU_id());
								user.setU_name(nickname);
								user.setTximgurl(headimgurl);
								user.setUwx_gzbs(1);
								
								userService.save(user);
								
							}else{
								user=new User();
								System.out.println("更新info信息，openid不存在");
								user.setU_name(nickname);
								user.setTximgurl(headimgurl);
								user.setUwx_bs(openid);
								user.setUwx_gzbs(1);
								user.setU_scbs(1);
								userService.save(user);
							}
						}else{
							    System.out.println("本地数据库不存在，openid不存在");
									user=new User();
									user.setUwx_gzbs(1);
									user.setU_scbs(1);
									user.setU_name(nickname);
									user.setTximgurl(headimgurl);
									user.setUwx_bs(openid);
									userService.save(user);
									
						}
						ServletActionContext.getRequest().getSession().removeAttribute("usersession");
						ServletActionContext.getRequest().getSession().invalidate();
						System.out.println("更新后的标识："+user.getUwx_gzbs());
//						ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
						
					}
					httpCon.disconnect();
				}catch(Exception e){
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
		}
		//同步微信用户基本信息
		public String queryWxUserInfo(){
			
			queryWeixinInfo(state);
			return "togrzx";
		}
		
		//验证是否关注
		public String yzgz(){
			code=code;
			return "yzgz";
		}
		
		
		
		
		
}
