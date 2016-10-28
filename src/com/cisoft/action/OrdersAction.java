package com.cisoft.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Order;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.PagerModel;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.utils.ExpertSelectException;
import com.opensymphony.xwork2.ModelDriven;

public class OrdersAction  extends Pages<Orders> implements ModelDriven<Orders>{
	private Orders orders=new Orders();
	public Orders getModel() {
		
		// TODO Auto-generated method stub
		return orders;
	}
	@Resource
	OrdersService ordersService;
	@Resource
	CommodityService commodityService;
	@Resource
	OrdersRecordService ordersrecordService;
	@Resource
	OrdersCommodityDetailsService ocdetailsService;
//	private Commodity commodityss;
	
    
//	public Commodity getCommodityss() {
//		return commodityss;
//	}
//	
//	public void setCommodityss(Commodity commodityss) {
//		this.commodityss = commodityss;
//	}
	private String result="";
	public String getResult() {
		return result;
	}
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getList(){
		if(!id.equals("-1")){
		orders.setO_status(Integer.parseInt(id));
		}else{
			orders.setO_status(-1);	
		}
		pageResponse.setRows(ordersService.getList(orders));
		pageResponse.setTotal(ordersService.getCount(orders));
		return "list";
	}		
	
	public String save(){
		if(orders.getO_id()==0){
			scorder();
			
			result="添加成功";
		}else{
			result="修改成功";
		}
		ordersService.save(orders);
		//添加订单流程记录
		addorderrecord(orders,6);
		return "save";
	}
	
	public String addView(){
		selectcommodity();
		return "addView";
	}
	//生成订单编号
	private  void scorder(){
		
//		java.util.Date now=new java.util.Date();
//		String numid = String.valueOf(now.getTime());
//		orders.setO_bh(numid);
		orders.setO_scbs(1);
		orders.setO_sort(1);
		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orders.setO_startTime(s.format(new Date()));
		orders.setO_status(6);
		//获取用户信息
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		orders.setUser(user);
		
		//获取商品信息
		Commodity commodityss=commodityService.findById(null);
//		orders.setO_spjg(commodityss.getC_jg());
//		orders.setO_spname(commodityss.getC_name());
//		orders.setO_yf(commodityss.getC_psjg());
		
		//获取供应商信息
//		orders.setO_ghsdh(commodityss.getGysInfo().getG_dh());
//		orders.setO_ghslxr(commodityss.getGysInfo().getG_lxr());
//		orders.setO_ghsname(commodityss.getGysInfo().getG_name());
		
		//计算总价
//		double jg=commodityss.getC_jg()*orders.getO_spnum();//商品价格
		//邮费计算
//		double yf=0;
		//计算重量
//		double zzl=commodityss.getC_gg()*orders.getO_spnum()*1000;
		//转换公斤
////		double zgj=zzl/1000;
//		if(zgj<2){
//			yf=5;
//		}else{
//			 yf=(zgj-2.0)+5;
//		}
//		double zjg=jg+yf;
//		orders.setO_zjg(jg);
		
	}
	
    //添加订单操作记录
	private void addorderrecord(Orders order,int step){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		OrdersRecord orecord=new OrdersRecord();
		orecord.setOr_scbs(1);
		orecord.setOr_step(step);
		orecord.setOr_szsj(new Date());
		orecord.setOrders(order);
		orecord.setUser(user);
		orecord.setOr_czr(user.getU_zsName());
		ordersrecordService.save(orecord);
	}
	//获取商品信息
	public String querycommodity(){
//		 commodityss=commodityService.findById(orders.getCommodity());
		return "success";
	}
	
	public void selectcommodity(){
		Commodity comm=new Commodity();
	  List<Commodity> commoditys=	commodityService.getLists(comm);
		ServletActionContext.getContext().put("commoditys", commoditys);
	}
	private String fhtime;
	private String shtime;
	private String shrname;
	
	public String getShrname() {
		return shrname;
	}

	public void setShrname(String shrname) {
		this.shrname = shrname;
	}

	public String getFhtime() {
		return fhtime;
	}

	public void setFhtime(String fhtime) {
		this.fhtime = fhtime;
	}

	public String getShtime() {
		return shtime;
	}

	public void setShtime(String shtime) {
		this.shtime = shtime;
	}



	public String editView(){
		Orders o=ordersService.findById(orders);
		   ServletActionContext.getContext().getValueStack().pop();
		ServletActionContext.getContext().getValueStack().push(o);
		OrdersRecord or=new OrdersRecord();
		or.setOrders(o);
		or.setOr_step(1);
		OrdersRecord ors=ordersrecordService.findById(or);
		if(ors!=null){
		fhtime=ors.getOr_szsj().toString().replace(".0", " ");
		}
		or.setOrders(o);
		or.setOr_step(2);
		ors=ordersrecordService.findById(or);
		if(ors!=null){
		shtime=ors.getOr_szsj().toString().replace(".0", " ");
		shrname=ors.getUser().getU_zsName();
		}
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		Orders Ordersinfo =ordersService.findById(orders);
		Ordersinfo.setO_status(orders.getO_status());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(orders.getO_status()==3){
			//订单结束
			
			Ordersinfo.setO_endTime(sdf.format(new Date()));
		}
		if(orders.getO_status()==2){
			//确认收货
			Ordersinfo.setShtime(sdf.format(new Date()));
		}
		
		ordersService.save(Ordersinfo);
		//添加操作步骤
		addorderrecord(Ordersinfo,orders.getO_status());
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		Orders Ordersinfo =ordersService.findById(orders);
		//添加订单流程记录
		addorderrecord(Ordersinfo,7);
		Ordersinfo.setO_scbs(0);
		ordersService.save(Ordersinfo);
		
		result="删除成功";
		return "delete";
	}
	
	/**
	 * 跳转结算页面
	 */
	public String tojspage(){
		orders=new Orders();
		orders.setO_id(Integer.parseInt(id));
		orders =ordersService.findById(orders);
		ServletActionContext.getContext().put("order", orders);
		return "tojspage";
	}
	
	
	/**
	 * 我的订单（用户订单）前台页面调用
	 */
	public String qtorders(){
		Orders	order=new Orders();
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		order.setUser(user);
		order.setO_status(6);
//		List<Orders> orderlist=this.ordersService.findorders(order);
	      PagerModel pm=new PagerModel();
	      if( ServletActionContext.getRequest().getParameter("pager.offset")!=null)  {
	    	  pm.setOffset(Integer.parseInt( ServletActionContext.getRequest().getParameter("pager.offset")));
	      }
		 pm=ordersService.findAllOrders(order,pm.getOffset(), pm.getPagesize());
		
//		ServletActionContext.getContext().put("orderlist", orderlist);
		ServletActionContext.getContext().put("pm",pm);
		
		// 查询订单商品明细
		if(pm.getDatas().size()>0){
//			HashMap<String, List<OrdersCommodityDetails>> ormap=new HashMap<String,List<OrdersCommodityDetails>>();
			List<List<OrdersCommodityDetails>> ocd=new ArrayList<List<OrdersCommodityDetails>>();
 		for(int i=0;i<pm.getDatas().size();i++){
			order=(Orders) pm.getDatas().get(i);
			OrdersCommodityDetails ordetail=new OrdersCommodityDetails();
			ordetail.setOrder(order);
			ocdetails=this.ocdetailsService.findOrdersCommodityDetails(ordetail);
//			ormap.put(String.valueOf(order.getO_id()),ocdetails);
			ocd.add(ocdetails);
		}
		ServletActionContext.getContext().put("ordlist", ocd);
		}
		
		return "qtorders_v1";
	}
	
	List<OrdersCommodityDetails> ocdetails;
	
	/**
	 * 查询订单商品明细
	 */
	public String queryOrderCommodityDetail(){
		OrdersCommodityDetails ordetail=new OrdersCommodityDetails();
		ordetail.setOrder(orders);
		ocdetails=this.ocdetailsService.findOrdersCommodityDetails(ordetail);
		return "queryOrderCommodityDetail";
	}
	public List<OrdersCommodityDetails> getOcdetails() {
		return ocdetails;
	}

	public void setOcdetails(List<OrdersCommodityDetails> ocdetails) {
		this.ocdetails = ocdetails;
	}

	/**
	 * 订单详情 （前台调用）
	 */
	public String qtorderinfo(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(user!=null){
		Orders orderinfo=this.ordersService.findById(orders);
		ServletActionContext.getContext().getValueStack().push(orderinfo);
		OrdersCommodityDetails ordetail=new OrdersCommodityDetails();
		ordetail.setOrder(orderinfo);
		ocdetails=this.ocdetailsService.findOrdersCommodityDetails(ordetail);
		ServletActionContext.getContext().put("ocdetaillist", ocdetails);
		return "qtorderinfo_1";
	}else{
		return "noqtlogin";
	}
	
	}
}
