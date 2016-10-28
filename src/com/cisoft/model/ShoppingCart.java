package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 购物车
 * @author pro
 *
 */
@Entity
@Table(name="n_shoppingcart")
public class ShoppingCart extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int sc_id;
	private int sc_scbs;
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//用户信息
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品信息
	@ManyToOne(targetEntity=Orders.class)
	@JoinColumn(name="o_id")
	private Orders orders;
	@ManyToOne(targetEntity=OrdersCommodityDetails.class)
	@JoinColumn(name="ord_id")
	private OrdersCommodityDetails ordetail;//商品明细
	
	public int getSc_id() {
		return sc_id;
	}
	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}
	public int getSc_scbs() {
		return sc_scbs;
	}
	public void setSc_scbs(int sc_scbs) {
		this.sc_scbs = sc_scbs;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public OrdersCommodityDetails getOrdetail() {
		return ordetail;
	}
	public void setOrdetail(OrdersCommodityDetails ordetail) {
		this.ordetail = ordetail;
	}
	@Override
	public String toString() {
		return "ShoppingCart [sc_id=" + sc_id + ", sc_scbs=" + sc_scbs
				+ ", user=" + user + ", commodity=" + commodity + ", orders="
				+ orders + ", ordetail=" + ordetail + "]";
	}
	

}
