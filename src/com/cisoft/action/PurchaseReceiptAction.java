package com.cisoft.action;


import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchaseReceiptService;
import com.cisoft.service.PurchaseService;
import com.cisoft.service.StockInventoryService;
import com.cisoft.service.StockService;
import com.opensymphony.xwork2.ModelDriven;

public class PurchaseReceiptAction extends Pages<PurchaseReceipt> implements ModelDriven<PurchaseReceipt>{

	private PurchaseReceipt gys=new PurchaseReceipt();
	public PurchaseReceipt getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	PurchaseReceiptService purchasereceiptService;
	@Resource
	StockService stockService;
	@Resource
	StockInventoryService stockInventoryService;
	@Resource
	PurchaseInfoService PurchaseInfoService;
	@Resource
	PurchaseService purchaseService;
	@Resource
	CommodityService commodityService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		selectinfo();
		pageResponse.setRows(purchasereceiptService.getList(gys,xdstartime,xdendtime));
		pageResponse.setTotal(purchasereceiptService.getCount(gys,xdstartime,xdendtime));
		return "list";
	}		
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(gys.getPr_id()==0){
			gys.setPr_shdate(new Date());
			gys.setPr_username(user.getU_name());
			gys.setPr_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		purchasereceiptService.save(gys);
		//商品入库
		addcommodityaddstock();
		//修改采购单状态
		uppurchase(gys.getPr_no());
		return "save";
	}
	
	//修改采购单状态
		private void uppurchase(String gys){
			Purchase purchase= purchaseService.findbyno(gys);
			purchase.setP_zt(3);
			this.purchaseService.save(purchase);
		}
	//商品入库
	private void addcommodityaddstock(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		//1.获取采购订单商品列表
		
		Purchase purchase=purchaseService.findbyno(gys.getPr_no());
		List<PurchaseInfo> pinfolist=PurchaseInfoService.findbyno(gys.getPr_no());
		if(purchase!=null&&pinfolist.size()>0){
			for(int i=0;i<pinfolist.size();i++){
				PurchaseInfo pinf=pinfolist.get(i);
				//添加入库记录
				Stock stock=new Stock();
				stock.setCommodity(pinf.getCommodity());
				stock.setS_date(new Date());
				stock.setS_no(gys.getPr_no());
				stock.setS_scbs(1);
				stock.setS_smsl(pinf.getPi_num());
				stock.setS_zt(1);
				stock.setS_rklx(4);
				stock.setStoreroom(purchase.getStoreroom());
				stock.setUser(user);
				this.stockService.save(stock);
				//3.修改商品库存
				//判断商品和库房 是否在库存盘点中存在
				StockInventory si=new StockInventory();
				si.setCommodity(pinf.getCommodity());
				si.setStoreroom(purchase.getStoreroom());
				si= stockInventoryService.findBycommdity(si);
				if(si!=null){
					si.setSi_smsl(si.getSi_smsl()+pinf.getPi_num());
				}else{
					si=new StockInventory();
					si.setCommodity(pinf.getCommodity());
					si.setSi_date(new Date());
					si.setSi_scbs(1);
					si.setSi_smsl(pinf.getPi_num());
					si.setSi_zt(1);
					si.setStoreroom(purchase.getStoreroom());
					si.setUser(user);
				}
				stockInventoryService.save(si);
				
				//4.修改商品信息库存
				  Commodity commodity=	commodityService.findById(pinf.getCommodity());
				  System.out.println(si.getSi_smsl());
				  commodity.setC_ck(si.getSi_smsl()+commodity.getC_ck());
				  commodityService.save(commodity);

			}
		}
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=purchasereceiptService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		PurchaseReceipt PurchaseReceipt =purchasereceiptService.findById(gys);
		PurchaseReceipt.setPr_scbs(0);
		purchasereceiptService.save(PurchaseReceipt);
		result="删除成功";
		return "delete";
	}
	/**
	 * 数量统计
	 */
	public String querylistcount(){
		 selectinfo();
		 int longcount=purchasereceiptService.getCount(gys,xdstartime,xdendtime);
		 result=String.valueOf(longcount);
		 return "delete";
	}
	private String xdstartime;//采购下单开始时间
    private String xdendtime;//采购下单结束时间
    private String kddh;//标示
	//获取统计数据数量
	public String getXdstartime() {
		return xdstartime;
	}

	public void setXdstartime(String xdstartime) {
		this.xdstartime = xdstartime;
	}

	public String getXdendtime() {
		return xdendtime;
	}

	public void setXdendtime(String xdendtime) {
		this.xdendtime = xdendtime;
	}

	
	public String getKddh() {
		return kddh;
	}

	public void setKddh(String kddh) {
		this.kddh = kddh;
	}

	private void selectinfo(){
		if(kddh!=null){
			if(!"".equals(kddh)){
				if("3y".equals(kddh)){
					//近三个月前
					kddh="";
				      Date date = new Date();//当前日期
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
					  Calendar calendar = Calendar.getInstance();//日历对象
					  calendar.setTime(date);//设置当前日期
					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String newdate=sdf.format(calendar.getTime());
					  calendar.add(Calendar.MONTH, -3);//月份减一
					  calendar.add(Calendar.DAY_OF_MONTH, -1);//天数加一
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  System.out.println(ytime);
					xdstartime=ytime;
					xdendtime=newdate;
				}else if("-3y".equals(kddh)){
					//三个月前
					kddh="";
					 Date date = new Date();//当前日期
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
					  Calendar calendar = Calendar.getInstance();//日历对象
					  calendar.setTime(date);//设置当前日期
					  calendar.add(Calendar.MONTH, -3);//月份减一
//					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  System.out.println(ytime);
					xdstartime="";
					xdendtime=ytime;
				}else if("0".equals(kddh)){
					//当天  （今日）
					kddh="";
				      Date date = new Date();//当前日期
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
					  Calendar calendar = Calendar.getInstance();//日历对象
					  calendar.setTime(date);//设置当前日期
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String newdate=sdf.format(calendar.getTime());
					  System.out.println(ytime+" "+newdate);
					xdstartime=ytime;
					xdendtime=newdate;
				}
			}
		}
		
	}
	
}
