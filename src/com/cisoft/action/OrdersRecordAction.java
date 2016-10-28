package com.cisoft.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Order;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.utils.ExpertSelectException;
import com.opensymphony.xwork2.ModelDriven;

public class OrdersRecordAction  extends Pages<OrdersRecord> implements ModelDriven<OrdersRecord>{
	private OrdersRecord or=new OrdersRecord();
	public OrdersRecord getModel() {
		// TODO Auto-generated method stub
		return or;
	}
	@Resource
	OrdersRecordService ordersrecordService;
	
	private String result="";
	public String getResult() {
		return result;
	}
	private String o_id;
	
	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getList(){
		Orders o=new Orders();
		o.setO_id(Integer.parseInt(o_id));
		or.setOrders(o);
		pageResponse.setRows(ordersrecordService.getList(or));
		pageResponse.setTotal(ordersrecordService.getCount(or));
		return "list";
	}		
	
	
	
}
