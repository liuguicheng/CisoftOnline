package com.cisoft.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.cisoft.model.Orders;
import com.cisoft.model.Payment;
import com.cisoft.model.PaymentRecords;
import com.cisoft.service.PaymentService;
import com.cisoft.service.PaymentrecordsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class PaymentAction extends Pages<Payment> implements
		ModelDriven<Payment> {
	final static Logger logger = LoggerFactory
			.getLogger(PaymentAction.class);
	private Payment payment = new Payment();
	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	private String g_id;

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public Payment getModel() {
		// TODO Auto-generated method stub
		return payment;
	}

	@Resource
	PaymentService paymentService;
	@Resource
	PaymentrecordsService paymentrecordsService;
	
	private String result = "";

	public String getResult() {
		return result;
	}

	public String getList() {
		pageResponse.setRows(paymentService.getList(payment));
		pageResponse.setTotal(paymentService.getCount(payment));
		return "list";
	}

	
    //生成缴费记录
	public String addPayment(){
		
		if(payment.getPaymentBh()!=null){
			payment.setPaymentDate(new Date());
			this.paymentService.save(payment);
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx
					.get(ServletActionContext.HTTP_REQUEST);
			request.setAttribute("payment", payment);
			return "addsuccess";
		}
		return "error";
	}
	
	// 支付宝服务器异步通知页面文件 (缴费版)
		public String zfbybtz() throws ServletException, IOException {
			logger.error("缴费版进入后台：11");
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
			logger.error("缴费版支付宝返回参数:" + params);
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
				logger.error("缴费版支付宝返回参数1:" + out_trade_no);
				logger.error("缴费版支付宝返回参数2:" + trade_no);
				logger.error("缴费版支付宝返回参数3:" + trade_status);
				if (trade_status.equals("WAIT_BUYER_PAY")) {
					logger.error("缴费版支付宝:表示买家已在支付宝交易管理中产生了交易记录，但没有付款");
					// 该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
					Payment payment = this.paymentService
							.findBybh(out_trade_no);
					if (payment!=null) {
						if(payment.getPaymentjyh()==null){
							//更新交易流水号
							payment.setPaymentjyh(trade_no);
							this.paymentService.save(payment);
						}
						logger.error("支付宝(买家发生交易但未付款):" + payment.getPaymentBh());
						
					}

					out.println("success"); // 请不要修改或删除
				} else if (trade_status.equals("WAIT_SELLER_SEND_GOODS")) {
					// 该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
					logger.error("缴费版支付宝返回：表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货");
					Payment payment = this.paymentService
							.findBybh(out_trade_no);
					if (payment!=null) {
						if(payment.getPaymentjyh()==null){
							//更新交易流水号
							payment.setPaymentjyh(trade_no);
							this.paymentService.save(payment);
						}
						logger.error("支付宝(买家已付款，卖家未发货):" + payment.getPaymentBh());
						if (payment.getPaymentZt() ==3) {
							logger.error("修改缴费记录状态:修改为已支付");
							adddalpaymentrecords(out_trade_no, 1, 2, trade_status,
									trade_no);
							payment.setPaymentZt(1);
							this.paymentService.save(payment);
						}
					}
					out.println("success"); // 请不要修改或删除
				} else if (trade_status.equals("WAIT_BUYER_CONFIRM_GOODS")) {
					logger.error("缴费版支付宝返回:表示卖家已经发了货，但买家还没有做确认收货的操作");
					// 该判断表示卖家已经发了货，但买家还没有做确认收货的操作
					Payment payment = this.paymentService
							.findBybh(out_trade_no);
					if (payment!=null) {
						if(payment.getPaymentjyh()==null){
							//更新交易流水号
							payment.setPaymentjyh(trade_no);
							this.paymentService.save(payment);
						}
						logger.error("支付宝(卖家发货，买家未收货):" + payment.getPaymentBh());
						if (payment.getPaymentZt() ==1) {
							payment.setPaymentZt(5);
							this.paymentService.save(payment);
						}
					}

					out.println("success"); // 请不要修改或删除
				} else if (trade_status.equals("TRADE_FINISHED")) {
					logger.error("支付宝11--:表示买家已经确认收货，这笔交易完成");
					// 该判断表示买家已经确认收货，这笔交易完成
					Payment payment = this.paymentService
							.findBybh(out_trade_no);
					if (payment!=null) {
						if(payment.getPaymentjyh()==null){
							//更新交易流水号
							payment.setPaymentjyh(trade_no);
							this.paymentService.save(payment);
						}
						logger.error("支付宝(买家收货):" + payment.getPaymentBh());
						if (payment.getPaymentZt() ==5) {
							payment.setPaymentZt(6);
							this.paymentService.save(payment);
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

		// 页面跳转同步通知文件 (缴费版)
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
						// 该页面可做页面美工编辑
					Payment payment = this.paymentService
							.findBybh(out_trade_no);
					if (payment!=null) {
						if(payment.getPaymentjyh()==null){
							//更新交易流水号
							payment.setPaymentjyh(trade_no);
							this.paymentService.save(payment);
						}
						logger.error("支付宝(买家已付款，卖家未发货):" + payment.getPaymentBh());
						if (payment.getPaymentZt() ==3) {
							logger.error("修改缴费记录状态:修改为已支付");
							adddalpaymentrecords(out_trade_no, 1, 2, trade_status,
									trade_no);
							payment.setPaymentZt(1);
							this.paymentService.save(payment);
						}
					}
						out.println("交易成功");
					}

				// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

				// ////////////////////////////////////////////////////////////////////////////////////////
			} else {
				adddalpaymentrecords(out_trade_no, 2, 2, trade_status,
						trade_no);
				
				// 该页面可做页面美工编辑
				out.println("交易失败");
				
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
					PaymentRecords pr = prs.get(0);
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
					PaymentRecords pr = new PaymentRecords();
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
	
	
	public String tofhpage(){
		this.result="2";
		logger.error("进入支付宝确认发货页面：");
		try {

			//订单编号
			String no=payment.getPaymentBh();
			Payment paymentinfo = this.paymentService
					.findBybh(no);
			if(paymentinfo!=null){
				if(paymentinfo.getPaymentZt()==1){
			
			// 支付宝交易号
			String trade_no = paymentinfo.getPaymentjyh();
			// 必填
			// 物流公司名称
			String logistics_name = "申通快递";
			UUID uuid = UUID.randomUUID(); 
			// 必填
			// 物流发货单号
			String invoice_no = uuid.toString();
			// 物流运输类型
			String transport_type = "EXPRESS";
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
			logger.error("确认发货返回参数:" + sHtmlText);
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
						paymentinfo.setPaymentZt(6);
						this.paymentService.save(paymentinfo);
					logger.error("确认发货5:发货成功");
					this.result="1";
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
		
		return "success";
	}

	private List<PaymentRecords> precords;
	
	
	
	public List<PaymentRecords> getPrecords() {
		return precords;
	}

	public void setPrecords(List<PaymentRecords> precords) {
		this.precords = precords;
	}

	/**
	 * 查询缴费详细
	 * 操作记录详细
	 * @return
	 */
	public String paymentDetail(){
		
		if(payment.getId()!=0){
			payment =this.paymentService.findById(payment);
			if(payment!=null){
				precords=this.paymentrecordsService.findByorderbhzfb(payment.getPaymentBh());
			}
		}
		return "paymentDetailsuccess";
	}

	
}
