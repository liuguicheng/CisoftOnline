package com.cisoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 熙软电商平台 用户提交信息表
 * @author pro
 *
 */
@Entity
@Table(name="c_CisoftPt")
public class CisoftPt {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int c_id;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	private String c_name;
	private String c_email;
	private String c_zhiye;
	private String c_yj;
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_zhiye() {
		return c_zhiye;
	}
	public void setC_zhiye(String c_zhiye) {
		this.c_zhiye = c_zhiye;
	}
	public String getC_yj() {
		return c_yj;
	}
	public void setC_yj(String c_yj) {
		this.c_yj = c_yj;
	}
	
	
}
