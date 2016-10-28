package com.cisoft.action;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Purchase;
import com.cisoft.model.PurchaseInfo;
import com.cisoft.model.PurchasePayments;
import com.cisoft.service.PurchaseInfoService;
import com.cisoft.service.PurchasePaymentsService;
import com.cisoft.service.PurchaseService;
import com.opensymphony.xwork2.ModelDriven;

public class PurchasePaymentsAction extends Pages<PurchasePayments> implements ModelDriven<PurchasePayments>{

	private PurchasePayments gys=new PurchasePayments();
	public PurchasePayments getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	PurchasePaymentsService purchasepaymentsService;
	@Resource
	PurchaseService purchaseService;
	@Resource
	PurchaseInfoService PurchaseInfoService;
	
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		selectinfo();
		pageResponse.setRows(purchasepaymentsService.getList(gys,xdstartime,xdendtime));
		pageResponse.setTotal(purchasepaymentsService.getCount(gys,xdstartime,xdendtime));
		return "list";
	}		
	
	public String save(){
		try{
		if(gys.getPp_id()==0){
			gys.setPp_fkdate(new Date());
			gys.setPp_scbs(1);
			
			result="添加成功";
		}else{
			result="修改成功";
		}
		purchasepaymentsService.save(gys);
		uppurchase(gys);
		}catch(Exception e){
			
		}
		return "save";
	}
	//修改采购单状态
	private void uppurchase(PurchasePayments gys){
		Purchase purchase= purchaseService.findbyno(gys.getPp_no());
		purchase.setP_zt(2);
		this.purchaseService.save(purchase);
	}
	public String addView(){
		select();
		return "addView";
	}
	//根据采购单查询
	private void select(){
		List<PurchaseInfo> pinfo=PurchaseInfoService.findbyno(p_no);
		double num=0;
		if(pinfo.size()>0){
			for(int i=0;i<pinfo.size();i++){
				PurchaseInfo p=pinfo.get(i);
				num+=p.getPi_price();
			}
			
		}
		if(num==0){
			gys=new PurchasePayments();
		}else{
			gys.setPp_no(p_no);
			gys.setPp_dfje(num);
		}
		
	}
	public String editView(){
		gys=purchasepaymentsService.findById(gys);
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
		PurchasePayments PurchasePayments =purchasepaymentsService.findById(gys);
		PurchasePayments.setPp_scbs(0);
		purchasepaymentsService.save(PurchasePayments);
		result="删除成功";
		return "delete";
	}
	
	private  String p_no;
	
	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	//查询采购信息
	public String querypurchase(){
		select();
		return "delete";
	}
	
	/**
	 * 获取数量
	 * @return
	 */
	public String querylistcount(){
		selectinfo();
		int longcount=this.purchasepaymentsService.getCount(gys,xdstartime,xdendtime);
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
