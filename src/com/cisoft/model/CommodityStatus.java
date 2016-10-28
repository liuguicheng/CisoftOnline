package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 商品状态
 * 特惠、口碑、新品、畅销
 *
 */
@Entity
@Table(name="n_commoditystatus")
public class CommodityStatus extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cs_id;
	private String cs_name;
	private int cs_scbs;
	private int cs_px;
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
	
	
}
