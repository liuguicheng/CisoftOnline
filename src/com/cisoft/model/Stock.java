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
@Table(name="n_stock")
public class Stock extends PageRequest{

	/**
	 * 商品入库
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int st_id;
	private String s_no;//单号
	private int s_smsl;//入库数量
	private Date s_date;//入库日期
	private int s_zt;//状态 1、入库 2、入库审核
	private int s_scbs;//删除标识
	private String s_bz;//备注
	
	@ManyToOne(targetEntity=Storeroom.class)
	@JoinColumn(name="s_id")
	private Storeroom storeroom;//库房
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//入库用户
	private int s_rklx;//入库类型
	
	
	

	
	
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public int getS_smsl() {
		return s_smsl;
	}
	public void setS_smsl(int s_smsl) {
		this.s_smsl = s_smsl;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public int getS_zt() {
		return s_zt;
	}
	public void setS_zt(int s_zt) {
		this.s_zt = s_zt;
	}
	public int getS_scbs() {
		return s_scbs;
	}
	public void setS_scbs(int s_scbs) {
		this.s_scbs = s_scbs;
	}
	
	public Storeroom getStoreroom() {
		return storeroom;
	}
	public void setStoreroom(Storeroom storeroom) {
		this.storeroom = storeroom;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	public int getSt_id() {
		return st_id;
	}
	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}
	public String getS_bz() {
		return s_bz;
	}
	public void setS_bz(String s_bz) {
		this.s_bz = s_bz;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getS_rklx() {
		return s_rklx;
	}
	public void setS_rklx(int s_rklx) {
		this.s_rklx = s_rklx;
	}
	
	
	
	
}
