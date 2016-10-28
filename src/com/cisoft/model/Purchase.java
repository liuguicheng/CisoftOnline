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
@Table(name="n_purchase")
public class Purchase  extends PageRequest{
 //采购
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int p_id;
	private String p_no;
	private Date p_zdDate;//制单日期
	private String p_username;//制单人
	private String p_ywusername;//业务代表
	private int p_zt;//状态  1未付款  2.未收货  3未入库  4已退货
	private Date p_cgDate;//采购日期
	private Date p_jhDate;//交货日期
	private String p_jhAddres;//交货地址
	private String p_ms;//描述
	private double p_price;//总金额
	private int p_scbs;
	@ManyToOne(targetEntity=Storeroom.class)
	@JoinColumn(name="s_id")
	private Storeroom storeroom;

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public Date getP_zdDate() {
		return p_zdDate;
	}

	public void setP_zdDate(Date p_zdDate) {
		this.p_zdDate = p_zdDate;
	}

	public String getP_username() {
		return p_username;
	}

	public void setP_username(String p_username) {
		this.p_username = p_username;
	}

	public String getP_ywusername() {
		return p_ywusername;
	}

	public void setP_ywusername(String p_ywusername) {
		this.p_ywusername = p_ywusername;
	}

	public int getP_zt() {
		return p_zt;
	}

	public void setP_zt(int p_zt) {
		this.p_zt = p_zt;
	}

	public Date getP_cgDate() {
		return p_cgDate;
	}

	public void setP_cgDate(Date p_cgDate) {
		this.p_cgDate = p_cgDate;
	}

	public Date getP_jhDate() {
		return p_jhDate;
	}

	public void setP_jhDate(Date p_jhDate) {
		this.p_jhDate = p_jhDate;
	}

	public String getP_jhAddres() {
		return p_jhAddres;
	}

	public void setP_jhAddres(String p_jhAddres) {
		this.p_jhAddres = p_jhAddres;
	}

	public String getP_ms() {
		return p_ms;
	}

	public void setP_ms(String p_ms) {
		this.p_ms = p_ms;
	}

	public Storeroom getStoreroom() {
		return storeroom;
	}

	public void setStoreroom(Storeroom storeroom) {
		this.storeroom = storeroom;
	}

	public int getP_scbs() {
		return p_scbs;
	}

	public void setP_scbs(int p_scbs) {
		this.p_scbs = p_scbs;
	}

	public double getP_price() {
		return p_price;
	}

	public void setP_price(double p_price) {
		this.p_price = p_price;
	}
	
	
	
}
