package com.cisoft.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 商品信息 属性
 * @author pro
 *
 */
@Entity
@Table(name="n_commodityp")
public class CommodityP {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cp_id;
	private String cp_name;
	private String cp_context;//品牌
	private int  cp_lx;//类型  
	private int cp_scbs;//删除标识
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
    private Commodity commodity;

	public int getCp_id() {
		return cp_id;
	}

	public void setCp_id(int cp_id) {
		this.cp_id = cp_id;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getCp_context() {
		return cp_context;
	}

	public void setCp_context(String cp_context) {
		this.cp_context = cp_context;
	}

	public int getCp_lx() {
		return cp_lx;
	}

	public void setCp_lx(int cp_lx) {
		this.cp_lx = cp_lx;
	}

	public int getCp_scbs() {
		return cp_scbs;
	}

	public void setCp_scbs(int cp_scbs) {
		this.cp_scbs = cp_scbs;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	
	
	
	
	
	
}
