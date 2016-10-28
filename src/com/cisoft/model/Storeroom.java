package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="n_storeroom")
public class Storeroom extends PageRequest{
/**
 * 库房
 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int s_id;
	private String  s_name;
	private String s_ms;
	private int s_scbs;
	@ManyToOne(targetEntity=Storehouse.class)
	@JoinColumn(name="sh_id")
	private Storehouse storehouse;
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_ms() {
		return s_ms;
	}
	public void setS_ms(String s_ms) {
		this.s_ms = s_ms;
	}
	public int getS_scbs() {
		return s_scbs;
	}
	public void setS_scbs(int s_scbs) {
		this.s_scbs = s_scbs;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public Storehouse getStorehouse() {
		return storehouse;
	}
	public void setStorehouse(Storehouse storehouse) {
		this.storehouse = storehouse;
	}
	
	
}
