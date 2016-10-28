<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cisoft.model.Payment"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>正在加载</title>
	</head>
	<%
		////////////////////////////////////请求参数//////////////////////////////////////
         Payment payment=(Payment)request.getAttribute("payment");
	
		//支付类型
		String payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		//String notify_url = "http://www.100nn.cn/payment_zfbybtz";
		String notify_url = "http://127.0.0.1:8080/100nn/payment_zfbybtz";
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		//页面跳转同步通知页面路径
		//String return_url = "http://www.100nn.cn/payment_zfbtb";
		String return_url = "http://127.0.0.1:8080/100nn/payment_zfbtb";
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		//卖家支付宝帐户
		//String seller_email = new String(request.getParameter("WIDseller_email").getBytes("ISO-8859-1"),"UTF-8");
		String seller_email ="13807887660";
		//必填
		//商户订单号
// 		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		String out_trade_no =payment.getPaymentBh();
		//商户网站订单系统中唯一订单号，必填
		//订单名称
		/* String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8"); */
		String subject =payment.getPaymentName();
		//必填
		//付款金额
		//String price = new String(request.getParameter("WIDprice").getBytes("ISO-8859-1"),"UTF-8");
		String price =String.valueOf(payment.getPaymentPrice());
		//必填
		//商品数量
		String quantity = "1";
		//必填，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品
		//物流费用
		//String logistics_fee = "0.00";
		String logistics_fee =String.valueOf("0.00");;
		//必填，即运费
		//物流类型
		String logistics_type = "EXPRESS";
		//必填，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
		//物流支付方式
		String logistics_payment = "BUYER_PAY";
		//必填，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
		//订单描述		//String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		String body =payment.getBz();
		//商品展示地址
		//String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"),"UTF-8");
		String show_url = "";
		//String show_url = "http://127.0.0.1:8080/wxorders_qtorderinfo?result="+order.getO_bh();
		//需以http://开头的完整路径，如：http://www.xxx.com/myorder.html
		//收货人姓名
	//String receive_name = new String(request.getParameter("WIDreceive_name").getBytes("ISO-8859-1"),"UTF-8");
		String receive_name ="成贵刘";
		//如：张三
		//收货人地址
		//String receive_address = new String(request.getParameter("WIDreceive_address").getBytes("ISO-8859-1"),"UTF-8");
		String receive_address = "广西省南宁市青秀区厢竹西大道天立tt国际A座1802";
		//如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
		//收货人邮编
		//String receive_zip = new String(request.getParameter("WIDreceive_zip").getBytes("ISO-8859-1"),"UTF-8");
		String receive_zip="530000";
		//如：123456
		//收货人电话号码
		//String receive_phone = new String(request.getParameter("WIDreceive_phone").getBytes("ISO-8859-1"),"UTF-8");
		String receive_phone ="0771-3830582";
		//如：0571-88158090
		//收货人手机号码
		//String receive_mobile = new String(request.getParameter("WIDreceive_mobile").getBytes("ISO-8859-1"),"UTF-8");
		String receive_mobile="15177198241";
		//如：13312341234
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_partner_trade_by_buyer");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", payment_type);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("seller_email", seller_email);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("price", price);
		sParaTemp.put("quantity", quantity);
		sParaTemp.put("logistics_fee", logistics_fee);
		sParaTemp.put("logistics_type", logistics_type);
		sParaTemp.put("logistics_payment", logistics_payment);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		 sParaTemp.put("receive_name", receive_name);
		sParaTemp.put("receive_address", receive_address);
		sParaTemp.put("receive_zip", receive_zip);
		sParaTemp.put("receive_phone", receive_phone);
		sParaTemp.put("receive_mobile", receive_mobile);  
		System.out.print(sParaTemp);
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
	     System.out.print(sHtmlText);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
