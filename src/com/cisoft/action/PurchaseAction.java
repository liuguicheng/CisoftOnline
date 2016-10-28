package com.cisoft.action;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.GYSInfo;
import com.cisoft.model.Purchase;
import com.cisoft.model.PurchaseInfo;
import com.cisoft.model.Storeroom;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.GysService;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchaseService;
import com.cisoft.service.StoreroomService;
import com.opensymphony.xwork2.ModelDriven;

public class PurchaseAction extends Pages<Purchase> implements ModelDriven<Purchase>{

	private Purchase gys=new Purchase();
	public Purchase getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	private PurchaseInfo purchaseinfo;
	@Resource
	PurchaseService purchaseService;
	@Resource
	StoreroomService storeroomService;
	@Resource
	CommodityService commodityService;
	@Resource
	GysService gysService;
	@Resource
	PurchaseInfoService PurchaseInfoService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		selectinfo();
		pageResponse.setRows(purchaseService.getList(gys,xdstartime,xdendtime));
		pageResponse.setTotal(purchaseService.getCount(gys,xdstartime,xdendtime));
		return "list";
	}		
	
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(gys.getP_id()==0){
			gys.setP_scbs(1);
			gys.setP_zt(0);
			gys.setP_username(user.getU_name());
			result=gys.getP_no();
		}else{
			result=gys.getP_no();
		}
		purchaseService.save(gys);
		return "save";
	}
	
	public String addView(){
		select();
		return "addView";
	}
	
	public void select(){
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		gys=new Purchase();
		//编号
		gys.setP_no(s.format(new Date()));
		//日期
		gys.setP_zdDate(new Date());
		//库房
		List<Storeroom> srlist=storeroomService.findgyxlist();
		ServletActionContext.getContext().put("storeroom", srlist);
		
		//供应商
		List<GYSInfo> sygsinfo=gysService.findgyxlist();
		ServletActionContext.getContext().put("gyslist", sygsinfo);
		
		ServletActionContext.getContext().getValueStack().push(gys);
	}
	public String editView(){
		gys=purchaseService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	public String purchaseeditView(){
		purchaseinfo=new PurchaseInfo();
		purchaseinfo.setPi_id(Integer.parseInt(spbh));
		purchaseinfo=PurchaseInfoService.findById(purchaseinfo);
		ServletActionContext.getContext().getValueStack().push(purchaseinfo);
		return "purchaseeditView";
	}
	
	public void toupselect(){
		List<Storeroom> srlist=storeroomService.findgyxlist();
		ServletActionContext.getContext().put("storeroom", srlist);
		//供应商
		List<GYSInfo> sygsinfo=gysService.findgyxlist();
		ServletActionContext.getContext().put("gyslist", sygsinfo);
		
	}
	public String toupView(){
		Purchase purchase =purchaseService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(purchase);
		toupselect();
		return "toupView";
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
		Purchase purchase =purchaseService.findById(gys);
		purchase.setP_scbs(0);
		purchaseService.save(purchase);
		result="删除成功";
		return "delete";
	}
	private String spbh;
	private Commodity commodity;
	public String getSpbh() {
		return spbh;
	}

	public void setSpbh(String spbh) {
		this.spbh = spbh;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	//根据商品编号扫条码
	public String querycommodity(){
	commodity=	 commodityService.findBybh(spbh);
	return "querycommoditysuccess";
	}

	public PurchaseInfo getPurchaseinfo() {
		return purchaseinfo;
	}

	public void setPurchaseinfo(PurchaseInfo purchaseinfo) {
		this.purchaseinfo = purchaseinfo;
	}
	
	public String quyerstoreroom(){
		Storeroom st=new Storeroom();
		st.setS_id(Integer.parseInt(spbh));
		st= storeroomService.findById(st);
		result=st.getS_name();
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

	public String querylistcount(){
		 selectinfo();
		 int longcount=purchaseService.getCount(gys,xdstartime,xdendtime);
		 result=String.valueOf(longcount);
		 return "delete";
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
