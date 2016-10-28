package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.CisoftptDao;
import com.cisoft.model.CisoftPt;

@Component("cisoftPtService")
@Transactional
public class CisoftPtService {
	@Resource
	private CisoftptDao cisoftptDao;
	
	public void save(CisoftPt backups){
		cisoftptDao.save(backups);
	}
	
	public List<CisoftPt> getList(CisoftPt backups){
		return cisoftptDao.findbrandlist();
	}
	
}
