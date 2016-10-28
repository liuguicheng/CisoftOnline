package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.TemplateLabelDao;
import com.cisoft.model.TemplateLabel;

@Component("templateLabelService")
@Transactional
public class TemplateLabelService {
	@Resource
	private TemplateLabelDao templateLabelDao;
	
	public int getCount(TemplateLabel GYSInfo){
		return templateLabelDao.getCount(GYSInfo);
	}
	public List<TemplateLabel> getList(TemplateLabel GYSInfo){
		return templateLabelDao.getList(GYSInfo);
	}
	
	public void save(TemplateLabel GYSInfo){
		templateLabelDao.save(GYSInfo);
	}
	
	public TemplateLabel findById(TemplateLabel GYSInfo){
		return templateLabelDao.findById(GYSInfo);
	}
	
	public int isunitexit(int unitid){
		return templateLabelDao.isunitexit(unitid);
	}
	public List<TemplateLabel> findbrandlist() {
		// TODO Auto-generated method stub
		return templateLabelDao.findbrandlist();
	}
	public List<TemplateLabel> findbrandlistby(TemplateLabel cbrand) {
		// TODO Auto-generated method stub
		return templateLabelDao.findbrandlistby(cbrand);
	}
}
