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
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.UserService;

public class wxOrdersAction  {
	private Orders orders;
	@Resource
	OrdersService ordersService;
	@Resource
	CommodityService commodityService;
	@Resource
	OrdersRecordService ordersrecordService;
	@Resource
	OrdersCommodityDetailsService ocdetailsService;
	@Resource
	private UserService userService;
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
	private List<Orders> orderlist;
	List<List<OrdersCommodityDetails>> ocd;
	public List<Orders> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Orders> orderlist) {
		this.orderlist = orderlist;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	 private String cdbs;//判断惨淡标识
	    
	    
		public String getCdbs() {
			return cdbs;
		}

		public void setCdbs(String cdbs) {
			this.cdbs = cdbs;
		}
	    private String bsid;
	    
		public String getBsid() {
			return bsid;
		}

		public void setBsid(String bsid) {
			this.bsid=bsid;
		}
		/**
		 * 	
		 * @return
		 */
	public String getList(){
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		if(user!=null){
			orders=new Orders();
			orders.setUser(user);
			orders.setO_status(-1);	
			 orderlist=this.ordersService.findorders(orders);
			// 查询订单商品明细
			if(orderlist.size()>0){
				ocd=new ArrayList<List<OrdersCommodityDetails>>();
	 		for(int i=0;i<orderlist.size();i++){
	 			orders=orderlist.get(i);
				OrdersCommodityDetails ordetail=new OrdersCommodityDetails();
				ordetail.setOrder(orders);
				ocdetails=this.ocdetailsService.findOrdersCommodityDetails(ordetail);
				ocd.add(ocdetails);
			}
			}
		}else{
			if(bsid!=null){
				//验证是否登录
				List<User> users=userService.findBywxbs(bsid.toLowerCase().trim());
				if(users.size()>0){
					ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
				}else{
					 user=new User();
					user.setUwx_bs(bsid.toLowerCase().trim());
					user.setU_scbs(1);
					user.setUwx_gzbs(0);
					userService.save(user);
					ServletActionContext.getRequest().getSession().setAttribute("usersession",user);
				}
				return "returnlist";
				
			}else{
			cdbs ="2";
			return "wxlist";
			}
		}
		return "list";
	}		
	
	public List<List<OrdersCommodityDetails>> getOcd() {
		return ocd;
	}

	public void setOcd(List<List<OrdersCommodityDetails>> ocd) {
		this.ocd = ocd;
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
		orders.setO_sort(2);
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
	
	
	
	
	List<OrdersCommodityDetails> ocdetails;
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
		return "qtorderinfo";
		}else{
			return "noqtlogin";
		}
		
	}
	
	//修改信息
		public String updatepwd(){
			Orders Ordersinfo =ordersService.findById(orders);
			Ordersinfo.setO_status(orders.getO_status());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowdate=sdf.format(new Date());
			Ordersinfo.setO_endTime(nowdate);
			ordersService.save(Ordersinfo);
			addorderrecord(Ordersinfo,orders.getO_status());
			result="修改成功";
			return "updatepwd";
		}
		
		/**
		 * 确认收货
		 */
		public String doqrsh(){
			Orders Ordersinfo =ordersService.findById(orders);
			Ordersinfo.setO_status(orders.getO_status());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowdate=sdf.format(new Date());
			Ordersinfo.setShtime(nowdate);
			Ordersinfo.setO_endTime(nowdate);
			ordersService.save(Ordersinfo);
			addorderrecord(Ordersinfo,orders.getO_status());
			result="1";
			return "updatepwd";
		}
}
