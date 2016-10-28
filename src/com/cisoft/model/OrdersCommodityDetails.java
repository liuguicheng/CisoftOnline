package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 订单商品明细
 * @author pro
 *
 */
@Entity
@Table(name="n_orderscommoditydetails")
public class OrdersCommodityDetails extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int o_id;
	private double o_yf;//邮费
	private int o_num;//商品数量
	private double o_zjg;//订单价格
	private int o_fb;//是否开发票
	private String o_bz;//备注
	private int o_scbs;
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="cc_id")
	Commodity commodity;//商品信息
	@ManyToOne(targetEntity=Orders.class)
	@JoinColumn(name="or_id")
	private Orders order;//订单
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//用户
	
	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public double getO_zjg() {
		return o_zjg;
	}

	public void setO_zjg(double o_zjg) {
		this.o_zjg = o_zjg;
	}

	public String getO_bz() {
		return o_bz;
	}

	public void setO_bz(String o_bz) {
		this.o_bz = o_bz;
	}

	public int getO_scbs() {
		return o_scbs;
	}

	public void setO_scbs(int o_scbs) {
		this.o_scbs = o_scbs;
	}


	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public double getO_yf() {
		return o_yf;
	}

	public void setO_yf(double o_yf) {
		this.o_yf = o_yf;
	}

	public int getO_fb() {
		return o_fb;
	}

	public void setO_fb(int o_fb) {
		this.o_fb = o_fb;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "OrdersCommodityDetails [o_id=" + o_id + ", o_yf=" + o_yf
				+ ", o_num=" + o_num + ", o_zjg=" + o_zjg + ", o_fb=" + o_fb
				+ ", o_bz=" + o_bz + ", o_scbs=" + o_scbs + ", commodity="
				+ commodity + ", order=" + order + ", user=" + user + "]";
	}

	
	

	


	
	
}
