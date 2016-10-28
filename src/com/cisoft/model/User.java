package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 用户信息
 * @author pro
 *
 */
@Entity
@Table(name="n_user")
public class User extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int u_id;
	private String u_name;//用户名
	private String u_pwd;//密码
	private String u_zsName;//真实
	private String u_email;//email
	private Integer u_scbs;//删除标识
	@ManyToOne(targetEntity=Role.class)
	@JoinColumn(name="roleid")
	private Role role;//角色
	private String u_address;//收货地址
	private String u_lxdh;//收货电话
	
	private int u_status;//状态1:注册未验证邮箱  2.邮箱验证  3.认证用户 4.商家添加
	
	private String validateCode;//激活码
	private Date  registerTime;//注册时间
	private Date  lastTime;//最后激活时间
	private int codenum;//找回密码是否执行
	
	private String uwx_bs;//微信标识
	private int uwx_gzbs;//关注标识  1微信用户  3pc注册用户   2 系统用户  4商家用户
	private String tximgurl;//头像
	
	private String u_nickname;//昵称
	private int u_xb;//性别
	private String u_csny;//出生年月
	
	@ManyToOne(targetEntity=MerchantInfo.class)
	@JoinColumn(name="merchantinfoid")
	private MerchantInfo merchantInfo;
	
	
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_lxdh() {
		return u_lxdh;
	}
	public void setU_lxdh(String u_lxdh) {
		this.u_lxdh = u_lxdh;
	}
	
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_zsName() {
		return u_zsName;
	}
	public void setU_zsName(String u_zsName) {
		this.u_zsName = u_zsName;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public Integer getU_scbs() {
		return u_scbs;
	}
	public void setU_scbs(Integer u_scbs) {
		this.u_scbs = u_scbs;
	}
	public int getU_status() {
		return u_status;
	}
	public void setU_status(int u_status) {
		this.u_status = u_status;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	public int getCodenum() {
		return codenum;
	}
	public void setCodenum(int codenum) {
		this.codenum = codenum;
	}
	public String getUwx_bs() {
		return uwx_bs;
	}
	public void setUwx_bs(String uwx_bs) {
		this.uwx_bs = uwx_bs;
	}
	public String getTximgurl() {
		return tximgurl;
	}
	public void setTximgurl(String tximgurl) {
		this.tximgurl = tximgurl;
	}
	public int getUwx_gzbs() {
		return uwx_gzbs;
	}
	public void setUwx_gzbs(int uwx_gzbs) {
		this.uwx_gzbs = uwx_gzbs;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public int getU_xb() {
		return u_xb;
	}
	public void setU_xb(int u_xb) {
		this.u_xb = u_xb;
	}
	public String getU_csny() {
		return u_csny;
	}
	public void setU_csny(String u_csny) {
		this.u_csny = u_csny;
	}
	public MerchantInfo getMerchantInfo() {
		return merchantInfo;
	}
	public void setMerchantInfo(MerchantInfo merchantInfo) {
		this.merchantInfo = merchantInfo;
	}
	
	

}
