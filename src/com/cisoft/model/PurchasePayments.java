package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="n_purchasepayments")
public class PurchasePayments extends PageRequest{
/**
 * 采购付款
 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pp_id;
	private String pp_no;//采购单号
	private double pp_dfje;//待付款金额
	private double pp_sjfkje;//实际付款金额
	private double pp_fjje;//附加金额
	private Date pp_fkdate;//付款日期
	private int pp_zflx;//支付类型 1，银行转账  2 现金支付
	private String pp_bz;//备注
	private int pp_scbs;
	public int getPp_scbs() {
		return pp_scbs;
	}
	public void setPp_scbs(int pp_scbs) {
		this.pp_scbs = pp_scbs;
	}
	public int getPp_id() {
		return pp_id;
	}
	public void setPp_id(int pp_id) {
		this.pp_id = pp_id;
	}
	public String getPp_no() {
		return pp_no;
	}
	public void setPp_no(String pp_no) {
		this.pp_no = pp_no;
	}
	public double getPp_dfje() {
		return pp_dfje;
	}
	public void setPp_dfje(double pp_dfje) {
		this.pp_dfje = pp_dfje;
	}
	public double getPp_sjfkje() {
		return pp_sjfkje;
	}
	public void setPp_sjfkje(double pp_sjfkje) {
		this.pp_sjfkje = pp_sjfkje;
	}
	public double getPp_fjje() {
		return pp_fjje;
	}
	public void setPp_fjje(double pp_fjje) {
		this.pp_fjje = pp_fjje;
	}
	public Date getPp_fkdate() {
		return pp_fkdate;
	}
	public void setPp_fkdate(Date pp_fkdate) {
		this.pp_fkdate = pp_fkdate;
	}
	public int getPp_zflx() {
		return pp_zflx;
	}
	public void setPp_zflx(int pp_zflx) {
		this.pp_zflx = pp_zflx;
	}
	public String getPp_bz() {
		return pp_bz;
	}
	public void setPp_bz(String pp_bz) {
		this.pp_bz = pp_bz;
	}
	
	 
}
