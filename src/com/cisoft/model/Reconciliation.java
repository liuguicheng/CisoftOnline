package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="n_reconciliation")
public class Reconciliation extends PageRequest{
	/**
	 * 对账信息
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int r_id;
	private double r_je;//金额
	private double r_zjel;//总金额
	private Date   r_time;//时间
	private int   r_month;//月份
	private int r_year;//年份
	private int r_day;//日
	private int r_lx;//账单类型
	@ManyToOne(targetEntity=MerchantInfo.class)
	@JoinColumn(name="minfid")
	private MerchantInfo merchantInfo;//商家
	
	private int r_scbs;//
	 
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public double getR_je() {
		return r_je;
	}
	public void setR_je(double r_je) {
		this.r_je = r_je;
	}
	public double getR_zjel() {
		return r_zjel;
	}
	public void setR_zjel(double r_zjel) {
		this.r_zjel = r_zjel;
	}
	public Date getR_time() {
		return r_time;
	}
	public void setR_time(Date r_time) {
		this.r_time = r_time;
	}
	public int getR_month() {
		return r_month;
	}
	public void setR_month(int r_month) {
		this.r_month = r_month;
	}
	public int getR_year() {
		return r_year;
	}
	public void setR_year(int r_year) {
		this.r_year = r_year;
	}
	public int getR_day() {
		return r_day;
	}
	public void setR_day(int r_day) {
		this.r_day = r_day;
	}
	public int getR_lx() {
		return r_lx;
	}
	public void setR_lx(int r_lx) {
		this.r_lx = r_lx;
	}
	public MerchantInfo getMerchantInfo() {
		return merchantInfo;
	}
	public void setMerchantInfo(MerchantInfo merchantInfo) {
		this.merchantInfo = merchantInfo;
	}
	public int getR_scbs() {
		return r_scbs;
	}
	public void setR_scbs(int r_scbs) {
		this.r_scbs = r_scbs;
	}

	
}
