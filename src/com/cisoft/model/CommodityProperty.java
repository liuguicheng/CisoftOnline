package com.cisoft.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品属性
 * @author pro
 *
 */
@Entity
@Table(name="n_commodityproperty")
public class CommodityProperty extends PageRequest{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cp_id;
	private String cp_propertyname;
	private String cp_propertycontent;
	private int cp_scbs;
	private String cp_imgurl;//图片地址
	private int _parentId=0; 
	
	public int getCp_id() {
		return cp_id;
	}
	public void setCp_id(int cp_id) {
		this.cp_id = cp_id;
	}
	public String getCp_propertyname() {
		return cp_propertyname;
	}
	public void setCp_propertyname(String cp_propertyname) {
		this.cp_propertyname = cp_propertyname;
	}
	public String getCp_propertycontent() {
		return cp_propertycontent;
	}
	public void setCp_propertycontent(String cp_propertycontent) {
		this.cp_propertycontent = cp_propertycontent;
	}
	public int getCp_scbs() {
		return cp_scbs;
	}
	public void setCp_scbs(int cp_scbs) {
		this.cp_scbs = cp_scbs;
	}
	public String getCp_imgurl() {
		return cp_imgurl;
	}
	public void setCp_imgurl(String cp_imgurl) {
		this.cp_imgurl = cp_imgurl;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	
	
	
	
	
	
}
