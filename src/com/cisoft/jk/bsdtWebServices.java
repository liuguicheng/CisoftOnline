package com.cisoft.jk;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.cisoft.model.Commodity;
import com.cisoft.service.CommodityService;
import com.opensymphony.xwork2.ActionSupport;

@Component("BsdtAddWS")
@Scope("propotype")
public class bsdtWebServices extends ActionSupport {


//	/**
//	 * 消息（返回数据）
//	 * 
//	 * @return
//	 */
//	WebServicesResult wsr = new WebServicesResult();
//	@JSON(serialize=false)
//	public WebServicesResult getWsr() {
//		return wsr;
//	}
	
	private String msg="";
	@JSON(serialize=false)
	public String getMsg() {
		return msg;
	}
	 
	CommodityService commodityService;
	@JSON(serialize=false)
	public CommodityService getCommodityService() {
		return commodityService;
	}
	@Resource
	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}
	private ServiceHallPhoto serviceHallPhoto;
	private List<ServiceHallPhoto> shlist=new ArrayList<ServiceHallPhoto>();
	public List<ServiceHallPhoto> getShlist() {
		return shlist;
	}
	public void setShlist(List<ServiceHallPhoto> shlist) {
		this.shlist = shlist;
	}
	@JSON(serialize=false)
	public ServiceHallPhoto getServiceHallPhoto() {
		return serviceHallPhoto;
	}
	public void setServiceHallPhoto(ServiceHallPhoto serviceHallPhoto) {
		this.serviceHallPhoto = serviceHallPhoto;
	}
	
	
	
	public String selectBarcode() {
//		msg="";
		try {
			try {
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		try{
			List<Commodity>  commodities= this.commodityService.findbymoid(serviceHallPhoto);
			if(commodities.size()>0){
				for(int i=0;i<commodities.size();i++){
					msg+=commodities.get(i).getC_name();
					serviceHallPhoto=new ServiceHallPhoto();
					serviceHallPhoto.setName(commodities.get(i).getC_name());
					
					shlist.add(serviceHallPhoto);
				}
			}
//			   msg+="";
			}catch(Exception e){
//				msg="0";
			}
			
		} catch (Exception e) {
//			msg="0";
		}
		return SUCCESS;
	}
	public String selectname() {
//		msg="[";
		try {
			try {
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		try{
			List<Commodity>  commodities= this.commodityService.findbymoid(serviceHallPhoto);
			if(commodities.size()>0){
				for(int i=0;i<commodities.size();i++){
					serviceHallPhoto=new ServiceHallPhoto();
					serviceHallPhoto.setId(commodities.get(i).getC_spbh());
					serviceHallPhoto.setName(commodities.get(i).getC_name());
					
					shlist.add(serviceHallPhoto);
//					msg+="{name:"+commodities.get(i).getC_name()+",code:"+commodities.get(i).getC_spbh()+"}";
				}
			}
//			msg+="]";
			}catch(Exception e){
//				msg="0";
			}
			
		} catch (Exception e) {
//			msg="0";
		}
		return SUCCESS;
	}
	

	
}
