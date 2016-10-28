package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 操作日志管理
 * @author pro
 *
 */
@Entity
@Table(name="n_OperationLog")
public class OperationLog extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ol_id;
	private String ol_usercode;//用户代码
	private String ol_username;//用户名称
	private String ol_ip;//登录ip
	private int ol_type;//操作类型 1增 2、删、3修改、 4查
	private String ol_context;//操作内容
	private Date   ol_time;//操作时间
	private String ol_bz;//备注
	public int getOl_id() {
		return ol_id;
	}
	public void setOl_id(int ol_id) {
		this.ol_id = ol_id;
	}
	public String getOl_usercode() {
		return ol_usercode;
	}
	public void setOl_usercode(String ol_usercode) {
		this.ol_usercode = ol_usercode;
	}
	public String getOl_username() {
		return ol_username;
	}
	public void setOl_username(String ol_username) {
		this.ol_username = ol_username;
	}
	public String getOl_ip() {
		return ol_ip;
	}
	public void setOl_ip(String ol_ip) {
		this.ol_ip = ol_ip;
	}
	public int getOl_type() {
		return ol_type;
	}
	public void setOl_type(int ol_type) {
		this.ol_type = ol_type;
	}
	public String getOl_context() {
		return ol_context;
	}
	public void setOl_context(String ol_context) {
		this.ol_context = ol_context;
	}
	public Date getOl_time() {
		return ol_time;
	}
	public void setOl_time(Date ol_time) {
		this.ol_time = ol_time;
	}
	public String getOl_bz() {
		return ol_bz;
	}
	public void setOl_bz(String ol_bz) {
		this.ol_bz = ol_bz;
	}
	
	
}
