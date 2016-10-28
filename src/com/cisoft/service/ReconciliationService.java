package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.ReconciliationDao;
import com.cisoft.model.Reconciliation;

@Component("reconciliationService")
@Transactional
public class ReconciliationService {
	@Resource
	private ReconciliationDao reconciliationDao;
	
	public int getCount(Reconciliation Reconciliation){
		return reconciliationDao.getCount(Reconciliation);
	}
	public List<Reconciliation> getList(Reconciliation Reconciliation){
		return reconciliationDao.getList(Reconciliation);
	}
	
	public void save(Reconciliation Reconciliation){
		reconciliationDao.save(Reconciliation);
	}
	
	public Reconciliation findById(Reconciliation Reconciliation){
		return reconciliationDao.findById(Reconciliation);
	}
	
	public int isunitexit(int unitid){
		return reconciliationDao.isunitexit(unitid);
	}
	public List<Reconciliation> findgyxlist() {
		// TODO Auto-generated method stub
		return reconciliationDao.findgyxlist();
	}
}
