package com.cisoft.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="n_pageLayout")
public class PageLayout extends PageRequest{

	/**
	 * 页面布局 记录实体
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pl_id;
	private String pl_name;//页面名称
	private String pl_context;//页面详细代码
	private int pl_scbs;
	private int pl_fbbs;//发布标识
	private int pl_jtbs;//生成模版标识
	private String pl_cssurl;//css地址
	private String pl_jsurl;//js地址
	private int pl_templateid;//模版id
	private String pl_url;//模版地址
	
	public int getPl_id() {
		return pl_id;
	}
	public void setPl_id(int pl_id) {
		this.pl_id = pl_id;
	}
	public String getPl_name() {
		return pl_name;
	}
	public void setPl_name(String pl_name) {
		this.pl_name = pl_name;
	}
	@Lob 
	@Basic(fetch = FetchType.LAZY)   
	@Column(name="pl_context",columnDefinition="TEXT", nullable=true)
	public String getPl_context() {
		return pl_context;
	}
	public void setPl_context(String pl_context) {
		this.pl_context = pl_context;
	}
	public int getPl_scbs() {
		return pl_scbs;
	}
	public void setPl_scbs(int pl_scbs) {
		this.pl_scbs = pl_scbs;
	}
	public int getPl_fbbs() {
		return pl_fbbs;
	}
	public void setPl_fbbs(int pl_fbbs) {
		this.pl_fbbs = pl_fbbs;
	}
	public int getPl_jtbs() {
		return pl_jtbs;
	}
	public void setPl_jtbs(int pl_jtbs) {
		this.pl_jtbs = pl_jtbs;
	}
	public String getPl_cssurl() {
		return pl_cssurl;
	}
	public void setPl_cssurl(String pl_cssurl) {
		this.pl_cssurl = pl_cssurl;
	}
	public String getPl_jsurl() {
		return pl_jsurl;
	}
	public void setPl_jsurl(String pl_jsurl) {
		this.pl_jsurl = pl_jsurl;
	}
	public int getPl_templateid() {
		return pl_templateid;
	}
	public void setPl_templateid(int pl_templateid) {
		this.pl_templateid = pl_templateid;
	}
	public String getPl_url() {
		return pl_url;
	}
	public void setPl_url(String pl_url) {
		this.pl_url = pl_url;
	}
	
	
	
}
