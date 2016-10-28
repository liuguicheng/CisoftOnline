package com.cisoft.action;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.OutStock;
import com.cisoft.model.Purchase;
import com.cisoft.model.PurchaseInfo;
import com.cisoft.model.PurchaseReturn;
import com.cisoft.model.Stock;
import com.cisoft.model.StockInventory;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OutStockService;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchaseReturnService;
import com.cisoft.service.PurchaseService;
import com.cisoft.service.StockInventoryService;
import com.cisoft.service.StockService;
import com.opensymphony.xwork2.ModelDriven;

public class PurchasereturnAction extends Pages<PurchaseReturn> implements ModelDriven<PurchaseReturn>{

	private PurchaseReturn gys=new PurchaseReturn();
	public PurchaseReturn getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	PurchaseReturnService purchasereturnService;
	@Resource
	StockInventoryService stockInventoryService;
	@Resource
	PurchaseInfoService PurchaseInfoService;
	@Resource
	PurchaseService purchaseService;
	@Resource
	CommodityService commodityService;
	@Resource
	OutStockService outstockService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		selectinfo();
		pageResponse.setRows(purchasereturnService.getList(gys,this.xdstartime,this.xdendtime));
		pageResponse.setTotal(purchasereturnService.getCount(gys,this.xdstartime,this.xdendtime));
		return "list";
	}		
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(gys.getPr_id()==0){
			gys.setPr_scbs(1);
			gys.setPr_shdate(new Date());
			gys.setPr_username(user.getU_name());
			result="添加成功";
		}else{
			result="修改成功";
		}
		purchasereturnService.save(gys);
		//商品出库（退货）
		addcommodityaddstock();
		//修改采购单状态
		uppurchase(gys.getPr_no());
		return "save";
	}
	//修改采购单状态
			private void uppurchase(String gys){
				Purchase purchase= purchaseService.findbyno(gys);
				purchase.setP_zt(4);
				this.purchaseService.save(purchase);
			}
	
	//商品出库（退货）
		private void addcommodityaddstock(){
			User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
			//1.获取采购订单商品列表
			
			Purchase purchase=purchaseService.findbyno(gys.getPr_no());
			List<PurchaseInfo> pinfolist=PurchaseInfoService.findbyno(gys.getPr_no());
			if(purchase!=null&&pinfolist.size()>0){
				for(int i=0;i<pinfolist.size();i++){
					PurchaseInfo pinf=pinfolist.get(i);
					//添加出库记录
					OutStock outstock=new OutStock();
					outstock.setCommodity(pinf.getCommodity());
					outstock.setOs_ckdate(new Date());
					outstock.setOs_ckno(pinf.getPi_no());
					outstock.setOs_zt(1);
					outstock.setOs_cksl(pinf.getPi_num());
					outstock.setOs_price(pinf.getPi_price());
					outstock.setOs_scbs(1);
					outstock.setOs_cklx(4);
					outstock.setStoreroom(purchase.getStoreroom());
					outstock.setUser(user);
					outstockService.save(outstock);
					//3.修改商品库存
					//判断商品和库房 是否在库存盘点中存在
					StockInventory si=new StockInventory();
					si.setCommodity(pinf.getCommodity());
					si.setStoreroom(purchase.getStoreroom());
					si= stockInventoryService.findBycommdity(si);
					if(si!=null){
						si.setSi_smsl(si.getSi_smsl()-pinf.getPi_num());
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
					  commodity.setC_ck(si.getSi_smsl());
					  commodityService.save(commodity);

				}
			}
		}
	
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=purchasereturnService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		PurchaseReturn PurchaseReturn =purchasereturnService.findById(gys);
		PurchaseReturn.setPr_scbs(0);
		purchasereturnService.save(PurchaseReturn);
		result="删除成功";
		return "delete";
	}
	
	
	/**
	 * 数量统计
	 */
	public String querylistcount(){
		 selectinfo();
		 int longcount=purchasereturnService.getCount(gys,xdstartime,xdendtime);
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
