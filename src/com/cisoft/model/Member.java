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
@Table(name="n_member")
public class Member extends PageRequest{
	/*
	 * 会员信息
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int m_id;
	private String m_loginname;
	private String m_email;
	private String m_pwd;
	private String m_name;//姓名
	private String m_phone;//手机
	private String m_qq;//qq
	private String m_bz;//备注
	private String m_address;//地区
	private int m_xb; //0 男 1 女
	private Date m_zcsj;//注册时间
	private Date m_csrq;//出生日期
	private int m_uid;//登录账号id
	private int m_scbs;//
	//等级
	@ManyToOne(targetEntity=MembershipGrade.class)
	@JoinColumn(name="mgradid")
	private MembershipGrade mgrad;
	//所属商家／店铺
	

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_qq() {
		return m_qq;
	}

	public void setM_qq(String m_qq) {
		this.m_qq = m_qq;
	}

	public String getM_bz() {
		return m_bz;
	}

	public void setM_bz(String m_bz) {
		this.m_bz = m_bz;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public int getM_xb() {
		return m_xb;
	}

	public void setM_xb(int m_xb) {
		this.m_xb = m_xb;
	}


	public int getM_uid() {
		return m_uid;
	}

	public void setM_uid(int m_uid) {
		this.m_uid = m_uid;
	}

	public MembershipGrade getMgrad() {
		return mgrad;
	}

	public void setMgrad(MembershipGrade mgrad) {
		this.mgrad = mgrad;
	}

	public int getM_scbs() {
		return m_scbs;
	}

	public void setM_scbs(int m_scbs) {
		this.m_scbs = m_scbs;
	}

	public Date getM_zcsj() {
		return m_zcsj;
	}

	public void setM_zcsj(Date m_zcsj) {
		this.m_zcsj = m_zcsj;
	}

	public Date getM_csrq() {
		return m_csrq;
	}

	public void setM_csrq(Date m_csrq) {
		this.m_csrq = m_csrq;
	}

	public String getM_loginname() {
		return m_loginname;
	}

	public void setM_loginname(String m_loginname) {
		this.m_loginname = m_loginname;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	
}
