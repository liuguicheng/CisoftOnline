package com.cisoft.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.PaymentRecords;
import com.cisoft.model.ShoppingCart;
import com.cisoft.model.User;
import com.cisoft.model.UserAddress;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.PaymentrecordsService;
import com.cisoft.service.ShoppingCarService;
import com.cisoft.service.UserService;
import com.cisoft.ups.paymentPlatform.service.PaymentService;
import com.cisoft.ups.paymentPlatform.service.exception.UPHttpPaymentException;
import com.cisoft.ups.paymentPlatform.service.exception.UPTranslateException;
import com.cisoft.ups.paymentPlatform.service.exception.UPValidationException;
import com.cisoft.ups.paymentPlatform.service.exception.UPWrongSinatureException;
import com.cisoft.ups.paymentPlatform.service.impl.PaymentServiceImpl;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpPaymentDetail;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpPaymentResponse;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpPaymentSignTypeEnum;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpTransaction;
import com.cisoft.ups.paymentPlatform.unionPay.desktop.UnionQuickPayConf;
import com.cisoft.utils.PayQueryTimerTask;
import com.opensymphony.xwork2.ActionContext;

public class wxPaymentrecordsAction {
	final static Logger logger = LoggerFactory
			.getLogger(wxPaymentrecordsAction.class);
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
	private String result = "";
	private String zfje;// 支付金额
	private String bh;//订单编号
	
	

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getResult() {
		return result;
	}

	private String id;

	public String getId() {
		return id;
	}

	public String getZfje() {
		return zfje;
	}

	public void setZfje(String zfje) {
		this.zfje = zfje;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public String getList() {
		return "list";
	}

	public String save() {
		if (pr.getPr_id() == 0) {

			result = "添加成功";
		} else {
			result = "修改成功";
		}
		return "save";
	}

	public String addView() {
		return "addView";
	}

	public String editView() {
		return "editView";
	}

	// 修改信息
	public String updatepwd() {
		result = "修改成功";
		return "updatepwd";
	}

	public String delete() {

		result = "删除成功";
		return "delete";
	}

	/**
	 * 订单支付
	 */
	public String ddzf() {
		// //银联支付
		// dyyljk(id);
		// 支付宝支付
		// if (zfbzf()) {

		// // 添加缴费记录
		// addpaymentrecords(orders, orders.getO_status(), 1);
		// // 修改购物车中订单状态
		// upgwc(id);
		// // 添加订单流程记录
		// addorderrecord(orders, orders.getO_status());
		// // 附加订单去订单明细
		// upordercommodityDetail(orders);
		result = "";
		// }

		return "ddzf";

	}
	//修改商品数量
	private void upcommditysum(){
		
	}
	// 支付宝支付
	public String zfbzf() {
		// 生成订单 订单状态8 用户下单未付款
		// 六位随机数
		Random random = new Random();
		int x = random.nextInt(899999);
		x = x + 100000;
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String bh = x + s.format(new Date());// 订单编号
		double je = Double.valueOf(zfje);// 金额
		/*
		 * 此处根据自己的业务来处理（如生成订单之类的）
		 */
		orders = scorder(bh, je, shdz, 2);
		// 添加订单流程记录
		addorderrecord(orders.getO_bh(), 7);
		System.out.println("id="+id);
		// 修改购物车中订单状态 id：购物车商品id
		upgwc(id);
		System.out.println("result="+result);
		// 附加订单去订单明细
		upordercommodityDetail(orders, result);
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		request.setAttribute("order", orders);
	    	
	
		return "zfbzfsuccess";
	}

	// 支付宝服务器异步通知页面文件 (pc网站版)
	public String zfbybtz() throws ServletException, IOException {
		logger.error("进入后台：11");
		// 指定输出内容类型和编码
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		// 获取输出流，然后使用
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 商户订单号
		// ServletActionContext.getRequest().getInputStream();
		logger.error("params:" + params);
		String out_trade_no = new String(request.getParameter("out_trade_no")
				.getBytes("ISO-8859-1"), "UTF-8");
		// 支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes(
				"ISO-8859-1"), "UTF-8");
		// 交易状态
		String trade_status = new String(request.getParameter("trade_status")
				.getBytes("ISO-8859-1"), "UTF-8");
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		if (AlipayNotify.verify(params)) {// 验证成功
			// ////////////////////////////////////////////////////////////////////////////////////////
			// 请在这里加上商户的业务逻辑程序代码
			// ——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			// 判断订单编号是否做过处理
			logger.error("支付宝11:" + out_trade_no);
			logger.error("支付宝11:" + trade_no);
			logger.error("支付宝11:" + trade_status);
			if (trade_status.equals("WAIT_BUYER_PAY")) {
				logger.error("支付宝22--:");
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

				out.println("success"); // 请不要修改或删除
			} else if (trade_status.equals("WAIT_SELLER_SEND_GOODS")) {
				// 该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
				logger.error("支付宝55--:");
				List<Orders> order = this.ordersService
						.findBybhzfb(out_trade_no);
				if (order.size() > 0) {
					orders = order.get(0);
					if(orders.getO_jyh()==null){
						orders.setO_jyh(trade_no);
					}
					logger.error("支付宝(买家已付款，卖家未发货):" + orders.getO_status());
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
				out.println("success"); // 请不要修改或删除
			} else if (trade_status.equals("WAIT_BUYER_CONFIRM_GOODS")) {
				logger.error("支付宝88--:");
				// 该判断表示卖家已经发了货，但买家还没有做确认收货的操作
				List<Orders> order = this.ordersService
						.findBybhzfb(out_trade_no);
				if (order.size() > 0) {
					orders = order.get(0);
					
					logger.error("支付宝（卖家已发货，买家未收货）:" + orders.getO_status());
					if (orders.getO_status() == 0) {
						logger.error("支付宝100:");
						orders.setO_status(1);
						this.ordersService.save(orders);
						//订单操作记录
						//addorderrecord(out_trade_no,1);
					}
				}

				out.println("success"); // 请不要修改或删除
			} else if (trade_status.equals("TRADE_FINISHED")) {
				logger.error("支付宝11--:");
				// 该判断表示买家已经确认收货，这笔交易完成
				List<Orders> order = this.ordersService
						.findBybhzfb(out_trade_no);
				if (order.size() > 0) {
					orders = order.get(0);
					
					logger.error("支付宝12(买家已确认收货，只笔交易完成):" + orders.getO_status());
					if (orders.getO_status() ==1) {
						logger.error("支付宝13:");
						orders.setO_status(2);
						this.ordersService.save(orders);
						//订单操作记录
						addorderrecord(out_trade_no,2);
					}
				}

				out.println("success"); // 请不要修改或删除
			} else {
				out.println("success"); // 请不要修改或删除
			}

			// ////////////////////////////////////////////////////////////////////////////////////////
		} else {// 验证失败
			out.println("fail");
		}
		return null;
	}

	// 页面跳转同步通知文件 (pc网站版)
	public String zfbtb() throws ServletException, IOException {
		// 指定输出内容类型和编码
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		// 获取输出流，然后使用
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no")
				.getBytes("ISO-8859-1"), "UTF-8");

		// 支付宝交易号

		String trade_no = new String(request.getParameter("trade_no").getBytes(
				"ISO-8859-1"), "UTF-8");

		// 交易状态
		String trade_status = new String(request.getParameter("trade_status")
				.getBytes("ISO-8859-1"), "UTF-8");

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

		// 计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);

		if (verify_result) {// 验证成功
			// ////////////////////////////////////////////////////////////////////////////////////////
			// 请在这里加上商户的业务逻辑程序代码

			// ——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

			if (trade_status.equals("WAIT_SELLER_SEND_GOODS")) {
				logger.error("支付宝前台返回:");
				List<Orders> order = this.ordersService
						.findBybhzfb(out_trade_no);
				if (order.size() > 0) {
					orders = order.get(0);
					
					logger.error("支付宝前台:" + orders.getO_status());
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
						
						adddalpaymentrecords(out_trade_no, 1, 2, trade_status,
								trade_no);
						//订单操作记录
						addorderrecord(out_trade_no,0);
						
					}
					// 该页面可做页面美工编辑
					
					String pagestr="<div style=\"background:#FFF;\">"+
		"<div style=\" width:100%;height:60px;background:#8bc563;line-height:60px;text-align:center;font-family:'微软雅黑';font-size:18px; color:#FFFFFF;\">支付结果</div>"+
		"<div style=\"width:100%; padding-top:10px;\">"+
       "   <div style=\"width:124px;height:20px;line-height:20px;margin:0 auto;\">"+
       "     <div class=\"Mian_titleCG_ico\"><img src=\"img/cg_ico.gif\" width=\"24\" height=\"20\"></div>"+
          "  <div class=\"Mian_titleCG_font\">付款成功</div>"+
        "  </div>"+
        "  <table style=\"width:100%;margin:20px auto 0; font-family:'微软雅黑'; color:#6F6F6F;\">"+
         "   <tr>"+
          "  <td valign=\"top\" style=\"width:30%;line-height:40px; text-align:center; float:left;\">商品名称:</td>"+
          "  <td valign=\"top\" style=\" width:70%;line-height:40px; float:left;\">力拓稻源香 香丝苗 绿色大米 软糯甘甜</td>"+
         "   <tr>"+
        "  </table>"+
       "   <div style=\"width:100%; height:40px; padding-top:20px;\">"+
        "    <div style=\" width:50%; float:left;\"><a href=\"#\" title=\"\" target=\"_self\" style=\"display:block; width:80%; height:40px; background:#b3d303; -moz-border-radius: 5px; -webkit-border-radius: 5px;  border-radius:5px; box-shadow: 0px 2px 5px #888888; text-align:center; line-height:40px; color:#FFFFFF;font-family:'微软雅黑'; margin:0 auto;\">查看我的订单</a></div>"+
          "  <div style=\" width:50%; float:right;\"><a href=\"#\" title=\"\" target=\"_self\" style=\"display:block; width:80%; height:40px; background:#f0c946; -moz-border-radius: 5px; -webkit-border-radius: 5px;  border-radius:5px; box-shadow: 0px 2px 5px #888888; text-align:center; line-height:40px; color:#FFFFFF;font-family:'微软雅黑'; margin:0 auto;\" onclick=\"\">继续购物</a></div>"+
         " </div>"+
	"	</div>"+
  "  </div>"+
   " <script type=\"text/javascript\">"+
"function ond(id,orid){"+
"  if(id==1){"+
  "  window.location.href=\"../towxpage.jsp\";"+
 " }else{"+
  "  window.location.href=\"wxorders_getList?orders.user.u_id=\"+orid;"+
"  }"+
  
"}"+
    "</script>";
					out.println(pagestr);
				}
			}

			// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			// ////////////////////////////////////////////////////////////////////////////////////////
		} else {
			adddalpaymentrecords(out_trade_no, 2, 2, trade_status,
					trade_no);
			
			// 该页面可做页面美工编辑
			out.println("支付失败");
			
		}
		return null;
	}

	// 支付宝－确认发货
	public String zfbqrfh() {
		logger.error("进入支付宝取人发货页面：");
		// 指定输出内容类型和编码
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		// 获取输出流，然后使用
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();

			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx
					.get(ServletActionContext.HTTP_REQUEST);
			//订单编号
			String no=request.getParameter("ddbh");
			List<Orders> orderlist=this.ordersService.findBybhzfb(no);
			if(orderlist.size()>0){
				this.orders=orderlist.get(0);
				logger.error("进入支付宝页面获取订单状态为：",orders.getO_status());
				if(orders.getO_status()==0){
			
			// 支付宝交易号
			String trade_no = new String(request.getParameter("WIDtrade_no")
					.getBytes("ISO-8859-1"), "UTF-8");
			// 必填
			// 物流公司名称
			String logistics_name = "申通快递";
			// 必填
			// 物流发货单号
			String invoice_no = new String(request
					.getParameter("WIDinvoice_no").getBytes("ISO-8859-1"),
					"UTF-8");
			// 物流运输类型
			String transport_type = new String(request.getParameter(
					"WIDtransport_type").getBytes("ISO-8859-1"), "UTF-8");
			logger.error("确认发货参数：trade_no",trade_no);
			logger.error("确认发货参数：invoice_no",invoice_no);
			logger.error("确认发货参数：transport_type",transport_type);
			// 三个值可选：POST（平邮）、EXPRESS（快递）、EMS（EMS）

			// ////////////////////////////////////////////////////////////////////////////////

			// 把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "send_goods_confirm_by_platform");
			sParaTemp.put("partner", AlipayConfig.partner);
			sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("trade_no", trade_no);
			sParaTemp.put("logistics_name", logistics_name);
			sParaTemp.put("invoice_no", invoice_no);
			sParaTemp.put("transport_type", transport_type);
			// 建立请求
			String sHtmlText = "";
			sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
			logger.error("确认发货11:" + sHtmlText);
			int i=sHtmlText.indexOf("<is_success>");
			logger.error("确认发货2:" + i);
			if(i>0){
			int j=sHtmlText.indexOf("</is_success>");
			logger.error("确认发货3:" + j);
			String s=sHtmlText.substring(i+12,j);
			logger.error("确认发货4:" + s);
				if(s.equals("T")){
					int z=sHtmlText.indexOf("<out_trade_no>");
					int jj=sHtmlText.indexOf("</out_trade_no>");
					String nos=sHtmlText.substring(z+14,jj);
					if(no.equals(nos)){
					// 修改订单状态
					uporder(nos, 1);
					// 添加订单流程记录
					addorderrecord(nos, 1);
					logger.error("确认发货5:发货成功");
					}else{
						logger.error("确认发货8:订单编号不一致，前台传参订单编号："+no+"&支付宝返回订单编号："+nos);	
					}
				}else if(s.equals("F")){
					int z=sHtmlText.indexOf("<error>");
					int jj=sHtmlText.indexOf("</error>");
					String nos=sHtmlText.substring(z+6,jj);
					logger.error("确认发货6:发货失败，错误信息："+nos);
				}else{
					logger.error("确认发货7:发货失败");
				}
			
			}
			
				}
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "zfbqrfhsuccess";
	}

	// 银联支付(用户付款后台发起的交易)
	public String paymentService() throws ParseException {
		System.out.println("进入银联支付");
		// 生成订单 订单状态8 用户下单未付款
		// 六位随机数
		Random random = new Random();
		int x = random.nextInt(899999);
		x = x + 100000;
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String bh = x + s.format(new Date());// 订单编号
		double je = Double.valueOf(zfje) * 100;// 金额
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
		String jg = df.format(je);
		long jgcz = new Double(jg).longValue();
		UPHttpPaymentDetail upd = new UPHttpPaymentDetail();// 付款所需要model数据
		upd.setBusinessCode("898450148161003");// 商户代码
		upd.setBusinessName("熙软循环信息科技");// 商户名称
		upd.setCallbackBackendUrl("http://www.100nn.cn/paymentrecords_UnionReturnbackService");// 银联付款结束后回调的后台地址
		upd.setCallbackFrontEndUrl("http://www.100nn.cn/paymentrecords_UnionqtReturnbackService");// 银联付款结束后回调的前端地址
		upd.setCallerIPAddress(this.getRemortIP());// 调用者的IP地址
		upd.setOrderNo(bh);// 订单编号
		upd.setPaymentAmount(jgcz);// 支付金额（单位是分）
		System.out.println(upd.getPaymentAmount());
		SimpleDateFormat dr = new SimpleDateFormat("yyyyMMddHHmmss");
		String newtime = dr.format(new Date());
		Date date = dr.parse(newtime);
		upd.setPaymentTime(date);// 付款时间
		upd.setTransTimeout(30 * 60 * 1000);// 交易超时事件 毫秒
		upd.setSecurityKey("DF8JKDOWE6FDFKEWIGOHED7DVKC");// 商城密钥
		upd.setSignType(UPHttpPaymentSignTypeEnum.signType_MD5);// 签名方式
		logger.error("订单编号：" + bh + "，传参数：id＝" + id + ",result=" + result
				+ ",zfje=" + zfje + ",shdz=" + shdz);
		logger.error("订单编号：" + bh + "发起缴费，缴费时间：" + upd.getPaymentTime()
				+ ",缴费金额：" + upd.getPaymentAmount() + ",缴费ip："
				+ upd.getCallerIPAddress());
		UPHttpPaymentResponse upr = new UPHttpPaymentResponse();
		try {
			PaymentService ps = new PaymentServiceImpl();
			// 生产环境
			upr = ps.httpPayByUnionPay(upd,
					"https://unionpaysecure.com/api/Pay.action");
			// 测试环境
			// upr = ps.httpPayByUnionPay(upd,
			// "http://www.epay.lxdns.com/UpopWeb/api/Pay.action");
		} catch (UPValidationException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			logger.error("调用银联接口支付发生错误：" + e.getMessage());
		}
		ActionContext ctx = ActionContext.getContext();
		// HttpServletRequest request =
		// (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType(upr.getContentType());
		response.setCharacterEncoding(upr.getCharset());
		try {
			response.getWriter().write(upr.getHtml());// 跳转银联页面
		} catch (IOException e) {
			// e.printStackTrace();
			logger.error("调用银联接口支付发生错误：" + e.getMessage());
		}
		response.setStatus(HttpServletResponse.SC_OK);

		/*
		 * 此处根据自己的业务来处理（如生成订单之类的）
		 */
		orders = scorder(bh, Double.valueOf(zfje), shdz, 1);
		// 添加订单流程记录
		addorderrecord(orders.getO_bh(), 7);
		// 修改购物车中订单状态
		upgwc(id);
		// 附加订单去订单明细
		upordercommodityDetail(orders, result);
		String queryUurl = "http://www.epay.lxdns.com/UpopWeb/api/Query.action";// 后台交易查询
		String code = upd.getBusinessCode();
		String ordernumber = upd.getOrderNo();
		Date ordertime = upd.getPaymentTime();
		String key = upd.getSecurityKey();
		// // 定时器
		Timer timer = new Timer();
		timer.schedule(new PayQueryTimerTask(ordersService,
				paymentrecordsService, queryUurl, code, ordernumber, ordertime,
				key), 33 * 60 * 1000);
		return null;
	}

	// 银联交易结果通知后台
	public String UnionReturnbackService() {
		logger.error("后台00::");
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		try {
			request.setCharacterEncoding(UnionQuickPayConf.charset);
		} catch (UnsupportedEncodingException e) {
		}

		Map<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < UnionQuickPayConf.notifyVo.length; i++) {
			map.put(UnionQuickPayConf.notifyVo[i],
					request.getParameter(UnionQuickPayConf.notifyVo[i]));

		}
		String signature = request.getParameter(UnionQuickPayConf.signature);
		map.put(UnionQuickPayConf.signature, signature);
		map.put(UnionQuickPayConf.signMethod,
				request.getParameter(UnionQuickPayConf.signMethod));
		request.getParameter(UnionQuickPayConf.signMethod);

		PaymentService ps = new PaymentServiceImpl();

		UPHttpTransaction ut = new UPHttpTransaction();
		try {
			logger.error("后台22::");
			ut = ps.httpPayCallbackTranslateByUnionPay(map,
					"DF8JKDOWE6FDFKEWIGOHED7DVKC");
			logger.error("后台33::");
			logger.error("后台44::" + ut.getMerId());// 商户代码 merchantId
			logger.error("后台44::" + ut.getOrderAmount());// 交易金额
															// merchantOrderAmt
			logger.error("后台44::" + ut.getOrderNumber());// 商户订单号
															// merchantOrderId
			logger.error("后台44::" + ut.getQid());// 交易流水号
			logger.error("后台44::" + ut.getRespCode());// 响应代码
			logger.error("后台44::" + ut.getRespMsg());// 响应信息
			logger.error("后台44::" + ut.getRespTime().toString());// 交易完成时间
			logger.error("后台44::" + ut.getSettleAmount());// 清算金额
			logger.error("后台44::" + ut.getSettleDate());// 清算日期
			logger.error("后台44::" + ut.getTraceNumber());// 系统跟踪号
			logger.error("后台44::" + ut.getTransType());// 交易类型
			logger.error("后台44::" + ut.getTraceTime());//系统跟踪时间（MMddHHmmss）
			// logger.info("银联返还参数：商户号："+ut.getMerId()+"交易金额："+
			// ut.getOrderAmount()+",商户订单号："+ut.getOrderNumber()
			// +",交易流水号："+ut.getQid()+",响应代码："+ut.getRespCode))
			// ",响应信息:"+upd.getCallerIPAddress());

			/*
			 * 根据响应代码处理相应的业务 ut.getRespCode()：00成功；！00失败。
			 */
			if (ut.getRespCode().equals("00")) {
				logger.info("后台55::");
				// 添加缴费记录
				addpaymentrecords(ut.getOrderNumber(), 1, 1, ut);
				// 修改订单状态
				uporder(ut.getOrderNumber(), 0);
				// 添加订单流程记录
				addorderrecord(ut.getOrderNumber(), 0);
			} else {
				logger.info("后台66::");
				// 添加缴费记录
				addpaymentrecords(ut.getOrderNumber(), 2, 1, ut);
			}
		} catch (UPValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPTranslateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPWrongSinatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPHttpPaymentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 银联交易返回前台
	public String UnionqtReturnbackService() {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		try {
			request.setCharacterEncoding(UnionQuickPayConf.charset);
		} catch (UnsupportedEncodingException e) {
		}

		Map<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < UnionQuickPayConf.notifyVo.length; i++) {
			map.put(UnionQuickPayConf.notifyVo[i],
					request.getParameter(UnionQuickPayConf.notifyVo[i]));

		}
		String signature = request.getParameter(UnionQuickPayConf.signature);
		map.put(UnionQuickPayConf.signature, signature);
		map.put(UnionQuickPayConf.signMethod,
				request.getParameter(UnionQuickPayConf.signMethod));
		request.getParameter(UnionQuickPayConf.signMethod);

		PaymentService ps = new PaymentServiceImpl();

		UPHttpTransaction ut = new UPHttpTransaction();
		try {
			logger.error("后台22::");
			ut = ps.httpPayCallbackTranslateByUnionPay(map,
					"DF8JKDOWE6FDFKEWIGOHED7DVKC");
			logger.error("前台响应代码：" + ut.getRespCode());// 响应代码
			/*
			 * 根据响应代码处理相应的业务 ut.getRespCode()：00成功；！00失败。
			 */
			this.id = ut.getOrderNumber();
			logger.error("前台33：");
			if (ut.getRespCode().equals("00")) {
				logger.error("前台44：");
				this.result = "1";

			} else {
				this.result = "2";
			}
			ServletActionContext.getContext().getValueStack().push(id);
			ServletActionContext.getContext().getValueStack().push(result);
		} catch (UPValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPTranslateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPWrongSinatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UPHttpPaymentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "zfcg";
	}

	// 修改购物车状态 id 购物车中商品id
	private void upgwc(String id) {
		logger.info("订单编号：" + orders.getO_bh() + ",选中购物车的ID值为：" + id);
		String ids = id.substring(0, id.length() - 1);
		List<ShoppingCart> shoppingCarts = this.shoppingCarService
				.findBycids(ids);
		if (shoppingCarts.size() > 0) {
			for (int i = 0; i < shoppingCarts.size(); i++) {
				ShoppingCart shoppingcart = shoppingCarts.get(i);
				shoppingcart.setSc_scbs(0);
				this.shoppingCarService.save(shoppingcart);
			}
		}
	}

	// 获取用户ip
	private String getRemortIP() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}

	private String shdz;// 收货地址

	public String getShdz() {
		return shdz;
	}

	public void setShdz(String shdz) {
		this.shdz = shdz;
	}
	private String sortid;//下单客户端分类

	public String getSortid() {
		return sortid;
	}

	public void setSortid(String sortid) {
		this.sortid = sortid;
	}

	// 生成订单编号
	private Orders scorder(String ddbh, Double je, String shdz, int zffs) {

		try {
			User user = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("usersession");
			UserAddress useraddress = new UserAddress();
			useraddress.setUa_id(Integer.parseInt(shdz));
			useraddress = this.userService.findById(useraddress);
			orders = new Orders();
			orders.setO_bh(ddbh);
			orders.setO_zjg(je);
			orders.setUseraddress(useraddress);
			orders.setUser(user);
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			orders.setO_endTime(s.format(new Date()));
			orders.setO_startTime(s.format(new Date()));
			orders.setO_status(8);
			orders.setO_scbs(1);
			orders.setO_fkfs(zffs);
			orders.setO_sort(Integer.parseInt(sortid));
			ordersService.save(orders);
			logger.error("添加订单编号成功,订单编号：" + orders.getO_bh());
			return orders;

		} catch (Exception e) {
			logger.error("添加订单编号出错，错误信息：" + e.getMessage());
		}
		return null;
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

	// 添加缴费记录 1:银联缴费记录
	private void addpaymentrecords(String ddbh, int step, int lx,
			UPHttpTransaction ut) {
		try {
			List<PaymentRecords> prs = paymentrecordsService
					.findByorderbhzfb(ddbh);
			if (prs.size() > 0) {
				PaymentRecords pr = prs.get(0);
				pr.setPr_ddbh(ddbh);
				pr.setPr_ddlx(lx);
				pr.setPr_scbc(1);
				pr.setPr_startTime(new Date());
				pr.setPr_status(step);
				pr.setCode(ut.getRespCode());
				pr.setMerId(ut.getMerId());
				pr.setMsg(ut.getRespMsg());
				pr.setOrderAmount(ut.getOrderAmount());
				pr.setQid(ut.getQid());
				pr.setRespTime(ut.getRespTime());
				pr.setSettleAmount(ut.getSettleAmount());
				pr.setSettleDate(ut.getSettleDate());
				pr.settTraceNumber(ut.getTraceNumber());
				pr.settTransType(ut.getTransType());
				pr.setTraceTime(ut.getTraceTime());
				this.paymentrecordsService.save(pr);
				logger.error("添加银联缴费记录成功：订单编号：" + pr.getPr_ddbh());
			} else {
				PaymentRecords pr = new PaymentRecords();
				pr.setPr_ddbh(ddbh);
				pr.setPr_ddlx(lx);
				pr.setPr_scbc(1);
				pr.setPr_startTime(new Date());
				pr.setPr_status(step);
				pr.setCode(ut.getRespCode());
				pr.setMerId(ut.getMerId());
				pr.setMsg(ut.getRespMsg());
				pr.setOrderAmount(ut.getOrderAmount());
				pr.setQid(ut.getQid());
				pr.setRespTime(ut.getRespTime());
				pr.setSettleAmount(ut.getSettleAmount());
				pr.setSettleDate(ut.getSettleDate());
				pr.settTraceNumber(ut.getTraceNumber());
				pr.settTransType(ut.getTransType());
				pr.setTraceTime(ut.getTraceTime());
				this.paymentrecordsService.save(pr);
				logger.error("添加银联缴费记录成功3333：订单编号：" + pr.getPr_ddbh());
			}
		} catch (Exception e) {
			logger.error("添加银联缴费记录失败：订单编号：" + pr.getPr_ddbh());
		}
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
				logger.error("支付宝44:" + pr.getPr_id());
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
				logger.error("支付宝66:" + pr.getPr_id());
			}
		} catch (Exception e) {
			logger.error("支付宝55:" + e.getMessage());
		}
	}

	/**
	 * 修改订单明细 增加订单信息
	 * result： 订单详细的id集合 
	 */
	private void upordercommodityDetail(Orders order, String result) {
		logger.error("修改订单明细"+order.getO_bh()+",result="+result);
		String ocdid = result.substring(0, result.length() - 1);
		System.out.println("ocdid="+ocdid);
		List<OrdersCommodityDetails> ocdlist = this.ocdetailsService
				.findByids(ocdid);
		System.out.println(ocdlist.size());
		String title = "";
		if (ocdlist.size() > 0) {
			for (int i = 0; i < ocdlist.size(); i++) {
				OrdersCommodityDetails ocdetail = ocdlist.get(i);
				ocdetail.setOrder(order);
				this.ocdetailsService.save(ocdetail);
				
				
				//修改商品数量
				Commodity c= ocdetail.getCommodity();
				c.setC_ck(c.getC_ck()-ocdetail.getO_num());
				this.commodityService.save(c);
			}
			title = ocdlist.get(0).getCommodity().getC_name() + "...等商品，共计"+ocdlist.size();
			order.setO_ms(title);
			order.setO_title(ocdlist.get(0).getCommodity().getC_name());
			this.ordersService.save(order);
			System.out.println("成功");
		}
	}

	public void setResult(String result) {
		this.result = result;
	}

	// 修改订单状态
	private void uporder(String bh, int status) {

		List<Orders> or = this.ordersService.findBybhzfb(bh);
		if (or.size() > 0) {
			orders = or.get(0);
			orders.setO_status(status);
			this.ordersService.save(orders);
			logger.info("订单编号：" + bh + ",状态已修改");
		} else {
			logger.info("未找到订单编号：" + bh);
		}
	}

	
    //手机网页版支付，没有发货接口只需修改订单状态即可
	public String plfh(){
		 result="发货失败";
		 if(id!=null&&bh!=null){
			 try{
				 this.ordersService.upOrderStatus(id,1);
				 String[] bhs=bh.split(",");
				 if(bhs!=null){
					 for (int i = 0; i < bhs.length; i++) {
						// 添加订单流程记录
						 addorderrecord(bhs[i], 1);
					}
				 }
				 
				 result="发货成功";
			 }catch(Exception e){
				 System.out.println(e.getMessage());
			 }
		 }
		return "success"; 
	}
	
	
	
}
