package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 订单流程信息
 * @author pro
 *
 */
@Entity
@Table(name="n_ordersrecord")
public class OrdersRecord extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int or_id;
	private int or_step;//操作步骤
	/**
	 * 0:用户下单，未发货(已付款)
1:供应商发货，用户未收货
2:用户确认收货
3：订单结束 
4: 用户申请退货
5：退货处理中
6: 加入购物车未下单（未结算）
7:用户下单未付款
	 */
	private Date or_szsj;//操作时间
	private int or_scbs;
	private String or_czr;//操作人
	
	@ManyToOne(targetEntity=Orders.class)
	@JoinColumn(name="o_id")
	private Orders orders;//订单信息
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//用户
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	private String or_bz;//备注
	public int getOr_id() {
		return or_id;
	}
	public void setOr_id(int or_id) {
		this.or_id = or_id;
	}
	public int getOr_step() {
		return or_step;
	}
	public void setOr_step(int or_step) {
		this.or_step = or_step;
	}
	public Date getOr_szsj() {
		return or_szsj;
	}
	public void setOr_szsj(Date or_szsj) {
		this.or_szsj = or_szsj;
	}
	public int getOr_scbs() {
		return or_scbs;
	}
	public void setOr_scbs(int or_scbs) {
		this.or_scbs = or_scbs;
	}
	public String getOr_czr() {
		return or_czr;
	}
	public void setOr_czr(String or_czr) {
		this.or_czr = or_czr;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public String getOr_bz() {
		return or_bz;
	}
	public void setOr_bz(String or_bz) {
		this.or_bz = or_bz;
	}
	
	
	

}
