package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 商品图片相册管理
 * @author pro
 *
 */
@Entity
@Table(name="n_commodityImg")
public class CommodityImg extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ci_id;
	private String ci_url;
	private String ci_bz;
	private int ci_scbs;
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private  Commodity commodity;//商品信息
	
	/**
	 * 2014-3-14
	 * lgc
	 */
	private int ci_px;//排序
	private int ci_lx;//类型
	@ManyToOne(targetEntity=CommoditySpec.class)
	@JoinColumn(name="cp_id")
	private CommoditySpec commodityspec;//商品规格
	
	
	public int getCi_id() {
		return ci_id;
	}
	public void setCi_id(int ci_id) {
		this.ci_id = ci_id;
	}
	public String getCi_url() {
		return ci_url;
	}
	public void setCi_url(String ci_url) {
		this.ci_url = ci_url;
	}
	public String getCi_bz() {
		return ci_bz;
	}
	public void setCi_bz(String ci_bz) {
		this.ci_bz = ci_bz;
	}
	
	public int getCi_scbs() {
		return ci_scbs;
	}
	public void setCi_scbs(int ci_scbs) {
		this.ci_scbs = ci_scbs;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	public int getCi_px() {
		return ci_px;
	}
	public void setCi_px(int ci_px) {
		this.ci_px = ci_px;
	}
	public int getCi_lx() {
		return ci_lx;
	}
	public void setCi_lx(int ci_lx) {
		this.ci_lx = ci_lx;
	}
	public CommoditySpec getCommodityspec() {
		return commodityspec;
	}
	public void setCommodityspec(CommoditySpec commodityspec) {
		this.commodityspec = commodityspec;
	}
	
	
}

