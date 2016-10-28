package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_templateLabel")
public class TemplateLabel extends PageRequest{

	/**
	 * 模版标签实体
	 * 
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int tl_id;
	private String tl_name;//名称
	private String tl_context;//内容
	private int tl_scbs;//删除标识别
	private int tl_type;//标签类型
	private int  _parentId=0; //标识父类
	public int getTl_id() {
		return tl_id;
	}
	public void setTl_id(int tl_id) {
		this.tl_id = tl_id;
	}
	public String getTl_name() {
		return tl_name;
	}
	public void setTl_name(String tl_name) {
		this.tl_name = tl_name;
	}
	public String getTl_context() {
		return tl_context;
	}
	public void setTl_context(String tl_context) {
		this.tl_context = tl_context;
	}
	public int getTl_type() {
		return tl_type;
	}
	public void setTl_type(int tl_type) {
		this.tl_type = tl_type;
	}
	public int getTl_scbs() {
		return tl_scbs;
	}
	public void setTl_scbs(int tl_scbs) {
		this.tl_scbs = tl_scbs;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	
	
}
