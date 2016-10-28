package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.TemplateDao;
import com.cisoft.model.Template;

@Component("templateService")
@Transactional
public class TemplateService {
	@Resource
	private TemplateDao templateDao;
	
	public int getCount(Template GYSInfo){
		return templateDao.getCount(GYSInfo);
	}
	public List<Template> getList(Template GYSInfo){
		return templateDao.getList(GYSInfo);
	}
	
	public void save(Template GYSInfo){
		templateDao.save(GYSInfo);
	}
	
	public Template findById(Template GYSInfo){
		return templateDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return templateDao.isunitexit(unitid);
	}
	public List<Template> findParent() {
		// TODO Auto-generated method stub
		return templateDao.findParent();
	}
	public List<Template> findParentby(Template cbrand) {
		// TODO Auto-generated method stub
		return templateDao.findParentby(cbrand);
	}
	public List<Template> findnoParent() {
		// TODO Auto-generated method stub
		return templateDao.findnoParent();
	}
}
