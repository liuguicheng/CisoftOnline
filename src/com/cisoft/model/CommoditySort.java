package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品分类
 * @author pro
 *
 */
@Entity
@Table(name="n_commoditysort")
public class CommoditySort extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cs_id;
	private String cs_name;
	private int cs_scbs;
	private int cs_px;
	private int _parentId=0; 
	
	private int cs_parentid;//父节点
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}
	public String getCs_name() {
		return cs_name;
	}
	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}
	public int getCs_scbs() {
		return cs_scbs;
	}
	public void setCs_scbs(int cs_scbs) {
		this.cs_scbs = cs_scbs;
	}
	public int getCs_px() {
		return cs_px;
	}
	public void setCs_px(int cs_px) {
		this.cs_px = cs_px;
	}
	public int getCs_parentid() {
		return cs_parentid;
	}
	public void setCs_parentid(int cs_parentid) {
		this.cs_parentid = cs_parentid;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	
	
}
