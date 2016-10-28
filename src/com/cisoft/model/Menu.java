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
 * 菜单
 */
@Entity
@Table(name="n_menu")
public class Menu {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String menuname;//菜单名称
	private String page;//路径
	private int parentid;//父节点
	private int _parentId=0;
	@Transient
	private int pId;
	public int getpId() {
		return parentid;
	}
	@ManyToMany(mappedBy="menus")
	private List<Role> roles=new ArrayList<Role>();
	
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
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public int get_parentId() {
		return _parentId;
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	
	
}
