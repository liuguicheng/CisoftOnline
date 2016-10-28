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
@Table(name="n_stockinventory")
public class StockInventory extends PageRequest{

	/**
	 * 库存盘点
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int si_id;
	private int si_no;//单号
	private int si_smsl;//数量
	private Date si_date;//入库日期
	private Date si_lastckdate;//最后出库日期
	private int si_zt;//状态 
	private int si_scbs;//删除标识
	private String si_bz;//备注
	
	@ManyToOne(targetEntity=Storeroom.class)
	@JoinColumn(name="s_id")
	private Storeroom storeroom;//库房
	
	@ManyToOne(targetEntity=Commodity.class)
	@JoinColumn(name="c_id")
	private Commodity commodity;//商品
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="u_id")
	private User user;//盘点用户

	public int getSi_id() {
		return si_id;
	}

	public void setSi_id(int si_id) {
		this.si_id = si_id;
	}

	public int getSi_no() {
		return si_no;
	}

	public void setSi_no(int si_no) {
		this.si_no = si_no;
	}

	public int getSi_smsl() {
		return si_smsl;
	}

	public void setSi_smsl(int si_smsl) {
		this.si_smsl = si_smsl;
	}

	public Date getSi_date() {
		return si_date;
	}

	public void setSi_date(Date si_date) {
		this.si_date = si_date;
	}

	public int getSi_zt() {
		return si_zt;
	}

	public void setSi_zt(int si_zt) {
		this.si_zt = si_zt;
	}

	public int getSi_scbs() {
		return si_scbs;
	}

	public void setSi_scbs(int si_scbs) {
		this.si_scbs = si_scbs;
	}

	public String getSi_bz() {
		return si_bz;
	}

	public void setSi_bz(String si_bz) {
		this.si_bz = si_bz;
	}

	public Storeroom getStoreroom() {
		return storeroom;
	}

	public void setStoreroom(Storeroom storeroom) {
		this.storeroom = storeroom;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getSi_lastckdate() {
		return si_lastckdate;
	}

	public void setSi_lastckdate(Date si_lastckdate) {
		this.si_lastckdate = si_lastckdate;
	}
	
	
	
	
	
	
}
