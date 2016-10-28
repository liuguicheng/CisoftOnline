package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品品牌
 * @author pro
 *
 */
@Entity
@Table(name="n_commoditybrand")
public class CommodityBrand extends PageRequest{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cb_id;
	private String cb_name;
	private int cb_px;
	private String cb_imgurl;//图片地址
	private int cb_scbs;
	private int _parentId=0; 
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}
	public String getCb_name() {
		return cb_name;
	}
	public void setCb_name(String cb_name) {
		this.cb_name = cb_name;
	}
	public int getCb_px() {
		return cb_px;
	}
	public void setCb_px(int cb_px) {
		this.cb_px = cb_px;
	}
	public String getCb_imgurl() {
		return cb_imgurl;
	}
	public void setCb_imgurl(String cb_imgurl) {
		this.cb_imgurl = cb_imgurl;
	}
	public int getCb_scbs() {
		return cb_scbs;
	}
	public void setCb_scbs(int cb_scbs) {
		this.cb_scbs = cb_scbs;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	
	
	
}
