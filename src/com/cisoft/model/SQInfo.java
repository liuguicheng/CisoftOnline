package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 社区信息
 * @author pro
 *
 */
@Entity
@Table(name="n_sqinfo")
public class SQInfo extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int s_id;
	private String s_name;
	private String s_address;
	private String s_bz;
	private int s_xh;
	private int s_scbs;
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_bz() {
		return s_bz;
	}
	public void setS_bz(String s_bz) {
		this.s_bz = s_bz;
	}
	public int getS_xh() {
		return s_xh;
	}
	public void setS_xh(int s_xh) {
		this.s_xh = s_xh;
	}
	public int getS_scbs() {
		return s_scbs;
	}
	public void setS_scbs(int s_scbs) {
		this.s_scbs = s_scbs;
	}
	
}
