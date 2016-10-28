package com.cisoft.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.opensymphony.xwork2.ModelDriven;

public class htOrdersAction  extends Pages<Orders> implements ModelDriven<Orders>{
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
		return "save";
	}
	
	public String addView(){
		selectcommodity();
		return "addView";
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
		ordersService.save(Ordersinfo);
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

	//获取统计图标数据
	//所有订单
		public String queryTjsj(){
			String xdstartime="";
			String xdendtime="";
			result="";
		    List lists=	this.ordersService.queryTjsjSum(orders,xdstartime, xdendtime);

			
				String s="";
				for(int i=1;i<13;i++){
					String c="";
					if(!lists.isEmpty()&&lists.size()>0){
					for(int j=0;j<lists.size();j++){
						Object[] o=(Object[]) lists.get(j);
						if(i==Integer.parseInt(o[1].toString())){
							//月份相等追加内容
							s+=o[0].toString()+",";
							c="1";
							break;
						}
						
					}
					
					if(!c.equals("1")){
						s+="0"+",";
					}
					
					}else{
						s+="0"+",";
					}
				}
				result=s.substring(0,s.length()-1);
				System.out.println(s+"=="+result);
				
		    
			
			return "delete";
		}
		
		
	
}
