package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="n_payment")
public class Payment extends PageRequest{
	/**
	 * 缴费记录实体
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String paymentBh;//缴费流水号
	public String getPaymentBh() {
		return paymentBh;
	}
	public void setPaymentBh(String paymentBh) {
		this.paymentBh = paymentBh;
	}
	private String paymentName;//缴费名称
	private int paymentType;//缴费类型  1水、2电、3煤 4其他
	private double paymentPrice;//缴费金额
	private String paymentZhanghao;//缴费账号
	private String paymentXingMin;//缴费人姓名
	private Date paymentDate;//缴费时间
	private int paymentZt;//缴费状态 1成功、2失败、3正在验证 4未成功 5未收货 6交易成功
	private int paymentFs;//缴费方式（渠道）1支付宝  2银联
	private String paymentjyh;//交易号
	public String getPaymentjyh() {
		return paymentjyh;
	}
	public void setPaymentjyh(String paymentjyh) {
		this.paymentjyh = paymentjyh;
	}
	private String bz;//备注
	private int c_scbs;//删除标识
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPaymentName() {
		return paymentName;
	}
	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}
	public int getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}
	public double getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(double paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentZhanghao() {
		return paymentZhanghao;
	}
	public void setPaymentZhanghao(String paymentZhanghao) {
		this.paymentZhanghao = paymentZhanghao;
	}
	public String getPaymentXingMin() {
		return paymentXingMin;
	}
	public void setPaymentXingMin(String paymentXingMin) {
		this.paymentXingMin = paymentXingMin;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getPaymentZt() {
		return paymentZt;
	}
	public void setPaymentZt(int paymentZt) {
		this.paymentZt = paymentZt;
	}
	public int getPaymentFs() {
		return paymentFs;
	}
	public void setPaymentFs(int paymentFs) {
		this.paymentFs = paymentFs;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public int getC_scbs() {
		return c_scbs;
	}
	public void setC_scbs(int c_scbs) {
		this.c_scbs = c_scbs;
	}
	
	

}
