package com.cisoft.action;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommodityProperty;
import com.cisoft.model.CommoditySort;
import com.cisoft.service.CommoditySortService;
import com.cisoft.service.CommoditypropertyService;
import com.cisoft.utils.Until;
import com.opensymphony.xwork2.ModelDriven;

public class CommoditypropertyAction extends Pages<CommodityProperty> implements ModelDriven<CommodityProperty>{

	private CommodityProperty gys=new CommodityProperty();
	public CommodityProperty getModel() {
		// TODO Auto-generated method stub
		return gys;
	}
	@Resource
	CommoditypropertyService commoditypropertyService;
	@Resource
	CommoditySortService commoditysortService;
	private String result="";
	private File fileProductPic;
	private String fileProductPicFileName;
	
	public File getFileProductPic() {
		return fileProductPic;
	}

	public void setFileProductPic(File fileProductPic) {
		this.fileProductPic = fileProductPic;
	}

	public String getFileProductPicFileName() {
		return fileProductPicFileName;
	}

	public void setFileProductPicFileName(String fileProductPicFileName) {
		this.fileProductPicFileName = fileProductPicFileName;
	}

	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commoditypropertyService.findgyxlist());
		pageResponse.setTotal(0);
		return "list";
	}		
	
	public String save(){
		if(fileProductPicFileName!=null){
			// 存储缩略图
						String imageFileName = new Date().getTime()
								+ getExtention(fileProductPicFileName);
						//获取tomcat路径
						// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
						String cfurl =Until.pathstr()+"property/"+ imageFileName;
						File newfile = new File(cfurl);
						copy(fileProductPic, newfile);
						gys.setCp_imgurl(cfurl);
			}
		if(gys.getCp_id()==0){
			gys.setCp_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commoditypropertyService.save(gys);
		return "save";
	}
	
	public String addView(){
		select();
		return "addView";
	}
	public String editView(){
		select();
		gys=commoditypropertyService.findById(gys);
		ServletActionContext.getContext().getValueStack().push(gys);
		return "editView";
	}
	public void select(){
		List<CommodityProperty> mslist=this.commoditypropertyService.findgyxlist();
		ServletActionContext.getContext().put("commoditpp", mslist);
	}
	
	
	//修改信息
	public String updatepwd(){
		commoditypropertyService.save(gys);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		List<CommodityProperty> cblist=commoditypropertyService.findByIdby(gys);
		if(cblist.size()>0){
			result="你选择的属于父类,不能删除";
			return "delete";
		}
		CommodityProperty CommodityProperty =commoditypropertyService.findById(gys);
		CommodityProperty.setCp_scbs(0);
		commoditypropertyService.save(CommodityProperty);
		result="删除成功";
		return "delete";
	}
	
	
	private static final int BUFFER_SIZE = 16 * 1024;
	/**
	 * 上传商品缩略图
	 */

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
}
