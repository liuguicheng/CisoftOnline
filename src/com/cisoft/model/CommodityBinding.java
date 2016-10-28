package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_commodityBinding")
public class CommodityBinding extends PageRequest{

	/**
	 * 商品绑定类
	 * 当浏览一个商品时，推荐／或组合套餐 显示商品 的作用类
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cb_id;
	private int cb_zid;//主商品id
	private int cb_fid;//副商品id
	private int cb_lx;//类型  区分  推荐的／组合的／？  保留字段
	private int cb_scbs;//删除标识
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}
	public int getCb_zid() {
		return cb_zid;
	}
	public void setCb_zid(int cb_zid) {
		this.cb_zid = cb_zid;
	}
	public int getCb_fid() {
		return cb_fid;
	}
	public void setCb_fid(int cb_fid) {
		this.cb_fid = cb_fid;
	}
	public int getCb_lx() {
		return cb_lx;
	}
	public void setCb_lx(int cb_lx) {
		this.cb_lx = cb_lx;
	}
	public int getCb_scbs() {
		return cb_scbs;
	}
	public void setCb_scbs(int cb_scbs) {
		this.cb_scbs = cb_scbs;
	}
	
}
