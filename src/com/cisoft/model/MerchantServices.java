package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/*
 * 商家服务
 */
@Entity
@Table(name="n_merchantservices")
public class MerchantServices {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String menuname;//服务名称
	private String page;//路径
	private int parentid;//父节点
	private int scbs=1;//
	private int _parentId=0;
	@Transient
	private int pId;
	public int getpId() {
		return parentid;
	}
	@ManyToMany(mappedBy="merchs")
	private List<MerchantClass> merchants=new ArrayList<MerchantClass>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	public List<MerchantClass> getMerchants() {
		return merchants;
	}
	public void setMerchants(List<MerchantClass> merchants) {
		this.merchants = merchants;
	}
	public int getScbs() {
		return scbs;
	}
	public void setScbs(int scbs) {
		this.scbs = scbs;
	}
	
	
}
