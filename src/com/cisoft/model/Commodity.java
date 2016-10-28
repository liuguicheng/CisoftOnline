package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 商品信息
 * @author pro
 *
 */
@Entity
@Table(name="n_commodity")
public class Commodity extends PageRequest{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int c_id;
	private String c_name;
	private String c_jdname;//商品简短名称
	private String c_pp;//品牌
	private int  c_lx;//类型  
	private double c_jg ;//本店价格
	private int c_ck;//库存
	private String  c_gg;//规格重量
	private String c_dj;//等级
	private String c_bZhun;//标准
	private String c_cd;//产地
	private int c_bzq;//保质期
	private String c_ccfs;//存储方式
	private double c_psjg;//配送价格
	private int c_scbs;//删除标识
	@ManyToOne(targetEntity=GYSInfo.class)
	@JoinColumn(name="g_id")
	private GYSInfo gysInfo;//供应商信息
	
	/**
	 * 2014-3-13
	 * lgc 
	 * 完善商品设计
	 * 
	 */
	@ManyToOne(targetEntity=CommoditySort.class)
	@JoinColumn(name="cs_id")
	private CommoditySort commoditySort;//商品分类
	@ManyToMany
	@JoinTable(name="n_commodity_property",joinColumns={@JoinColumn(name="c_id")},inverseJoinColumns={@JoinColumn(name="cp_id")})
	private List<CommodityProperty> commodityPropertylist=new ArrayList<CommodityProperty>();//商品属性
	@ManyToOne(targetEntity=CommodityBrand.class)
	@JoinColumn(name="cb_id")
	private CommodityBrand commodityBrand;//商品品牌
	public CommodityLabel getCommodlabel() {
		return commodlabel;
	}
	public void setCommodlabel(CommodityLabel commodlabel) {
		this.commodlabel = commodlabel;
	}
	@ManyToOne(targetEntity=CommodityStatus.class)
	@JoinColumn(name="cst_id")
	private CommodityStatus commodityStatus;//商品状态
	
	@ManyToOne(targetEntity=CommodityLabel.class)
	@JoinColumn(name="cl_id")
	private CommodityLabel commodlabel;//商品标签
	
	@ManyToOne(targetEntity=CommodityType.class)
	@JoinColumn(name="ct_id")
	private CommodityType commoditytype;//商品类型
	
	
	private String c_spbh;//商品编号
	private double c_scjg;//市场价格
	private double c_jhjg;//进货价格
	private int c_px;//商品排序
	private double c_zl;//重量
	private String c_jldw;//计量单位
	private double c_ckyj;//库存预警
	private double c_jf;//赠送积分
	private double c_zxgmnum;//最小购买数量
	private double c_zxzdnum;//最大购买数量
	private String c_fkfs;//付款方式
	private String c_sltimg;//商品缩略图路径
	private String c_spxximg;//商品形象图路径
	private String c_spimg;//商品图片多个以“，”隔开，存路径
	private int c_sj;//是否上架 1 上架  2下架
	private String c_splbms;//商品列表描述
	private String c_spms;//商品描述(可存商品文字说明和图片说明的图片路径)
	private String c_spsxms;//商品属性描述
	
	private String c_zzfs;//种植方式
	private String c_xl;//系列
	private String c_pl;//配料
	private int c_djs;//点击数
	
	private String c_wxms;//微信描述
	
	
	public String getC_wxms() {
		return c_wxms;
	}
	public void setC_wxms(String c_wxms) {
		this.c_wxms = c_wxms;
	}
	public int getC_sj() {
		return c_sj;
	}
	public void setC_sj(int c_sj) {
		this.c_sj = c_sj;
	}
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_pp() {
		return c_pp;
	}
	public void setC_pp(String c_pp) {
		this.c_pp = c_pp;
	}
	public int getC_lx() {
		return c_lx;
	}
	public void setC_lx(int c_lx) {
		this.c_lx = c_lx;
	}
	public double getC_jg() {
		return c_jg;
	}
	public void setC_jg(double c_jg) {
		this.c_jg = c_jg;
	}
	public int getC_ck() {
		return c_ck;
	}
	public void setC_ck(int c_ck) {
		this.c_ck = c_ck;
	}
	public String getC_gg() {
		return c_gg;
	}
	public void setC_gg(String c_gg) {
		this.c_gg = c_gg;
	}
	public String getC_bZhun() {
		return c_bZhun;
	}
	public void setC_bZhun(String c_bZhun) {
		this.c_bZhun = c_bZhun;
	}
	public String getC_cd() {
		return c_cd;
	}
	public void setC_cd(String c_cd) {
		this.c_cd = c_cd;
	}
	
	public String getC_ccfs() {
		return c_ccfs;
	}
	public void setC_ccfs(String c_ccfs) {
		this.c_ccfs = c_ccfs;
	}
	public double getC_psjg() {
		return c_psjg;
	}
	public void setC_psjg(double c_psjg) {
		this.c_psjg = c_psjg;
	}
	public int getC_scbs() {
		return c_scbs;
	}
	public void setC_scbs(int c_scbs) {
		this.c_scbs = c_scbs;
	}
	public GYSInfo getGysInfo() {
		return gysInfo;
	}
	public void setGysInfo(GYSInfo gysInfo) {
		this.gysInfo = gysInfo;
	}
	public CommoditySort getCommoditySort() {
		return commoditySort;
	}
	public void setCommoditySort(CommoditySort commoditySort) {
		this.commoditySort = commoditySort;
	}
	public CommodityBrand getCommodityBrand() {
		return commodityBrand;
	}
	public void setCommodityBrand(CommodityBrand commodityBrand) {
		this.commodityBrand = commodityBrand;
	}
	public CommodityStatus getCommodityStatus() {
		return commodityStatus;
	}
	public void setCommodityStatus(CommodityStatus commodityStatus) {
		this.commodityStatus = commodityStatus;
	}
	public String getC_spbh() {
		return c_spbh;
	}
	public void setC_spbh(String c_spbh) {
		this.c_spbh = c_spbh;
	}
	public double getC_scjg() {
		return c_scjg;
	}
	public void setC_scjg(double c_scjg) {
		this.c_scjg = c_scjg;
	}
	public double getC_jhjg() {
		return c_jhjg;
	}
	public void setC_jhjg(double c_jhjg) {
		this.c_jhjg = c_jhjg;
	}
	public int getC_px() {
		return c_px;
	}
	public void setC_px(int c_px) {
		this.c_px = c_px;
	}
	public double getC_zl() {
		return c_zl;
	}
	public void setC_zl(double c_zl) {
		this.c_zl = c_zl;
	}
	public String getC_jldw() {
		return c_jldw;
	}
	public void setC_jldw(String c_jldw) {
		this.c_jldw = c_jldw;
	}
	public double getC_ckyj() {
		return c_ckyj;
	}
	public void setC_ckyj(double c_ckyj) {
		this.c_ckyj = c_ckyj;
	}
	public double getC_jf() {
		return c_jf;
	}
	public void setC_jf(double c_jf) {
		this.c_jf = c_jf;
	}
	public double getC_zxgmnum() {
		return c_zxgmnum;
	}
	public void setC_zxgmnum(double c_zxgmnum) {
		this.c_zxgmnum = c_zxgmnum;
	}
	public double getC_zxzdnum() {
		return c_zxzdnum;
	}
	public void setC_zxzdnum(double c_zxzdnum) {
		this.c_zxzdnum = c_zxzdnum;
	}
	public String getC_fkfs() {
		return c_fkfs;
	}
	public void setC_fkfs(String c_fkfs) {
		this.c_fkfs = c_fkfs;
	}
	public String getC_sltimg() {
		return c_sltimg;
	}
	public void setC_sltimg(String c_sltimg) {
		this.c_sltimg = c_sltimg;
	}
	@Column(name = "c_spms", length = 2555) 
	public String getC_spms() {
		return c_spms;
	}
	public void setC_spms(String c_spms) {
		this.c_spms = c_spms;
	}
	public String getC_splbms() {
		return c_splbms;
	}
	public void setC_splbms(String c_splbms) {
		this.c_splbms = c_splbms;
	}
    @Column(name = "c_spimg", length = 2555) 
	public String getC_spimg() {
		return c_spimg;
	}
	public void setC_spimg(String c_spimg) {
		this.c_spimg = c_spimg;
	}
	public String getC_zzfs() {
		return c_zzfs;
	}
	public void setC_zzfs(String c_zzfs) {
		this.c_zzfs = c_zzfs;
	}
	public String getC_xl() {
		return c_xl;
	}
	public void setC_xl(String c_xl) {
		this.c_xl = c_xl;
	}
	public String getC_pl() {
		return c_pl;
	}
	public void setC_pl(String c_pl) {
		this.c_pl = c_pl;
	}
	public String getC_dj() {
		return c_dj;
	}
	public void setC_dj(String c_dj) {
		this.c_dj = c_dj;
	}
	public int getC_bzq() {
		return c_bzq;
	}
	public void setC_bzq(int c_bzq) {
		this.c_bzq = c_bzq;
	}
	
	public int getC_djs() {
		return c_djs;
	}
	public void setC_djs(int c_djs) {
		this.c_djs = c_djs;
	}
	
	@Column(name = "c_spsxms", length = 2555) 
	public String getC_spsxms() {
		return c_spsxms;
	}
	public void setC_spsxms(String c_spsxms) {
		this.c_spsxms = c_spsxms;
	}
	public List<CommodityProperty> getCommodityPropertylist() {
		return commodityPropertylist;
	}
	public void setCommodityPropertylist(
			List<CommodityProperty> commodityPropertylist) {
		this.commodityPropertylist = commodityPropertylist;
	}
	public String getC_jdname() {
		return c_jdname;
	}
	public void setC_jdname(String c_jdname) {
		this.c_jdname = c_jdname;
	}
	public String getC_spxximg() {
		return c_spxximg;
	}
	public void setC_spxximg(String c_spxximg) {
		this.c_spxximg = c_spxximg;
	}
	public CommodityType getCommoditytype() {
		return commoditytype;
	}
	public void setCommoditytype(CommodityType commoditytype) {
		this.commoditytype = commoditytype;
	}
	
	
	
	
}
