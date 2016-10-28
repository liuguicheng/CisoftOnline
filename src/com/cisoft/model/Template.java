package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_template")
public class Template extends PageRequest{

	//模版实体类
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int t_id;
	private String t_name;//模版名称
	private String t_url;//模版地址
	private int t_userbs;//使用标识
	private int t_scbs;//删除标识
	private int t_vipbs;//vip标识
	private String t_sltimg;//缩略图
	private int  _parentId=0; //标识父类
	private int t_type;//模版类型
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	public String getT_sltimg() {
		return t_sltimg;
	}
	public void setT_sltimg(String t_sltimg) {
		this.t_sltimg = t_sltimg;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_url() {
		return t_url;
	}
	public void setT_url(String t_url) {
		this.t_url = t_url;
	}
	public int getT_userbs() {
		return t_userbs;
	}
	public void setT_userbs(int t_userbs) {
		this.t_userbs = t_userbs;
	}
	public int getT_scbs() {
		return t_scbs;
	}
	public void setT_scbs(int t_scbs) {
		this.t_scbs = t_scbs;
	}
	public int getT_vipbs() {
		return t_vipbs;
	}
	public void setT_vipbs(int t_vipbs) {
		this.t_vipbs = t_vipbs;
	}
	public int getT_type() {
		return t_type;
	}
	public void setT_type(int t_type) {
		this.t_type = t_type;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	
}
