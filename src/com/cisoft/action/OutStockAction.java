package com.cisoft.action;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.OutStock;
import com.cisoft.model.StockInventory;
import com.cisoft.model.Storeroom;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OutStockService;
import com.cisoft.service.StockInventoryService;
import com.cisoft.service.StoreroomService;
import com.opensymphony.xwork2.ModelDriven;

public class OutStockAction extends Pages<OutStock> implements ModelDriven<OutStock>{

	private OutStock gys=new OutStock();
	public OutStock getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	OutStockService outstockService;
	@Resource
	CommodityService commodityService;
	@Resource
	StoreroomService storeroomService;
	@Resource
	StockInventoryService stockInventoryService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(outstockService.getList(gys));
		pageResponse.setTotal(outstockService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(gys.getOs_id()==0){
			gys.setOs_scbs(1);
			gys.setUser(user);
			gys.setOs_ckdate(new Date());
			gys.setOs_zt(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		outstockService.save(gys);
		
		//判断商品和库房 是否在库存盘点中存在
				StockInventory si=new StockInventory();
				si.setCommodity(gys.getCommodity());
				si.setStoreroom(gys.getStoreroom());
				si= stockInventoryService.findBycommdity(si);
				if(si!=null){
					si.setSi_smsl(si.getSi_smsl()-gys.getOs_cksl());
					si.setSi_lastckdate(gys.getOs_ckdate());
				}else{
					si=new StockInventory();
					si.setCommodity(gys.getCommodity());
					si.setSi_bz(gys.getOs_bz());
					si.setSi_lastckdate(gys.getOs_ckdate());
					si.setSi_scbs(1);
					si.setSi_smsl(gys.getOs_cksl());
					si.setSi_zt(1);
					si.setStoreroom(gys.getStoreroom());
					si.setUser(gys.getUser());
				}
				stockInventoryService.save(si);
		
				//更新商品数量
				  Commodity commodity=	commodityService.findById(gys.getCommodity());
				  commodity.setC_ck(si.getSi_smsl());
				  commodityService.save(commodity);
				
		return "save";
	}
	
	public String addView(){
		select();
		return "addView";
	}
	public String editView(){
		select();
		gys=outstockService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	public void select(){
		List<Commodity>  commList= commodityService.findlist();
		ServletActionContext.getContext().put("commodity", commList);
		List<Storeroom>  storerooms=storeroomService.findgyxlist();
		ServletActionContext.getContext().put("storeroom", storerooms);
		
	}
	//修改信息
	public String updatepwd(){
		outstockService.save(gys);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		OutStock OutStock =outstockService.findById(gys);
		OutStock.setOs_scbs(0);
		outstockService.save(OutStock);
		result="删除成功";
		return "delete";
	}
	
	
}
