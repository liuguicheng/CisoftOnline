package com.cisoft.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cisoft.model.Orders;
import com.cisoft.model.PaymentRecords;
import com.cisoft.service.OrdersService;
import com.cisoft.service.PaymentrecordsService;
import com.cisoft.ups.paymentPlatform.service.PaymentService;
import com.cisoft.ups.paymentPlatform.service.exception.UPQueryFailException;
import com.cisoft.ups.paymentPlatform.service.exception.UPTransactionInProcessException;
import com.cisoft.ups.paymentPlatform.service.exception.UPValidationException;
import com.cisoft.ups.paymentPlatform.service.impl.PaymentServiceImpl;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpPaymentQuery;
import com.cisoft.ups.paymentPlatform.service.model.UPHttpQueryReturnDetail;
import com.cisoft.ups.paymentPlatform.service.model.UPTransTypeEnum;



public class PayQueryTimerTask extends TimerTask{
	final static Logger logger = LoggerFactory
			.getLogger(PayQueryTimerTask.class);
	private PaymentrecordsService paymentrecordsService;
	private OrdersService ordersService;
	private String code;
	private String ordernumber;
	private Date ordertime;
	private String key;
	private String queryUurl;
	
	public PayQueryTimerTask(OrdersService ordersService,PaymentrecordsService paymentrecordsService,
			String queryUurl,String code,String ordernumber,Date ordertime,String key){
		this.ordersService=ordersService;
		this.paymentrecordsService = paymentrecordsService;
		this.code = code;
		this.ordernumber = ordernumber;
		this.ordertime = ordertime;
		this.key = key;
		this.queryUurl=queryUurl;
	}
	@Override
	public void run() {
		UPHttpQueryReturnDetail uqrd = PayQueryService(queryUurl, code,ordernumber,ordertime,key);
		logger.error("定时查询11::"+uqrd.getQid());// 交易流水号
		logger.error("定时查询11::"+uqrd.getQueryResult());// 查询结果
		logger.error("定时查询11::"+uqrd.getRespCode());// 响应码
		logger.error("定时查询11::"+uqrd.getRespTime());// 响应时间
		logger.error("定时查询11::"+uqrd.getSettleAmount());// 清算金额
		logger.error("定时查询11::"+uqrd.getSettleDate());// 清算日期
		logger.error("定时查询11::"+uqrd.getTraceNumber());// 系统跟踪号
		logger.error("定时查询11::"+uqrd.getTraceTime());// 系统跟踪时间
		logger.error("后台44::" + uqrd.getTraceTime());//系统跟踪时间（yyyyMMddHHmmss）
		/*
		 * 根据下面的查询结果的值来做相应业务
		 */
		String rs=uqrd.getQueryResult();// 查询结果0-交易成功;1-交易失败;2-交易处理中;3-无此交易;空-报文格式错误
		//查询是否交易完
		int status=selectjf(ordernumber);
		logger.error("定时查询22::"+rs);
		logger.error("定时查询33::"+status);
		//交易完成则不再查询
		if(status!=1){
			if(rs.equals("0")){
				addpaymentrecords(ordernumber,1,1,uqrd);
				uporder(ordernumber);
			}else if(rs.equals("1")){
				addpaymentrecords(ordernumber,2,1,uqrd);
			}else if(rs.equals("2")){
				try {
					Thread.sleep(5000);
				} catch (InterruptedException e) {
					
					e.printStackTrace();
				}
			}else if(rs.equals("3")){
				addpaymentrecords(ordernumber,4,1,uqrd);
			}else{
				addpaymentrecords(ordernumber,3,1,uqrd);
			}
		}
	}

	// 发起查询
		public UPHttpQueryReturnDetail PayQueryService(String queryUurl,String code,String ordernumber,Date ordertime,String key)  {
			PaymentService ps = new PaymentServiceImpl();
			String querUurl = queryUurl;//查询连接
			UPHttpPaymentQuery up = new UPHttpPaymentQuery();
			up.setBusinessCode(code);//商户号
			up.setOrderNumber(ordernumber);//订单号
			SimpleDateFormat dr=new SimpleDateFormat("yyyyMMddHHmmss");
			String newtime=dr.format(new Date());
			Date date=null;
			try {
				date = dr.parse(newtime);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			up.setOrderTime(date);//时间
			up.setSecurityKey(key);//密钥
			up.setTransType(UPTransTypeEnum.cosume);
			UPHttpQueryReturnDetail uqrd = new UPHttpQueryReturnDetail();
			try {
				uqrd = ps.httpQueryTransByUinonPay(up, querUurl);
				logger.error("定时查询44::"+uqrd);
			} catch (UPValidationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UPQueryFailException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UPTransactionInProcessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return uqrd;
		}
		//更新缴费信息
		private void addpaymentrecords(String ddbh, int step, int lx,UPHttpQueryReturnDetail ut) {
			try {
				List<PaymentRecords> prs=paymentrecordsService.findByorderbhzfb(ddbh);
				if (prs.size()>0) {
				PaymentRecords	pr=prs.get(0);
				pr.setPr_ddbh(ddbh);
				pr.setPr_ddlx(lx);
				pr.setPr_scbc(1);
				pr.setPr_startTime(new Date());
				pr.setPr_status(step);
				pr.setCode(ut.getRespCode());
				pr.setMsg(ut.getQueryResult());
				pr.setQid(ut.getQid());
				pr.setSettleAmount(ut.getSettleAmount());
				pr.setSettleDate(ut.getSettleDate());
				pr.settTraceNumber(ut.getTraceNumber());
				DateFormat d=new SimpleDateFormat("yyyyMMddHHmmss");
				pr.setTraceTime(d.format(ut.getTraceTime()));
				this.paymentrecordsService.save(pr);
				logger.error("定时查询55::"+pr.getPr_ddbh());
				}
			} catch (Exception e) {
				logger.error("定时查询66::"+e.getMessage());
			}
		}
		//查询缴费信息
		private int selectjf(String ordreno){
			List<PaymentRecords> prs=paymentrecordsService.findByorderbhzfb(ordreno);
			if(prs.size()>0){
				return  prs.get(0).getPr_status();
			}
			return -2;
		}
		//更新订单状态
		private void uporder(String bh){
			try {
			List<Orders> or=ordersService.findBybhzfb(bh);
			if(or.size()>0){
			Orders order=or.get(0);
			order.setO_status(0);
			ordersService.save(order);
			logger.error("定时查询77::"+order.getO_bh());
			}else{
				logger.error("定时查询88::银联定时查询修改状态错误,获取不到订单信息");
			}
			} catch (Exception e) {
				logger.error("定时查询88::银联定时查询修改状态错误，错误信息："+e.getMessage());
			}
		}
		
}
