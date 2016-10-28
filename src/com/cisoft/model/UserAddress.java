package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 收货地址信息
 * @author pro
 *
 */
@Entity
@Table(name="n_userAddress")
public class UserAddress extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ua_id;
	private String ua_address;//收货地址
	private String ua_shName;//收货姓名
	private String ua_shDh;//收货人电话
	private String ua_shGddh;//收货固定电话
	private String ua_yb;//收货人邮编
	private int ua_status;//状态 0 未默认  1 默认
	private int ua_scbs;//删除标识
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private  User user;//pc用户

	public int getUa_id() {
		return ua_id;
	}
	public void setUa_id(int ua_id) {
		this.ua_id = ua_id;
	}
	public String getUa_address() {
		return ua_address;
	}
	public void setUa_address(String ua_address) {
		this.ua_address = ua_address;
	}
	public String getUa_shName() {
		return ua_shName;
	}
	public void setUa_shName(String ua_shName) {
		this.ua_shName = ua_shName;
	}
	public String getUa_shDh() {
		return ua_shDh;
	}
	public void setUa_shDh(String ua_shDh) {
		this.ua_shDh = ua_shDh;
	}
	public String getUa_shGddh() {
		return ua_shGddh;
	}
	public void setUa_shGddh(String ua_shGddh) {
		this.ua_shGddh = ua_shGddh;
	}
	public String getUa_yb() {
		return ua_yb;
	}
	public void setUa_yb(String ua_yb) {
		this.ua_yb = ua_yb;
	}
	public int getUa_status() {
		return ua_status;
	}
	public void setUa_status(int ua_status) {
		this.ua_status = ua_status;
	}
	public int getUa_scbs() {
		return ua_scbs;
	}
	public void setUa_scbs(int ua_scbs) {
		this.ua_scbs = ua_scbs;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
