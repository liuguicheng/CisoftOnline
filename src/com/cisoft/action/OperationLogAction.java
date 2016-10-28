package com.cisoft.action;

import javax.annotation.Resource;

import com.cisoft.model.OperationLog;
import com.cisoft.service.OperationLogService;
import com.opensymphony.xwork2.ModelDriven;

public class OperationLogAction extends Pages<OperationLog> implements ModelDriven<OperationLog>{

	private OperationLog gys=new OperationLog();
	public OperationLog getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	OperationLogService operationLogService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(operationLogService.getList(gys));
		pageResponse.setTotal(operationLogService.getCount(gys));
		return "list";
	}		
	
	
	
}
