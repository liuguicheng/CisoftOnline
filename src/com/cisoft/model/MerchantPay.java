package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="n_merchantPay")
public class MerchantPay extends PageRequest{

	/**
	 * 商家支付管理
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int mp_id;
	private String mp_name;
	private String mp_bz;//备注
	private int mp_px;//排序
	private String mp_zc;//支持
	private int mp_lx;//支付类型
	private String mp_fl;//手续费
	private int mp_scbs;
	private String mp_jklx;//接口类型
	private String mp_jkid;//接口id
	private String mp_jkmy;//接口密钥
	@ManyToOne(targetEntity=PaymentManagement.class)
	@JoinColumn(name="paymid")
	PaymentManagement paymentM;
	public int getMp_id() {
		return mp_id;
	}
	public void setMp_id(int mp_id) {
		this.mp_id = mp_id;
	}
	public String getMp_name() {
		return mp_name;
	}
	public void setMp_name(String mp_name) {
		this.mp_name = mp_name;
	}
	public String getMp_bz() {
		return mp_bz;
	}
	public void setMp_bz(String mp_bz) {
		this.mp_bz = mp_bz;
	}
	public int getMp_px() {
		return mp_px;
	}
	public void setMp_px(int mp_px) {
		this.mp_px = mp_px;
	}
	public String getMp_zc() {
		return mp_zc;
	}
	public void setMp_zc(String mp_zc) {
		this.mp_zc = mp_zc;
	}
	public int getMp_lx() {
		return mp_lx;
	}
	public void setMp_lx(int mp_lx) {
		this.mp_lx = mp_lx;
	}
	public String getMp_fl() {
		return mp_fl;
	}
	public void setMp_fl(String mp_fl) {
		this.mp_fl = mp_fl;
	}
	public int getMp_scbs() {
		return mp_scbs;
	}
	public void setMp_scbs(int mp_scbs) {
		this.mp_scbs = mp_scbs;
	}
	public String getMp_jklx() {
		return mp_jklx;
	}
	public void setMp_jklx(String mp_jklx) {
		this.mp_jklx = mp_jklx;
	}
	public String getMp_jkid() {
		return mp_jkid;
	}
	public void setMp_jkid(String mp_jkid) {
		this.mp_jkid = mp_jkid;
	}
	public String getMp_jkmy() {
		return mp_jkmy;
	}
	public void setMp_jkmy(String mp_jkmy) {
		this.mp_jkmy = mp_jkmy;
	}
	public PaymentManagement getPaymentM() {
		return paymentM;
	}
	public void setPaymentM(PaymentManagement paymentM) {
		this.paymentM = paymentM;
	}
	
	
	
}
