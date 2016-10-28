package com.cisoft.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="n_storehouse")
public class Storehouse extends PageRequest{
/**
 * 仓库
 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int sh_id;
	private String sh_name;
	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}

	private String sh_address;
	private int sh_scbs;
	private String sh_ms;
	

	public int getSh_id() {
		return sh_id;
	}

	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}

	public String getSh_address() {
		return sh_address;
	}

	public void setSh_address(String sh_address) {
		this.sh_address = sh_address;
	}

	public int getSh_scbs() {
		return sh_scbs;
	}

	public void setSh_scbs(int sh_scbs) {
		this.sh_scbs = sh_scbs;
	}

	public String getSh_ms() {
		return sh_ms;
	}

	public void setSh_ms(String sh_ms) {
		this.sh_ms = sh_ms;
	}


	
}
