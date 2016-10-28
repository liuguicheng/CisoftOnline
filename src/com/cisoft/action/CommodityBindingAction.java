package com.cisoft.action;


import java.util.List;

import javax.annotation.Resource;


import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityBinding;
import com.cisoft.service.CommodityBindingService;
import com.cisoft.service.CommodityService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品品牌
 * @author lgc
 *
 */
public class CommodityBindingAction extends Pages<CommodityBinding> implements ModelDriven<CommodityBinding>{

	private CommodityBinding commodityBinding=new CommodityBinding();
	public CommodityBinding getModel() {
		// TODO Auto-generated method stub
		return commodityBinding;
	}
	@Resource
	CommodityBindingService commodityBindingService;
	@Resource
	CommodityService commodityService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commodityBindingService.getList(commodityBinding));
		pageResponse.setTotal(commodityBindingService.getCount(commodityBinding));
		return "list";
	}		
	
	
	
	private List<CommodityBinding> cbdlist;
	private Commodity commodity;
	private List<Commodity> commodities;
	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public CommodityBinding getCommodityBinding() {
		return commodityBinding;
	}

	public void setCommodityBinding(CommodityBinding commodityBinding) {
		this.commodityBinding = commodityBinding;
	}

	public List<CommodityBinding> getCbdlist() {
		return cbdlist;
	}

	public void setCbdlist(List<CommodityBinding> cbdlist) {
		this.cbdlist = cbdlist;
	}

	
	
	/**
	 * 跳转添加绑定商品
	 */
	public String toAddCommodityBindingPage(){
		commodity=new Commodity();		
		commodity.setC_sj(1);
		this.commodities=this.commodityService.findlist(commodity);
		return "toAddCommodityBindingPage";
	}
	
	/**
	 * 添加／修改绑定商品
	 */
	
	public String addCommodityBinding(){
		try{
		commodityBinding.setCb_scbs(1);
		commodityBinding.setCb_lx(1);
		this.commodityBindingService.save(commodityBinding);
		result="操作成功";
		}catch(Exception e){
			System.out.println(e.getMessage());
			result="操作失败";
		}
		return "save";
	}
	
	public void setResult(String result) {
		this.result = result;
	}

	public String delete(){
		if(result!=null&&!"".equals(result)){
		     
			String[] a=result.split(",");
			int j=0;
			if(a.length>0){
				for (int i = 0; i < a.length; i++) {
					CommodityBinding commodityinfo=new CommodityBinding();
					commodityinfo.setCb_id(Integer.parseInt(a[i]));

					commodityinfo = commodityBindingService.findById(commodityinfo);
					commodityinfo.setCb_scbs(0);
					commodityBindingService.save(commodityinfo);
					 j++;
				}
			if(a.length==j){
				result = "删除成功";
				return "save";
			}
			}
			}
			
			CommodityBinding commodityinfo = commodityBindingService.findById(commodityBinding);
			commodityinfo.setCb_scbs(0);
			commodityBindingService.save(commodityinfo);
			result = "删除成功";
			return "save";
	}
	
}