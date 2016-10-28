package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_membershipGrade")
public class MembershipGrade extends PageRequest{

	/**
	 * 会员等级
	 */
	
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int mg_id;
	private String mg_name;
	private String mg_zk;//折扣
	private String mg_jf;//所需积分
	private int mg_sfmr;//是否默认
	private int mg_scbs;//删除标识
	public int getMg_id() {
		return mg_id;
	}
	public void setMg_id(int mg_id) {
		this.mg_id = mg_id;
	}
	public String getMg_name() {
		return mg_name;
	}
	public void setMg_name(String mg_name) {
		this.mg_name = mg_name;
	}
	public String getMg_zk() {
		return mg_zk;
	}
	public void setMg_zk(String mg_zk) {
		this.mg_zk = mg_zk;
	}
	public String getMg_jf() {
		return mg_jf;
	}
	public void setMg_jf(String mg_jf) {
		this.mg_jf = mg_jf;
	}
	public int getMg_sfmr() {
		return mg_sfmr;
	}
	public void setMg_sfmr(int mg_sfmr) {
		this.mg_sfmr = mg_sfmr;
	}
	public int getMg_scbs() {
		return mg_scbs;
	}
	public void setMg_scbs(int mg_scbs) {
		this.mg_scbs = mg_scbs;
	}
	
	
	
}
