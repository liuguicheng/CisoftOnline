package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 支付记录
 * @author pro
 *
 */
@Entity
@Table(name="n_paymentrecords")
public class PaymentRecords extends PageRequest{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pr_id;
	private int o_id;
	private String pr_ddbh;//订单编号
	private int pr_ddlx;//缴费类型1 银联  2支付宝 
	private int pr_status;//缴费状态 0 未缴费  1缴费成功  2缴费失败 3缴费异常 4无此交易 
	private Date pr_startTime;//缴费发起时间
	private Date pr_endTime;//银联返回时间
	private int pr_scbc;
	private String pr_czr;//操作人
	private String merId;// 商户代码 merchantId
	private String orderAmount;// 交易金额 merchantOrderAmt
	private String qid;// 交易流水号
	private String code;// 响应代码
	private String msg;// 响应信息
	private Date respTime;// 交易完成时间
	private String settleAmount;// 清算金额
	private String settleDate;// 清算日期
	private String tTraceNumber;// 系统跟踪号
	private String tTransType;// 交易类型
	
	private String traceTime;//系统跟踪时间（MMddHHmmss）
	
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getPr_ddbh() {
		return pr_ddbh;
	}
	public void setPr_ddbh(String pr_ddbh) {
		this.pr_ddbh = pr_ddbh;
	}
	public int getPr_ddlx() {
		return pr_ddlx;
	}
	public void setPr_ddlx(int pr_ddlx) {
		this.pr_ddlx = pr_ddlx;
	}
	public int getPr_status() {
		return pr_status;
	}
	public void setPr_status(int pr_status) {
		this.pr_status = pr_status;
	}
	public Date getPr_startTime() {
		return pr_startTime;
	}
	public void setPr_startTime(Date pr_startTime) {
		this.pr_startTime = pr_startTime;
	}
	public Date getPr_endTime() {
		return pr_endTime;
	}
	public void setPr_endTime(Date pr_endTime) {
		this.pr_endTime = pr_endTime;
	}
	public int getPr_scbc() {
		return pr_scbc;
	}
	public void setPr_scbc(int pr_scbc) {
		this.pr_scbc = pr_scbc;
	}
	public String getPr_czr() {
		return pr_czr;
	}
	public void setPr_czr(String pr_czr) {
		this.pr_czr = pr_czr;
	}
	public String getMerId() {
		return merId;
	}
	public void setMerId(String merId) {
		this.merId = merId;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSettleAmount() {
		return settleAmount;
	}
	public void setSettleAmount(String settleAmount) {
		this.settleAmount = settleAmount;
	}
	public String gettTraceNumber() {
		return tTraceNumber;
	}
	public void settTraceNumber(String tTraceNumber) {
		this.tTraceNumber = tTraceNumber;
	}
	public String gettTransType() {
		return tTransType;
	}
	public void settTransType(String tTransType) {
		this.tTransType = tTransType;
	}
	public Date getRespTime() {
		return respTime;
	}
	public void setRespTime(Date respTime) {
		this.respTime = respTime;
	}
	public String getSettleDate() {
		return settleDate;
	}
	public void setSettleDate(String settleDate) {
		this.settleDate = settleDate;
	}
	public String getTraceTime() {
		return traceTime;
	}
	public void setTraceTime(String traceTime) {
		this.traceTime = traceTime;
	}
	
	
	 

}
