package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.OperationLogDao;
import com.cisoft.model.OperationLog;

@Component("operationLogService")
@Transactional
public class OperationLogService {
	@Resource
	private OperationLogDao operationLogDao;
	
	public int getCount(OperationLog GYSInfo){
		return operationLogDao.getCount(GYSInfo);
	}
	public List<OperationLog> getList(OperationLog GYSInfo){
		return operationLogDao.getList(GYSInfo);
	}
	
	public void save(OperationLog GYSInfo){
		operationLogDao.save(GYSInfo);
	}
	
	public OperationLog findById(OperationLog GYSInfo){
		return operationLogDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return operationLogDao.isunitexit(unitid);
	}
	public List<OperationLog> findbrandlist(OperationLog OperationLog) {
		// TODO Auto-generated method stub
		return operationLogDao.findbrandlist(OperationLog);
	}
	public List<OperationLog> findbrandlistby(OperationLog cbrand) {
		// TODO Auto-generated method stub
		return operationLogDao.findbrandlistby(cbrand);
	}
}
