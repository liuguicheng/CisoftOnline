package com.cisoft.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="n_purchaseinfo")
public class PurchaseInfo  extends PageRequest{
 //采购详情
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pi_id;
	private String pi_no;
	private int pi_num;//数量
	private double pi_cgprice;//采购金额
	private double pi_zkprice;//折扣金额
	private double pi_ssprice;//税收金额
	private double pi_price;//总金额
	private int pi_scbs;//删除表示
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品
	
	@ManyToOne(targetEntity=GYSInfo.class)
	@JoinColumn(name="g_id")
	private GYSInfo gysInfo;//供应商信息
	
	public int getPi_id() {
		return pi_id;
	}
	public void setPi_id(int pi_id) {
		this.pi_id = pi_id;
	}
	public int getPi_num() {
		return pi_num;
	}
	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	public void setPi_cgprice(int pi_cgprice) {
		this.pi_cgprice = pi_cgprice;
	}
	public void setPi_price(int pi_price) {
		this.pi_price = pi_price;
	}
	public int getPi_scbs() {
		return pi_scbs;
	}
	public void setPi_scbs(int pi_scbs) {
		this.pi_scbs = pi_scbs;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	public GYSInfo getGysInfo() {
		return gysInfo;
	}
	public void setGysInfo(GYSInfo gysInfo) {
		this.gysInfo = gysInfo;
	}
	public String getPi_no() {
		return pi_no;
	}
	public void setPi_no(String pi_no) {
		this.pi_no = pi_no;
	}
	public double getPi_cgprice() {
		return pi_cgprice;
	}
	public void setPi_cgprice(double pi_cgprice) {
		this.pi_cgprice = pi_cgprice;
	}
	public double getPi_zkprice() {
		return pi_zkprice;
	}
	public void setPi_zkprice(double pi_zkprice) {
		this.pi_zkprice = pi_zkprice;
	}
	public double getPi_ssprice() {
		return pi_ssprice;
	}
	public void setPi_ssprice(double pi_ssprice) {
		this.pi_ssprice = pi_ssprice;
	}
	public double getPi_price() {
		return pi_price;
	}
	public void setPi_price(double pi_price) {
		this.pi_price = pi_price;
	}
	
	

	
}
