package com.cisoft.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cisoft.model.Orders;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.PaymentRecords;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.PaymentrecordsService;
import com.cisoft.service.ShoppingCarService;
import com.cisoft.service.UserService;
import com.opensymphony.xwork2.ActionContext;

import co.alipay.config.AlipayConfig;
import co.alipay.util.AlipayNotify;


public class wxPayWap {
	final static Logger logger = LoggerFactory
			.getLogger(wxPayWap.class);
	
	private PaymentRecords pr = new PaymentRecords();
	private Orders orders ;
	
	@Resource
	ShoppingCarService shoppingCarService;
	@Resource
	PaymentrecordsService paymentrecordsService;
	@Resource
	OrdersService ordersService;
	@Resource
	OrdersRecordService ordersrecordService;
	@Resource
	CommodityService commodityService;
	@Resource
	OrdersCommodityDetailsService ocdetailsService;
	@Resource
	private UserService userService;
	
	/**
	 * 支付宝wap 手机网站支付接口 
	 * lgc
	 * 2014-10-28	
	 * @throws Exception 
	 */
		
	//服务器异步通知页面路径
		public String zfbwapybtz()throws Exception{
			logger.error("进入服务器异步通知后台：11");
			ServletActionContext.getResponse().setContentType(
					"text/html;charset=utf-8");
			// 获取输出流，然后使用
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx
					.get(ServletActionContext.HTTP_REQUEST);
			
			//获取支付宝POST过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			
			//RSA签名解密
		   	if(AlipayConfig.sign_type.equals("0001")) {
		   		params = AlipayNotify.decrypt(params);
		   	}
			//XML解析notify_data数据
			Document doc_notify_data = DocumentHelper.parseText(params.get("notify_data"));
			
			//商户订单号
			String out_trade_no = doc_notify_data.selectSingleNode( "//notify/out_trade_no" ).getText();

			//支付宝交易号
			String trade_no = doc_notify_data.selectSingleNode( "//notify/trade_no" ).getText();

			//交易状态
			String trade_status = doc_notify_data.selectSingleNode( "//notify/trade_status" ).getText();


			logger.error("进入服务器异步通知后台:返回参数－"+out_trade_no+"-"+trade_no+"-"+trade_status);
			
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			logger.error("进入服务器异步通知后台－验证：12－"+params);
			if(AlipayNotify.verifyNotify(params)){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码

				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			    if("WAIT_BUYER_PAY".equals(trade_status)){
			    	//产生交易记录，待付款
			    	logger.error("进入服务器异步通知后台－产生交易，待支付：12.1-:"+trade_status);
					// 该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
					List<Orders> order = this.ordersService
							.findBybhzfb(out_trade_no);
					if (order.size() > 0) {
						orders = order.get(0);
						if(orders.getO_jyh()==null){
							orders.setO_jyh(trade_no);
							this.ordersService.save(orders);
						}
						logger.error("支付宝(买家发生交易但未付款):" + orders.getO_status());
						
						if (orders.getO_status() ==8) {
							logger.error("支付宝33:");
							//缴费记录
							adddalpaymentrecords(out_trade_no, 0, 2, trade_status,
									trade_no);
							//订单操作记录
							//addorderrecord(out_trade_no,7);
						}
					}
			    	
			    	out.println("success");	//请不要修改或删除
			    }else if(trade_status.equals("TRADE_FINISHED")){
					//交易成功，且不做任何操作
			    	
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//该种交易状态只在两种情况下出现
					//1、开通了普通即时到账，买家付款成功后。
					//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
			    	logger.error("进入服务器异步通知后台－交易成功且不做任何操作：12.2-:"+trade_status);
			    	
					
					out.println("success");	//请不要修改或删除
				}else if("TRADE_PENDING".equals(trade_status)){
					//等待卖家收款(买家付款后,如果卖家账号被冻结)。
					logger.error("进入服务器异步通知后台－买家付款后,如果卖家账号被冻结：12.2-:"+trade_status);
					out.println("success");	//请不要修改或删除
				} else if("TRADE_CLOSED".equals(trade_status)){
					//  在指定时间段内未支付时关闭的交易;   
					// 在交易完成全额退款成功时关闭的交易。
					logger.error("进入服务器异步通知后台－在指定时间段内未支付时关闭的交易：12.2-:"+trade_status);
					out.println("success");	//请不要修改或删除
				}
			    else if (trade_status.equals("TRADE_SUCCESS")){
					 //付款成功
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
					logger.error("进入服务器异步通知后台－付款成功：12.4-:"+trade_status);
					List<Orders> order = this.ordersService
							.findBybhzfb(out_trade_no);
					if (order.size() > 0) {
						orders = order.get(0);
						if(orders.getO_jyh()==null){
							orders.setO_jyh(trade_no);
						}
						logger.error("进入服务器异步通知后台－付款成功：支付宝(买家已付款，卖家未发货):" + orders.getO_status());
						if (orders.getO_status() ==8) {
							logger.error("支付宝77:");
							adddalpaymentrecords(out_trade_no, 1, 2, trade_status,
									trade_no);
							orders.setO_status(0);
							orders.setO_fkfs(2);//支付方式
							this.ordersService.save(orders);
							//订单操作记录
							//addorderrecord(out_trade_no,0);
						}
					}
					out.println("success");	//请不要修改或删除
				}

				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
					

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{//验证失败
				out.println("fail");
			}
			return null;
		}

		
		
		//页面跳转同步通知页面路径
		public String zfbwapymtz() throws IOException{
			// 获取输出流，然后使用
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx
					.get(ServletActionContext.HTTP_REQUEST);
			HttpServletResponse response= (HttpServletResponse) ctx
					.get(ServletActionContext.HTTP_RESPONSE);
			request.setCharacterEncoding("UTF-8");        
		    response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						
						
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号

			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//支付宝交易号

			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//交易状态
			String result = new String(request.getParameter("result").getBytes("ISO-8859-1"),"UTF-8");

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			
			//计算得出通知验证结果
			boolean verify_result = AlipayNotify.verifyReturn(params);
			logger.error("页面跳转同步通知页面:返回参数－"+out_trade_no+"-"+trade_no+"-"+result+"-"+verify_result);
			
			if(verify_result){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码

				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

				logger.error("页面跳转同步通知页面:验证成功－"+verify_result);
				List<Orders> order = this.ordersService
						.findBybhzfb(out_trade_no);
				if (order.size() > 0) {
					orders = order.get(0);
					
					logger.error("支付宝前台:" + orders.getO_status()+"--商品名称："+orders.getO_title());
					if (orders.getO_status() == 0||orders.getO_status() == 8) {
						logger.error("支付宝前台(当状态未未付款修改为已付款):" + orders.getO_status());
						if(orders.getO_jyh()==null){
							orders.setO_jyh(trade_no);
						}
						if(orders.getO_status()==8){
							orders.setO_status(0);
						}
						orders.setO_fkfs(2);//支付方式
						SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						orders.setFktime(sfd.format(new Date()));
						this.ordersService.save(orders);
						
						adddalpaymentrecords(out_trade_no, 1, 2, result,
								trade_no);
						//订单操作记录
						addorderrecord(out_trade_no,0);
						
					}
				}
				
				String pagestr=
					  "<!DOCTYPE html>"+
				"<html>"+
				"	<head>"+
					"	<meta http-equiv=\"content-type\" content=\"text/html;charset=UTF-8\" />"+
						"<meta name=\"author\" content=\"www.frebsite.nl\" />"+
						"<meta name=\"viewport\" content=\"width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes\" />"+
							"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"+
							"<title>支付提示</title>"+
							"<link rel=\"stylesheet\" href=\"http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css\">"+
							"<script src=\"http://code.jquery.com/jquery-1.8.3.min.js\"></script>"+
							"<script src=\"http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js\"></script>"+
							"</head>"+
							"<body>"+
							"<div data-role=\"page\" id=\"pageone\" style=\"text-align:center;margin:0 auto;\">"+
							"<div data-role=\"content\"> "+
							"<h3>付款成功</h3>"+
							"<p>商品名称:"+orders.getO_title()+"</p>"+
							"<a href=\"wxcommodity_querycommdityList\" data-role=\"button\" >继续购物</a>"+
							"<a href=\"wxorders_getList?orders.user.u_id="+orders.getUser().getU_id()+"\" data-role=\"button\">查看订单</a>"+
							"<br>"+
							"</div> "+
							"</div>"+
							"</body>"+
							"</html>";
				logger.error("返回参数："+pagestr);
				 out.println(pagestr);
				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{
				logger.error("页面跳转同步通知页面:验证失败");
				String pagestr=
						"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"+
						"<html>"+
						"<head>"+
						"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"+
						"<title>支付提示</title>"+
						"<link rel=\"stylesheet\" href=\"http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css\">"+
						"<script src=\"http://code.jquery.com/jquery-1.8.3.min.js\"></script>"+
						"<script src=\"http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js\"></script>"+
						"</head>"+
						"<body>"+
						"<div data-role=\"page\" id=\"pageone\" style=\"text-align:center;margin:0 auto;\">"+
						"<div data-role=\"content\"> "+
						"<h3 style=\"color:red;\">付款失败</h3>"+
						"<p>商品名称:"+orders.getO_title()+"</p>"+
						"<a href=\"http://www.100nn.cn/wxcommodity_querycommdityList\" data-role=\"button\" >继续购物</a>"+
						"<a href=\"http://www.100nn.cn/wxorders_getList?orders.user.u_id="+orders.getUser().getU_id()+"\" data-role=\"button\">查看订单</a>"+
						"<br>"+
						"</div> "+
						"</div>"+
						"</body>"+
						"</html>";
															
										out.println(pagestr);
			}
			return null;
		}
		
		
		// 添加缴费记录 2:支付宝缴费记录
		private void adddalpaymentrecords(String ddbh, int step, int lx, String zt,
				String jyh) {
			try {
				List<PaymentRecords> prs = paymentrecordsService
						.findByorderbhzfb(ddbh);
				if (prs.size() > 0) {
					pr = prs.get(0);
					pr.setPr_ddbh(ddbh);
					pr.setPr_ddlx(lx);
					pr.setPr_scbc(1);
					pr.setPr_startTime(new Date());
					pr.setPr_status(step);
					pr.setQid(jyh);
					pr.setCode(zt);
					paymentrecordsService.save(pr);
					logger.error("修改支付宝缴费记录44:" + pr.getPr_id());
				} else {
					pr = new PaymentRecords();
					pr.setPr_ddbh(ddbh);
					pr.setPr_ddlx(lx);
					pr.setPr_scbc(1);
					pr.setPr_startTime(new Date());
					pr.setPr_status(step);
					pr.setQid(jyh);
					pr.setCode(zt);
					paymentrecordsService.save(pr);
					logger.error("添加支付宝缴费记录66:" + pr.getPr_id());
				}
			} catch (Exception e) {
				logger.error("添加支付宝缴费记录［错误］:" + e.getMessage());
			}
		}
		
		
		// 添加订单操作记录
		private void addorderrecord(String bh, int step) {
			try {
				List<Orders> order = this.ordersService.findBybhzfb(bh);
				if (order.size() > 0) {
					orders = order.get(0);
					OrdersRecord orecord = new OrdersRecord();
					orecord.setOr_scbs(1);
					orecord.setOr_step(step);
					orecord.setOr_szsj(new Date());
					orecord.setOrders(orders);
					ordersrecordService.save(orecord);
					logger.error("添加订单操作记录成功,订单编号：" + orders.getO_bh()
							+ ",订单操作记录编号：" + orecord.getOr_id());
				} else {
					logger.error("添加订单操作记录报错，错误信息：获取不到订单信息");
				}
			} catch (Exception e) {
				logger.error("添加订单操作记录报错，错误信息：" + e.getMessage());
			}
		}
		
}
