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
@Table(name="n_outstock")
public class OutStock extends PageRequest{

	/**
	 * 出库记录
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int os_id;
	private String os_ckno;//单号
	private int os_cksl;//出库数量
	private Date os_ckdate;//出库日期
	private int os_zt;//状态 1、出库、2出库审核
	private int os_scbs;//删除标识
	private String os_bz;//备注
	private int os_cklx;//出库类型
	
	private double os_price;//出库金额
	
	@ManyToOne(targetEntity=Storeroom.class)
	@JoinColumn(name="s_id")
	private Storeroom storeroom;//库房
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//出库人
	public int getOs_id() {
		return os_id;
	}
	public void setOs_id(int os_id) {
		this.os_id = os_id;
	}
	public String getOs_ckno() {
		return os_ckno;
	}
	public void setOs_ckno(String os_ckno) {
		this.os_ckno = os_ckno;
	}
	public int getOs_cksl() {
		return os_cksl;
	}
	public void setOs_cksl(int os_cksl) {
		this.os_cksl = os_cksl;
	}
	public Date getOs_ckdate() {
		return os_ckdate;
	}
	public void setOs_ckdate(Date os_ckdate) {
		this.os_ckdate = os_ckdate;
	}
	public int getOs_zt() {
		return os_zt;
	}
	public void setOs_zt(int os_zt) {
		this.os_zt = os_zt;
	}
	public int getOs_scbs() {
		return os_scbs;
	}
	public void setOs_scbs(int os_scbs) {
		this.os_scbs = os_scbs;
	}
	public String getOs_bz() {
		return os_bz;
	}
	public void setOs_bz(String os_bz) {
		this.os_bz = os_bz;
	}
	public int getOs_cklx() {
		return os_cklx;
	}
	public void setOs_cklx(int os_cklx) {
		this.os_cklx = os_cklx;
	}
	public double getOs_price() {
		return os_price;
	}
	public void setOs_price(double os_price) {
		this.os_price = os_price;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	
}
