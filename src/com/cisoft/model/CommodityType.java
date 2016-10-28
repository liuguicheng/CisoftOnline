package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="n_commodityType")
public class CommodityType extends PageRequest{

	/**
	 * 商品类型管理
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ct_id;
	private String ct_name;
	private String ct_brand;//关联品牌
	private String ct_spec;//商品规格
	private int ct_scbs;//删除标识
	private int ct_px;//排序
	private String ct_imgurl;//图片
	@ManyToMany
	@JoinTable(name="n_type_spec",joinColumns={@JoinColumn(name="cp_id")},inverseJoinColumns={@JoinColumn(name="ct_id")})
	private List<CommoditySpec> cslist=new ArrayList<CommoditySpec>();
	
	public int getCt_px() {
		return ct_px;
	}
	public void setCt_px(int ct_px) {
		this.ct_px = ct_px;
	}
	public int getCt_id() {
		return ct_id;
	}
	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_brand() {
		return ct_brand;
	}
	public void setCt_brand(String ct_brand) {
		this.ct_brand = ct_brand;
	}
	public String getCt_spec() {
		return ct_spec;
	}
	public void setCt_spec(String ct_spec) {
		this.ct_spec = ct_spec;
	}
	public int getCt_scbs() {
		return ct_scbs;
	}
	public void setCt_scbs(int ct_scbs) {
		this.ct_scbs = ct_scbs;
	}
	public String getCt_imgurl() {
		return ct_imgurl;
	}
	public void setCt_imgurl(String ct_imgurl) {
		this.ct_imgurl = ct_imgurl;
	}
	public List<CommoditySpec> getCslist() {
		return cslist;
	}
	public void setCslist(List<CommoditySpec> cslist) {
		this.cslist = cslist;
	}
	
	
	
	
}
