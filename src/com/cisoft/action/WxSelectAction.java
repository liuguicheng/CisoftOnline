package com.cisoft.action;

import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;

import com.cisoft.model.Commodity;
import com.cisoft.service.CommodityService;
import com.cisoft.utils.ObjectToXml;
import com.cisoft.utils.Parsexml;


public class WxSelectAction  {

	
	/**
	 * 微信查询数据接口
	 */
	@Resource
	CommodityService commodityService;
	private String commoditylist;
	
	
	public String getCommoditylist() {
		return commoditylist;
	}


	public void setCommoditylist(String commoditylist) {
		this.commoditylist = commoditylist;
	}
    
	private String queryXmlDoc;
	private String returnIdentification;
	

	public String getQueryXmlDoc() {
		return queryXmlDoc;
	}


	public void setQueryXmlDoc(String queryXmlDoc) {
		this.queryXmlDoc = queryXmlDoc;
	}


	public String getReturnIdentification() {
		return returnIdentification;
	}


	public void setReturnIdentification(String returnIdentification) {
		this.returnIdentification = returnIdentification;
	}


	//商品列表
	public String quyercommoditylist(){
		
		
		if(queryXmlDoc!=null&&!queryXmlDoc.equals("")){
			//解析参数
			Parsexml paxml=new Parsexml();
			Commodity commodity=paxml.fzcommodiyt(queryXmlDoc);
			List<Commodity> commoditys=commodityService.findlist(commodity);
			if(commoditys!=null){
				if(returnIdentification.equals("xml")){
					ObjectToXml otx=new ObjectToXml();
					commoditylist=otx.getObjectToXml(commoditys);
					System.out.println(commoditylist);
					
					ObjectToXml otxml=new ObjectToXml();
					String str=otxml.toxml(commoditys);
					System.out.println(str);
				}else if(returnIdentification.equals("json")){
					//封装成json返回
					commoditylist=JSONArray.toJSONString(commoditys);
					System.out.println(commoditylist);
				}
				
				
			}
		}
		
		return "success";
	}
	
}
