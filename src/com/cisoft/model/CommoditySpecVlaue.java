package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="n_CommoditySpecVlaue")
public class CommoditySpecVlaue {

	/**
	 * 商品规格值
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cpv_id;
	private String cpv_name;
	private String cpv_img;//图片
	private int cpv_xh;//排序
	@ManyToOne(targetEntity=CommoditySpec.class)
	@JoinColumn(name="cp_id")
	private CommoditySpec commoditySpec;
	public int getCpv_id() {
		return cpv_id;
	}
	public void setCpv_id(int cpv_id) {
		this.cpv_id = cpv_id;
	}
	public String getCpv_name() {
		return cpv_name;
	}
	public void setCpv_name(String cpv_name) {
		this.cpv_name = cpv_name;
	}
	public String getCpv_img() {
		return cpv_img;
	}
	public void setCpv_img(String cpv_img) {
		this.cpv_img = cpv_img;
	}
	public int getCpv_xh() {
		return cpv_xh;
	}
	public void setCpv_xh(int cpv_xh) {
		this.cpv_xh = cpv_xh;
	}
	public CommoditySpec getCommoditySpec() {
		return commoditySpec;
	}
	public void setCommoditySpec(CommoditySpec commoditySpec) {
		this.commoditySpec = commoditySpec;
	}
	
	
	
	
	
}
