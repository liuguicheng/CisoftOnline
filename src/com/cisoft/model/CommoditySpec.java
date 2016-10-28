package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="n_CommoditySpec")
public class CommoditySpec extends PageRequest{


	/**
	 * 商品规格
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cp_id;
	private String cp_name;
	private int cp_lx;//显示类型
	private int cp_zsfs;//显示方式
	private String cp_bz;//规格备注
	@ManyToMany(mappedBy="cslist")
	private List<CommodityType> ctype=new ArrayList<CommodityType>();
	@OneToMany(mappedBy = "commoditySpec", cascade = CascadeType.ALL)  
	private List<CommoditySpecVlaue> scvlist=new ArrayList<CommoditySpecVlaue>();
	
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
	public int getCp_lx() {
		return cp_lx;
	}
	public void setCp_lx(int cp_lx) {
		this.cp_lx = cp_lx;
	}
	public int getCp_zsfs() {
		return cp_zsfs;
	}
	public void setCp_zsfs(int cp_zsfs) {
		this.cp_zsfs = cp_zsfs;
	}
	public String getCp_bz() {
		return cp_bz;
	}
	public void setCp_bz(String cp_bz) {
		this.cp_bz = cp_bz;
	}
	public List<CommodityType> getCtype() {
		return ctype;
	}
	public void setCtype(List<CommodityType> ctype) {
		this.ctype = ctype;
	}
	public List<CommoditySpecVlaue> getScvlist() {
		return scvlist;
	}
	public void setScvlist(List<CommoditySpecVlaue> scvlist) {
		this.scvlist = scvlist;
	}
	
	
}
