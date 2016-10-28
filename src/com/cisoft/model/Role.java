package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/*
 * 角色
 */
@Entity
@Table(name="n_role")
public class Role extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String rolename;//角色名称
	private String mark;//备注
	private Integer tag;
	private Integer scbs;
	
	@ManyToMany
	@JoinTable(name="n_role_menu",joinColumns={@JoinColumn(name="menuid")},inverseJoinColumns={@JoinColumn(name="roleid")})
	private List<Menu> menus=new ArrayList<Menu>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	public Integer getTag() {
		return tag;
	}
	public void setTag(Integer tag) {
		this.tag = tag;
	}
	public Integer getScbs() {
		return scbs;
	}
	public void setScbs(Integer scbs) {
		this.scbs = scbs;
	}
	
	
}
