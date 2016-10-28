package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_paymentManagement")
public class PaymentManagement extends PageRequest{

	/**
	 * 支付管理
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pm_id;
	private String pm_name;
	private String pm_bz;//备注
	private int pm_px;//排序
	private String pm_zc;//支持
	private int pm_lx;//支付类型
	private String pm_fl;//手续费
	private int pm_scbs;
	private String pm_jklx;//接口类型
	private String pm_jkid;//接口id
	private String pm_jkmy;//接口密钥
	public int getPm_id() {
		return pm_id;
	}
	public void setPm_id(int pm_id) {
		this.pm_id = pm_id;
	}
	public String getPm_name() {
		return pm_name;
	}
	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public String getPm_bz() {
		return pm_bz;
	}
	public void setPm_bz(String pm_bz) {
		this.pm_bz = pm_bz;
	}
	public int getPm_px() {
		return pm_px;
	}
	public void setPm_px(int pm_px) {
		this.pm_px = pm_px;
	}
	public String getPm_zc() {
		return pm_zc;
	}
	public void setPm_zc(String pm_zc) {
		this.pm_zc = pm_zc;
	}
	public int getPm_lx() {
		return pm_lx;
	}
	public void setPm_lx(int pm_lx) {
		this.pm_lx = pm_lx;
	}
	public String getPm_fl() {
		return pm_fl;
	}
	public void setPm_fl(String pm_fl) {
		this.pm_fl = pm_fl;
	}
	public int getPm_scbs() {
		return pm_scbs;
	}
	public void setPm_scbs(int pm_scbs) {
		this.pm_scbs = pm_scbs;
	}
	public String getPm_jklx() {
		return pm_jklx;
	}
	public void setPm_jklx(String pm_jklx) {
		this.pm_jklx = pm_jklx;
	}
	public String getPm_jkid() {
		return pm_jkid;
	}
	public void setPm_jkid(String pm_jkid) {
		this.pm_jkid = pm_jkid;
	}
	public String getPm_jkmy() {
		return pm_jkmy;
	}
	public void setPm_jkmy(String pm_jkmy) {
		this.pm_jkmy = pm_jkmy;
	}
	
	
}
