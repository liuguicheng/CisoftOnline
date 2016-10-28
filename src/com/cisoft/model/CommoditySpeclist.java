package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="n_commoditySpeclist")
public class CommoditySpeclist  extends PageRequest{

	/**
	 * 商品规格详细表
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int csl_id;
	private String csl_name;//规格值
	private String csl_imgs; //相关规格图片
	private String csl_kc;//库存
	private String cls_jhjg;//进货价格
	private String cls_xsjg;//销售价格
	private String cls_hh;//货号
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品id
	private int cls_scbs;
	
	public int getCsl_id() {
		return csl_id;
	}
	public void setCsl_id(int csl_id) {
		this.csl_id = csl_id;
	}
	public String getCsl_name() {
		return csl_name;
	}
	public void setCsl_name(String csl_name) {
		this.csl_name = csl_name;
	}
	public String getCsl_imgs() {
		return csl_imgs;
	}
	public void setCsl_imgs(String csl_imgs) {
		this.csl_imgs = csl_imgs;
	}
	public String getCsl_kc() {
		return csl_kc;
	}
	public void setCsl_kc(String csl_kc) {
		this.csl_kc = csl_kc;
	}
	public String getCls_jhjg() {
		return cls_jhjg;
	}
	public void setCls_jhjg(String cls_jhjg) {
		this.cls_jhjg = cls_jhjg;
	}
	public String getCls_xsjg() {
		return cls_xsjg;
	}
	public void setCls_xsjg(String cls_xsjg) {
		this.cls_xsjg = cls_xsjg;
	}
	public String getCls_hh() {
		return cls_hh;
	}
	public void setCls_hh(String cls_hh) {
		this.cls_hh = cls_hh;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	public int getCls_scbs() {
		return cls_scbs;
	}
	public void setCls_scbs(int cls_scbs) {
		this.cls_scbs = cls_scbs;
	}
	
	
	
}
