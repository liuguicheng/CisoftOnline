package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 供应商信息
 * @author pro
 *
 */
@Entity
@Table(name="n_gysinfp")
public class GYSInfo extends PageRequest{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int g_id;
	private String g_name;
	private String g_address;
	private String g_dh;//电话
	private String g_lxr;//联系人
	private String g_cp;//主营产品
	private String g_bz;
	private int g_xh;
	private int g_scbs;
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_address() {
		return g_address;
	}
	public void setG_address(String g_address) {
		this.g_address = g_address;
	}
	public String getG_dh() {
		return g_dh;
	}
	public void setG_dh(String g_dh) {
		this.g_dh = g_dh;
	}
	public String getG_lxr() {
		return g_lxr;
	}
	public void setG_lxr(String g_lxr) {
		this.g_lxr = g_lxr;
	}
	public String getG_cp() {
		return g_cp;
	}
	public void setG_cp(String g_cp) {
		this.g_cp = g_cp;
	}
	public String getG_bz() {
		return g_bz;
	}
	public void setG_bz(String g_bz) {
		this.g_bz = g_bz;
	}
	public int getG_xh() {
		return g_xh;
	}
	public void setG_xh(int g_xh) {
		this.g_xh = g_xh;
	}
	public int getG_scbs() {
		return g_scbs;
	}
	public void setG_scbs(int g_scbs) {
		this.g_scbs = g_scbs;
	}
	
}
