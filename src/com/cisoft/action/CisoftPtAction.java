package com.cisoft.action;

import javax.annotation.Resource;

import com.cisoft.model.CisoftPt;
import com.cisoft.service.CisoftPtService;

public class CisoftPtAction {

	
	@Resource
	CisoftPtService cisoftPtService;
	private CisoftPt cisoftpt;
	private String code;
	
	
	public CisoftPt getCisoftpt() {
		return cisoftpt;
	}



	public void setCisoftpt(CisoftPt cisoftpt) {
		this.cisoftpt = cisoftpt;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String add(){
		try{
		cisoftPtService.save(cisoftpt);
		code="1";
		}catch(Exception e){
			e.printStackTrace();
			code="2";
		}
		return "success";
	}
}
