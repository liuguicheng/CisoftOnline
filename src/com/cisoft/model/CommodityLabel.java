package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_commodityLabel")
public class CommodityLabel extends PageRequest{
	/**
	 * 商品标签
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cl_id;
	private String cl_name;//标签名称
	private int  cl_scbs;//删除标识
	private int cl_num;//使用标签商品数量
    private String  cl_bz;//备注
	private int _parentId=0; //父类 id
    
	public int getCl_id() {
		return cl_id;
	}
	public void setCl_id(int cl_id) {
		this.cl_id = cl_id;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public int getCl_scbs() {
		return cl_scbs;
	}
	public void setCl_scbs(int cl_scbs) {
		this.cl_scbs = cl_scbs;
	}
	public int getCl_num() {
		return cl_num;
	}
	public void setCl_num(int cl_num) {
		this.cl_num = cl_num;
	}
	public String getCl_bz() {
		return cl_bz;
	}
	public void setCl_bz(String cl_bz) {
		this.cl_bz = cl_bz;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
    
    
}
