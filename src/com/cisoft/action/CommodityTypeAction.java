package com.cisoft.action;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommoditySpec;
import com.cisoft.model.CommodityType;
import com.cisoft.service.CommoditySpecService;
import com.cisoft.service.CommodityTypeService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品类型管理
 * @author lgc
 *
 */
public class CommodityTypeAction extends Pages<CommodityType> implements ModelDriven<CommodityType>{

	private CommodityType cType=new CommodityType();
	public CommodityType getModel() {
		// TODO Auto-generated method stub
		return cType;
	}
	@Resource
	CommodityTypeService commodityTypeService;
	@Resource
	CommoditySpecService commoditySpecService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commodityTypeService.getList(cType));
		pageResponse.setTotal(commodityTypeService.getCount(cType));
		return "list";
	}		
	
	public String save(){
//		if(fileProductPicFileName!=null){
//			// 存储缩略图
//						String imageFileName = new Date().getTime()
//								+ getExtention(fileProductPicFileName);
//						//获取tomcat路径
//						// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
//						String cfurl =Until.pathstr()+"property/"+ imageFileName;
//						File newfile = new File(cfurl);
//						copy(fileProductPic, newfile);
//						cType.setCb_imgurl(cfurl);
//			}
		if(cType.getCt_id()==0){
			cType.setCt_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		
		commodityTypeService.save(cType);
		result=String.valueOf(cType.getCt_id());
		return "save";
	}
private List<CommoditySpec> cs;
	
	public List<CommoditySpec> getCs() {
		return cs;
	}

	public void setCs(List<CommoditySpec> cs) {
		this.cs = cs;
	}
	public String addView(){
		List<CommodityType> cs=this.commodityTypeService.findTypelist();
		ServletActionContext.getContext().put("cType", cs);
		return "addView";
	}
	public String editView(){
		cType=commodityTypeService.findById(cType);
		ServletActionContext.getContext().getValueStack().push(cType);
		cs=cType.getCslist();
		ServletActionContext.getContext().put("cspec", cs);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommodityType cTypeinfo =commodityTypeService.findById(cType);
		commodityTypeService.save(cTypeinfo);
		
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		
		CommodityType cTypeinfo =commodityTypeService.findById(cType);
		cTypeinfo.setCt_scbs(0);
		commodityTypeService.save(cTypeinfo);
		result="删除成功";
		return "delete";
	}
	
	
    private CommoditySpec cspec;
    
	public CommodityType getcType() {
		return cType;
	}

	public void setcType(CommodityType cType) {
		this.cType = cType;
	}

	public CommoditySpec getCspec() {
		return cspec;
	}

	public void setCspec(CommoditySpec cspec) {
		this.cspec = cspec;
	}

	/**
	 * 跳转添加规格页面
	 * 查询所有预设的规格
	 */
	public String tospecpage(){
		cs=this.commoditySpecService.findlist(null);
		
		return "tospecpage";
	}
	
	/**
	 * 为商品类型绑定规格
	 */
	
	public String addspecandtype(){
	    this.cType=	this.commodityTypeService.findById(cType);
	    cType.getCslist().add(cspec);
	    this.commodityTypeService.save(cType);
	    result=String.valueOf(cType.getCt_id());
	    
		return "save";
	}	
	
	/**
	 * 删除商品类型绑定的规格
	 */
	public String todeletespec(){
		this.cType=	this.commodityTypeService.findById(cType);
		CommoditySpec cs= this.commoditySpecService.findById(cspec);
	    cType.getCslist().remove(cs);
	    this.commodityTypeService.save(cType);
	    result="删除成功";
		return "save";
	}
	
	
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