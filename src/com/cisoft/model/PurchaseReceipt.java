package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="n_purchasereceipt")
public class PurchaseReceipt extends PageRequest{
/**
 *  采购收货
 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pr_id;
	private String pr_no;//采购订单（收货）
	private String pr_username;//收货人
	private Date pr_shdate;//收货时间
	private int pr_scbs;
	private String pr_bz;//备注
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_username() {
		return pr_username;
	}
	public void setPr_username(String pr_username) {
		this.pr_username = pr_username;
	}
	public Date getPr_shdate() {
		return pr_shdate;
	}
	public void setPr_shdate(Date pr_shdate) {
		this.pr_shdate = pr_shdate;
	}
	public int getPr_scbs() {
		return pr_scbs;
	}
	public void setPr_scbs(int pr_scbs) {
		this.pr_scbs = pr_scbs;
	}
	public String getPr_bz() {
		return pr_bz;
	}
	public void setPr_bz(String pr_bz) {
		this.pr_bz = pr_bz;
	}
	
	
}
