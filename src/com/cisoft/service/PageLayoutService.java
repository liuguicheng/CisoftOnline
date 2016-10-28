package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.PageLayoutDao;
import com.cisoft.model.PageLayout;

@Component("pageLayoutService")
@Transactional
public class PageLayoutService {
	@Resource
	private PageLayoutDao pageLayoutDao;
	
	public int getCount(PageLayout GYSInfo){
		return pageLayoutDao.getCount(GYSInfo);
	}
	public List<PageLayout> getList(PageLayout GYSInfo){
		return pageLayoutDao.getList(GYSInfo);
	}
	
	public void save(PageLayout GYSInfo){
		pageLayoutDao.save(GYSInfo);
	}
	
	public PageLayout findById(PageLayout GYSInfo){
		return pageLayoutDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return pageLayoutDao.isunitexit(unitid);
	}
	public List<PageLayout> findbrandlist() {
		// TODO Auto-generated method stub
		return pageLayoutDao.findbrandlist();
	}
	public List<PageLayout> findbrandlistby(PageLayout cbrand) {
		// TODO Auto-generated method stub
		return pageLayoutDao.findbrandlistby(cbrand);
	}
}
