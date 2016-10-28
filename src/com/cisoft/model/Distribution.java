package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_distribution")
public class Distribution extends PageRequest{
/**
 * 配送管理
 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int d_id;
	private String d_name;
	private int d_scbs;
	private String d_ms;
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public int getD_scbs() {
		return d_scbs;
	}
	public void setD_scbs(int d_scbs) {
		this.d_scbs = d_scbs;
	}
	public String getD_ms() {
		return d_ms;
	}
	public void setD_ms(String d_ms) {
		this.d_ms = d_ms;
	}
	
	
}
