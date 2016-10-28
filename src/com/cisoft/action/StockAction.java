package com.cisoft.action;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.Purchase;
import com.cisoft.model.PurchaseInfo;
import com.cisoft.model.PurchasePayments;
import com.cisoft.model.PurchaseReceipt;
import com.cisoft.model.Stock;
import com.cisoft.model.StockInventory;
import com.cisoft.model.Storeroom;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchasePaymentsService;
import com.cisoft.service.PurchaseReceiptService;
import com.cisoft.service.PurchaseService;
import com.cisoft.service.StockInventoryService;
import com.cisoft.service.StockService;
import com.cisoft.service.StoreroomService;
import com.opensymphony.xwork2.ModelDriven;

public class StockAction extends Pages<Stock> implements ModelDriven<Stock>{

	private Stock gys=new Stock();
	public Stock getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	StockService stockService;
	@Resource
	CommodityService commodityService;
	@Resource
	StoreroomService storeroomService;
	@Resource
	StockInventoryService stockInventoryService;
	@Resource
	PurchaseService purchaseService;
	@Resource
	PurchaseInfoService PurchaseInfoService;
	@Resource
	PurchasePaymentsService purchasepaymentsService;
	@Resource
	PurchaseReceiptService purchasereceiptService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(stockService.getList(gys));
		pageResponse.setTotal(stockService.getCount(gys));
		return "list";
	}		
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(gys.getSt_id()==0){
			gys.setS_date(new Date());
			gys.setUser(user);
			gys.setS_zt(1);
			gys.setS_scbs(1);
			result="添加成功";
		}else{
			gys.setUser(user);
			result="修改成功";
		}
		stockService.save(gys);
		
		//判断商品和库房 是否在库存盘点中存在
		StockInventory si=new StockInventory();
		si.setCommodity(gys.getCommodity());
		si.setStoreroom(gys.getStoreroom());
		si= stockInventoryService.findBycommdity(si);
		if(si!=null){
			si.setSi_smsl(si.getSi_smsl()+gys.getS_smsl());
		}else{
			si=new StockInventory();
			si.setCommodity(gys.getCommodity());
			si.setSi_bz(gys.getS_bz());
			si.setSi_date(gys.getS_date());
			si.setSi_scbs(1);
			si.setSi_smsl(gys.getS_smsl());
			si.setSi_zt(1);
			si.setStoreroom(gys.getStoreroom());
			si.setUser(user);
		}
		stockInventoryService.save(si);
		
		//更新商品数量
	  Commodity commodity=	commodityService.findById(gys.getCommodity());
	  commodity.setC_ck(si.getSi_smsl());
	  commodityService.save(commodity);

	  //添加采购单
	  Purchase p =addpurchase(gys);
	  //添加采购付款
	  addpurchasepayments(p);
	  //添加采购收货
	  addpurchasereceipt(p);
		return "save";
	}
	
	//添加采购订单
	private Purchase addpurchase(Stock stock){
	Commodity comm=	this.commodityService.findById(stock.getCommodity());
	Storeroom storeroom= this.storeroomService.findById(stock.getStoreroom());
		Purchase pu=new Purchase();
		pu.setP_cgDate(stock.getS_date());
		pu.setP_jhAddres(storeroom.getS_name());
		pu.setP_jhDate(new Date());
		pu.setP_ms("通过快速入库生成采购单");
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		pu.setP_no(s.format(new Date()));
		double price=Double.valueOf(pricestr)*stock.getS_smsl();
		pu.setP_price(price);
		pu.setP_scbs(1);
		pu.setP_username(stock.getUser().getU_name());
		pu.setP_ywusername(stock.getUser().getU_name());
		pu.setP_zdDate(new Date());
		pu.setP_zt(3);
		pu.setStoreroom(storeroom);
		purchaseService.save(pu);
		
		//添加采购详情
		PurchaseInfo pi=new PurchaseInfo();
		pi.setPi_scbs(1);
		pi.setPi_cgprice(Double.valueOf(pricestr));
		pi.setPi_num(stock.getS_smsl());
		pi.setPi_no(pu.getP_no());
		pi.setCommodity(comm);
		pi.setGysInfo(comm.getGysInfo());
		double pr=pi.getPi_cgprice()*pi.getPi_num();
	    pi.setPi_price(pr);
		this.PurchaseInfoService.save(pi);
		
		return pu;
	}
	
	//添加采购付款
	private void addpurchasepayments(Purchase p){
		PurchasePayments pp=new PurchasePayments();
		pp.setPp_fkdate(new Date());
		pp.setPp_bz("通过快速入库,添加付款记录");
		pp.setPp_no(p.getP_no());
		pp.setPp_scbs(1);
		pp.setPp_zflx(1);
		pp.setPp_sjfkje(p.getP_price());
		pp.setPp_dfje(p.getP_price());
		this.purchasepaymentsService.save(pp);
	}
	//添加采购收货
	private void addpurchasereceipt(Purchase p){
		PurchaseReceipt pr=new PurchaseReceipt();
		pr.setPr_shdate(new Date());
		pr.setPr_username(p.getP_username());
		pr.setPr_scbs(1);
		pr.setPr_bz("通过快速入库,添加收货记录");
		pr.setPr_no(p.getP_no());
		pr.setPr_shdate(new Date());
		this.purchasereceiptService.save(pr);
		
	}
	
	
	private String pricestr;
	
	

	public String getPricestr() {
		return pricestr;
	}

	public void setPricestr(String pricestr) {
		this.pricestr = pricestr;
	}

	public String addView(){
		select();
		return "addView";
	}
	public void select(){
		List<Commodity>  commList= commodityService.findlist();
		ServletActionContext.getContext().put("commodity", commList);
		List<Storeroom>  storerooms=storeroomService.findgyxlist();
		ServletActionContext.getContext().put("storeroom", storerooms);
		
	}
	public String editView(){
		select();
		gys=stockService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		stockService.save(gys);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		Stock Stock =stockService.findById(gys);
		Stock.setS_scbs(0);
		stockService.save(Stock);
		result="删除成功";
		return "delete";
	}
	
	
}
