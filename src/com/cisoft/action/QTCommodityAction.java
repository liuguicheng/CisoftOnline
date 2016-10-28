package com.cisoft.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommodityStatus;
import com.cisoft.service.CommodityBrandService;
import com.cisoft.service.CommodityImgService;
import com.cisoft.service.CommodityService;
import com.cisoft.service.CommoditySortService;
import com.cisoft.service.CommodityStatusService;
import com.cisoft.service.GysService;
import com.opensymphony.xwork2.ModelDriven;

public class QTCommodityAction extends Pages<Commodity> implements
		ModelDriven<Commodity> {
	private Commodity commodity = new Commodity();
	private String g_id;

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public Commodity getModel() {
		// TODO Auto-generated method stub
		return commodity;
	}

	@Resource
	CommodityService commodityService;
	@Resource
	CommodityBrandService commoditybrandService;
	@Resource
	CommodityImgService commodityImgService;
	@Resource
	CommoditySortService commoditysortService;
	@Resource
	CommodityStatusService commoditystatusService;
	@Resource
	GysService gysService;
	private String result = "";

	public String getResult() {
		return result;
	}

   private String sortid;
   
	public String getSortid() {
	return sortid;
}

public void setSortid(String sortid) {
	this.sortid = sortid;
}

	/**
	 * 前台获取商品列表
	 */
	public String querycommdityList() {
		commodity.setC_sj(1);
		List<Commodity> commoditylist = this.commodityService
				.getLists(commodity);
		if(commodity.getCommoditySort()!=null){
			this.sortid=String.valueOf(commodity.getCommoditySort().getCs_id());
		}
		
		ServletActionContext.getContext().put("commditylist", commoditylist);
		
		//获取商品品牌
		commodityBrandlist=commoditybrandService.findbrandlist();
		/**
		 * 热销商品
		 */
		queryrxcommodity();
		
		return "commditylist";
	}
	
	private List<CommodityBrand> commodityBrandlist;
	
	
	
	public List<CommodityBrand> getCommodityBrandlist() {
		return commodityBrandlist;
	}

	public void setCommodityBrandlist(List<CommodityBrand> commodityBrandlist) {
		this.commodityBrandlist = commodityBrandlist;
	}

	private List<Commodity> commodities;
	
	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	/**
	 * 前台获取商品列表
	 */
	public String querycommdityListajax() {
		commodity.setC_sj(1);
		commodities = this.commodityService
				.getLists(commodity);
		return "querycommdityListajax";
	}

	/**
	 * 商品详情
	 */
	public String querycommodityinfo() {
		commodity = this.commodityService.findById(commodity);
		if (commodity.getC_id() != 0) {
			//记录点击数
			commodity.setC_djs(commodity.getC_djs()+1);
			this.commodityService.save(commodity);
			ServletActionContext.getContext().getValueStack().push(commodity);
			if (!commodity.getC_spimg().equals("")) {
				String[] imgliststr = commodity.getC_spimg().split(",");
				List<String> imglist = new ArrayList<String>();
				for (int i = 0; i < imgliststr.length; i++) {
					imglist.add(imgliststr[i]);
				}
				ServletActionContext.getContext().put("imglist", imglist);
			}
		}
		/**
		 * 热销商品
		 */
		queryrxcommodity();
		

		return "commodityinfo_1";
	}
	/**
	 * 热销商品
	 */
	private void queryrxcommodity(){
		/**
		 * 热销产品
		 * @return
		 */
		Commodity commodityrx=new Commodity();
		commodityrx.setC_sj(1);
		commodityrx.setC_scbs(1);
		CommodityStatus cs=new CommodityStatus();
		cs.setCs_id(5);
		commodityrx.setCommodityStatus(cs);
		commodities = this.commodityService
				.getLists(commodityrx);
	}

	/**
	 * 商品详细页面 测试
	 */
	public String commodityinfo_new(){
		commodity = this.commodityService.findById(commodity);
		if (commodity.getC_id() != 0) {
			//记录点击数
			commodity.setC_djs(commodity.getC_djs()+1);
			this.commodityService.save(commodity);
			ServletActionContext.getContext().getValueStack().push(commodity);
			if (!commodity.getC_spimg().equals("")) {
				String[] imgliststr = commodity.getC_spimg().split(",");
				List<String> imglist = new ArrayList<String>();
				for (int i = 0; i < imgliststr.length; i++) {
					imglist.add(imgliststr[i]);
				}
				ServletActionContext.getContext().put("imglist", imglist);
			}
		}
		queryrxcommodity();
		return "commodityinfo_new";
	}
	
	/**
	 * 热销产品
	 * @return
	 */
	public String houtcommodity(){
		commodity=new Commodity();
		commodity.setC_sj(1);
		commodity.setC_scbs(1);
		CommodityStatus cs=new CommodityStatus();
		cs.setCs_id(5);
		commodity.setCommodityStatus(cs);
		commodities = this.commodityService
				.getLists(commodity);
		return "querycommdityListajax";
	}
	
	
}
