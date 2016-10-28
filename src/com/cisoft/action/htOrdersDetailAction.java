package com.cisoft.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.OutStock;
import com.cisoft.model.PaymentRecords;
import com.cisoft.model.StockInventory;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.OutStockService;
import com.cisoft.service.PaymentrecordsService;
import com.opensymphony.xwork2.ModelDriven;

public class htOrdersDetailAction  extends Pages<OrdersCommodityDetails> implements ModelDriven<OrdersCommodityDetails>{
	private OrdersCommodityDetails orders=new OrdersCommodityDetails();
	public OrdersCommodityDetails getModel() {
		
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
	@Resource
	OutStockService outstockService;
	@Resource
	PaymentrecordsService paymentrecordsService;
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
    private String sortid;
    
	public String getSortid() {
		return sortid;
	}

	public void setSortid(String sortid) {
		this.sortid = sortid;
	}
	
	/**
	 * 
	 */
    private String xdstartime;//下单开始时间
    private String xdendtime;//下单结束时间
    private String fkstratime;//付款开始时间
    private String fkendtime;//付款结束时间
    private String kddh;//快递单号
    private String status;
	public String getKddh() {
		return kddh;
	}

	public void setKddh(String kddh) {
		this.kddh = kddh;
	}

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

	public String getFkstratime() {
		return fkstratime;
	}

	public void setFkstratime(String fkstratime) {
		this.fkstratime = fkstratime;
	}

	public String getFkendtime() {
		return fkendtime;
	}

	public void setFkendtime(String fkendtime) {
		this.fkendtime = fkendtime;
	}

	
	public OrdersCommodityDetails getOrders() {
		return orders;
	}

	public void setOrders(OrdersCommodityDetails orders) {
		this.orders = orders;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getList(){
		if(status!=null){
			orders.getOrder().setO_status(Integer.parseInt(status));
		}
		if(sortid!=null){
			orders.getOrder().setO_sort(Integer.parseInt(sortid));
		}
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
					//获取今天订单
					  kddh="";
				      Date date = new Date();//当前日期
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
					  Calendar calendar = Calendar.getInstance();//日历对象
					  calendar.setTime(date);//设置当前日期
					  String newdate=sdf.format(calendar.getTime());
					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  System.out.println(ytime);
					  xdstartime=newdate;
					  xdendtime=ytime;
				}
			}
		}
		pageResponse.setRows(ocdetailsService.getList(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh));
		pageResponse.setTotal(ocdetailsService.getCount(orders,xdstartime,xdendtime,fkstratime,fkendtime,kddh));
		return "list";
	}		
	
	public void setResult(String result) {
		this.result = result;
	}

	public String save(){
		return "save";
	}
	
	public String addView(){
		selectcommodity();
		return "addView";
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
		//获取订单信息
		Orders order=this.ordersService.findById(orders.getOrder());
		ServletActionContext.getContext().getValueStack().push(order);
		
		if(order!=null){
			//获取订单商品详细
			orders=new OrdersCommodityDetails();
			orders.setOrder(order);
			List<OrdersCommodityDetails> ocdlist=this.ocdetailsService.findOrdersCommodityDetails(orders);
			ServletActionContext.getContext().put("ocdlists", ocdlist);
			
			//获取付款记录
			List<PaymentRecords> precords=paymentrecordsService.findlistbyorderid(order.getO_bh());
			ServletActionContext.getContext().put("precords", precords);
			//获取操作步骤
			List<OrdersRecord> orecords=ordersrecordService.findlistbyorderid(order.getO_id());
			ServletActionContext.getContext().put("orecords", orecords);
		}
		
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
		result="删除成功";
		return "delete";
	}
	
	
	List<OrdersCommodityDetails> ocdetails;
	
	/**
	 * 查询订单商品明细
	 */
	public String queryOrderCommodityDetail(){
		return "queryOrderCommodityDetail";
	}
	public List<OrdersCommodityDetails> getOcdetails() {
		return ocdetails;
	}

	public void setOcdetails(List<OrdersCommodityDetails> ocdetails) {
		this.ocdetails = ocdetails;
	}

	
	/**
	 * 批量发货
	 */
	public String onplfh(){
		
		if(result!=null){
	
		String[] a=result.split(",");
		int j=0;
		if(a.length>0){
			for (int i = 0; i < a.length; i++) {
				Orders order= this.ordersService.findBybh(a[i]);
				order.setO_status(1);
				DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
				order.setFhtime(format.format(new Date()));
				this.ordersService.save(order);
				// 添加订单操作记录
				addorderrecord(order,1);
				//添加出库记录
				addoutstock(order);
				 j++;
			}
		if(a.length==j){
			result = "操作成功";
			return "delete";
		}
		}else{
			Orders order= this.ordersService.findBybh(result);
			DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
			order.setFhtime(format.format(new Date()));
			order.setO_status(1);
			this.ordersService.save(order);
			// 添加订单操作记录
			addorderrecord(order,1);
			//添加出库记录
			addoutstock(order);
		}
		}
		result = "操作失败";
		return "delete";
	}
	/**
	 * 取消订单
	 */
	public String onqxorder(){

		if(result!=null){
	
		String[] a=result.split(",");
		int j=0;
		if(a.length>0){
			for (int i = 0; i < a.length; i++) {
				Orders order= this.ordersService.findBybh(a[i]);
				order.setO_status(7);
				this.ordersService.save(order);
				// 添加订单操作记录
				addorderrecord(order,7);
				//修改商品数量
				upcommdoitynum(order);
				 j++;
			}
		if(a.length==j){
			result = "操作成功";
			return "delete";
		}
		}else{
			Orders order= this.ordersService.findBybh(result);
			order.setO_status(7);
			this.ordersService.save(order);
			// 添加订单操作记录
			addorderrecord(order,7);
			//修改商品数量
			upcommdoitynum(order);
			
		}
		}
		result = "操作失败";
		return "delete";
	}
	//修改商品数量
	private void upcommdoitynum(Orders order){
		if(order!=null){
		List<OrdersCommodityDetails> ocd=	ocdetailsService.findCommdoitybyorderbh(order.getO_bh());//根据订单编号查询订单详情
		if(ocd.size()>0){
			for(int i=0;i<ocd.size();i++){
				OrdersCommodityDetails ocdetail = ocd.get(i);
				//修改商品数量
				Commodity c= ocdetail.getCommodity();
				c.setC_ck(c.getC_ck()-ocdetail.getO_num());
				this.commodityService.save(c);
			}
		}
		
		}
	}
	// 添加订单操作记录
		private void addorderrecord(Orders or, int step) {
			try {
				OrdersRecord orecord = new OrdersRecord();
				orecord.setOr_scbs(1);
				orecord.setOr_step(step);
				orecord.setOr_szsj(new Date());
				orecord.setOrders(or);
				ordersrecordService.save(orecord);
			} catch (Exception e) {
				
			}
		}
		
		
	//添加出库记录
	private void addoutstock(Orders order){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		if(order!=null){
			List<OrdersCommodityDetails> ocd=	ocdetailsService.findCommdoitybyorderbh(order.getO_bh());//根据订单编号查询订单详情
			if(ocd.size()>0){
				for(int i=0;i<ocd.size();i++){
					OrdersCommodityDetails ocdetail = ocd.get(i);
					OutStock outstock=new OutStock();
					outstock.setOs_scbs(1);
					outstock.setUser(user);
					outstock.setOs_ckdate(new Date());
					outstock.setOs_zt(1);
					outstock.setOs_cklx(4);
					outstock.setOs_price(ocdetail.getO_zjg());
					outstock.setOs_cksl(ocdetail.getO_num());
					outstock.setCommodity(ocdetail.getCommodity());
					outstockService.save(outstock);
				}
			}
			}
		
	}	
	//确认收货
	public String onplsh(){
		if(result!=null){
			
			String[] a=result.split(",");
			int j=0;
			if(a.length>0){
				for (int i = 0; i < a.length; i++) {
					Orders order= this.ordersService.findBybh(a[i]);
					order.setO_status(2);
					DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
					order.setShtime(format.format(new Date()));
					this.ordersService.save(order);
					// 添加订单操作记录
					addorderrecord(order,2);
					 j++;
				}
			if(a.length==j){
				result = "操作成功";
				return "delete";
			}
			}else{
				Orders order= this.ordersService.findBybh(result);
				DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
				order.setShtime(format.format(new Date()));
				order.setO_status(2);
				this.ordersService.save(order);
				// 添加订单操作记录
				addorderrecord(order,2);
			}
			}
		
		result = "操作失败";
		return "delete";
	}
	//获取数量
	public String querycount(){
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
					//获取今天订单
					kddh="";
				      Date date = new Date();//当前日期
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
					  Calendar calendar = Calendar.getInstance();//日历对象
					  calendar.setTime(date);//设置当前日期
					  String newdate=sdf.format(calendar.getTime());
					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  System.out.println(ytime);
					xdstartime=newdate;
					xdendtime=ytime;
				}
			}
		}
		int num = this.ocdetailsService.queryListcount(orders, xdstartime, xdendtime, fkstratime, fkendtime, kddh);
		result=String.valueOf(num);
		return "delete";
	}
	
	//获取当天交易额
	public String querysumprice(){
		if(kddh!=null){
			if(!"".equals(kddh)){
				if("0".equals(kddh)){
			//获取今天订单
			kddh="";
		      Date date = new Date();//当前日期
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
			  Calendar calendar = Calendar.getInstance();//日历对象
			  calendar.setTime(date);//设置当前日期
			  String newdate=sdf.format(calendar.getTime());
			  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
			  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
			  System.out.println(ytime);
			  fkstratime=newdate;
			  fkendtime=ytime;
		}}}
		double num = this.ocdetailsService.queryListsumprice(orders, xdstartime, xdendtime, fkstratime, fkendtime, kddh);
		result=String.valueOf(num);
		return "delete";
	}
	
	
}
