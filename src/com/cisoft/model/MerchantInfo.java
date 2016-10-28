package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="n_merchantinfo")
public class MerchantInfo extends PageRequest{

	/**
	 * 商家信息
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int mi_id;
	private String mi_name;//网店名称
	private String mi_url;//网址
	private String mi_logourl;//网店logo
	private String mi_bzh;//备案号

	
	private Date mi_starttime;//使用开始时间
	private Date mi_endtime;//到期时间
	
	private int mi_scbs;//删除标识
	
	@ManyToOne(targetEntity=MerchantClass.class)
	@JoinColumn(name="merchantclassid")
	private MerchantClass merchantClass;//等级
	
	
	
	public int getMi_id() {
		return mi_id;
	}
	public void setMi_id(int mi_id) {
		this.mi_id = mi_id;
	}
	public String getMi_name() {
		return mi_name;
	}
	public void setMi_name(String mi_name) {
		this.mi_name = mi_name;
	}
	public String getMi_url() {
		return mi_url;
	}
	public void setMi_url(String mi_url) {
		this.mi_url = mi_url;
	}
	public String getMi_logourl() {
		return mi_logourl;
	}
	public void setMi_logourl(String mi_logourl) {
		this.mi_logourl = mi_logourl;
	}
	public String getMi_bzh() {
		return mi_bzh;
	}
	public void setMi_bzh(String mi_bzh) {
		this.mi_bzh = mi_bzh;
	}
	public Date getMi_starttime() {
		return mi_starttime;
	}
	public void setMi_starttime(Date mi_starttime) {
		this.mi_starttime = mi_starttime;
	}
	public Date getMi_endtime() {
		return mi_endtime;
	}
	public void setMi_endtime(Date mi_endtime) {
		this.mi_endtime = mi_endtime;
	}
	public int getMi_scbs() {
		return mi_scbs;
	}
	public void setMi_scbs(int mi_scbs) {
		this.mi_scbs = mi_scbs;
	}
	public MerchantClass getMerchantClass() {
		return merchantClass;
	}
	public void setMerchantClass(MerchantClass merchantClass) {
		this.merchantClass = merchantClass;
	}
	
	
}
