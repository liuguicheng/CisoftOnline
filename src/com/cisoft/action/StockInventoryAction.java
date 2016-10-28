package com.cisoft.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.StockInventory;
import com.cisoft.service.StockInventoryService;
import com.opensymphony.xwork2.ModelDriven;

public class StockInventoryAction extends Pages<StockInventory> implements ModelDriven<StockInventory>{

	private StockInventory gys=new StockInventory();
	public StockInventory getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	StockInventoryService stockInventoryService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	 private String xdstartime;//入库开始时间
	    private String xdendtime;//入库结束时间
	    private String fkstratime;//出库开始时间
	    private String fkendtime;//出库结束时间
	    private String kddh;//临时变量
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
		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

	public String getList(){
		selectinfo();
		pageResponse.setRows(stockInventoryService.getList(gys,xdstartime,xdendtime,fkstratime,fkendtime));
		pageResponse.setTotal(stockInventoryService.getCount(gys,xdstartime,xdendtime,fkstratime,fkendtime));
		return "list";
	}	
	
	private void selectinfo(){
		if(status!=null){
			gys.setSi_zt(Integer.parseInt(status));
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
//					  calendar.add(Calendar.DAY_OF_MONTH, -1);//天数加一
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
					  calendar.add(Calendar.DAY_OF_MONTH, +1);//天数加一
					  String ytime=sdf.format(calendar.getTime());//输出格式化的日期
					  System.out.println(ytime);
					xdstartime="";
					xdendtime=ytime;
				}
			}
		}
	}
	
	public String save(){
		if(gys.getSi_id()==0){
			gys.setSi_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		stockInventoryService.save(gys);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		gys=stockInventoryService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		stockInventoryService.save(gys);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		StockInventory StockInventory =stockInventoryService.findById(gys);
		StockInventory.setSi_scbs(0);
		stockInventoryService.save(StockInventory);
		result="删除成功";
		return "delete";
	}
	
	//获取数量
	public String querycount(){
		selectinfo();
		int num=stockInventoryService.getCount(gys,xdstartime,xdendtime,fkstratime,fkendtime);
		result=String.valueOf(num);
		return "delete";
	}
	
	
}
