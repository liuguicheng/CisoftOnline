package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * 订单信息
 * @author pro
 *
 */
@Entity
@Table(name="n_orders")
public class Orders extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int o_id;
	private String o_bh;//订单编号
	private String o_startTime;//发起时间
	private String o_endTime;//结束时间
	private double o_yf;//邮费
	private double o_zjg;//订单总价格
	private String o_bz;//备注
	private int o_scbs;
	private int o_status;//订单状态
	/**
	 * 0:用户下单，未发货
1:供应商发货，用户未收货
2:用户确认收货
3：订单结束 
4: 用户申请退货
5：退货处理中 
6: 加入购物车未下单（未结算）
7:取消订单
8.用户下单未付款
	 */
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//用户
	private int o_fb;//是否开发票
	private int o_fkfs;//付款方式 1、银联  2、支付宝
	private String fhtime;//发货时间
	private String shtime;//收货时间
	private String fktime;//付款时间
	public int getO_fkfs() {
		return o_fkfs;
	}

	public void setO_fkfs(int o_fkfs) {
		this.o_fkfs = o_fkfs;
	}

	@ManyToOne(targetEntity=UserAddress.class)
	@JoinColumn(name="ua_id")
	private UserAddress useraddress;
	
	/**
	 * 订单描述
	 * @return
	 */
	private String o_ms;
	/**
	 * 订单名称
	 * @return
	 */
	private String o_title;
	
	/**
	 * 支付交易号
	 * @return
	 */
	private String o_jyh;
	
	//订单分类
	private Integer o_sort;//1pc端  2微信端 3android端 4ios端
	
	
	
	public String getO_jyh() {
		return o_jyh;
	}

	public void setO_jyh(String o_jyh) {
		this.o_jyh = o_jyh;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public String getO_bh() {
		return o_bh;
	}

	public void setO_bh(String o_bh) {
		this.o_bh = o_bh;
	}

	public String getO_startTime() {
		return o_startTime;
	}

	public void setO_startTime(String o_startTime) {
		this.o_startTime = o_startTime;
	}

	public String getO_endTime() {
		return o_endTime;
	}

	public void setO_endTime(String o_endTime) {
		this.o_endTime = o_endTime;
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

	public int getO_status() {
		return o_status;
	}

	public void setO_status(int o_status) {
		this.o_status = o_status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
	

	public UserAddress getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(UserAddress useraddress) {
		this.useraddress = useraddress;
	}

	public String getO_ms() {
		return o_ms;
	}

	public void setO_ms(String o_ms) {
		this.o_ms = o_ms;
	}

	public String getO_title() {
		return o_title;
	}

	public void setO_title(String o_title) {
		this.o_title = o_title;
	}

	public String getFhtime() {
		return fhtime;
	}

	public void setFhtime(String fhtime) {
		this.fhtime = fhtime;
	}

	public String getShtime() {
		return shtime;
	}

	public void setShtime(String shtime) {
		this.shtime = shtime;
	}

	public String getFktime() {
		return fktime;
	}

	public void setFktime(String fktime) {
		this.fktime = fktime;
	}

	public Integer getO_sort() {
		return o_sort;
	}

	public void setO_sort(Integer o_sort) {
		this.o_sort = o_sort;
	}


	


	
	
}
