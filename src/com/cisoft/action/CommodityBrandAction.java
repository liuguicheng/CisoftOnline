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
import com.cisoft.service.CommodityBrandService;
import com.cisoft.utils.Until;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品品牌
 * @author lgc
 *
 */
public class CommodityBrandAction extends Pages<CommodityBrand> implements ModelDriven<CommodityBrand>{

	private CommodityBrand cbrand=new CommodityBrand();
	public CommodityBrand getModel() {
		// TODO Auto-generated method stub
		return cbrand;
	}
	@Resource
	CommodityBrandService commoditybrandService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commoditybrandService.findbrandlist());
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
						cbrand.setCb_imgurl(cfurl);
			}
		if(cbrand.getCb_id()==0){
			cbrand.setCb_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commoditybrandService.save(cbrand);
		return "save";
	}
	
	public String addView(){
		List<CommodityBrand> cs=this.commoditybrandService.findbrandlist();
		ServletActionContext.getContext().put("cbrand", cs);
		return "addView";
	}
	public String editView(){
		List<CommodityBrand> cs=this.commoditybrandService.findbrandlist();
		ServletActionContext.getContext().put("cbrand", cs);
		cbrand=commoditybrandService.findById(cbrand);
		ServletActionContext.getContext().getValueStack().push(cbrand);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommodityBrand cbrandinfo =commoditybrandService.findById(cbrand);
		commoditybrandService.save(cbrandinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		List<CommodityBrand> cblist=commoditybrandService.findbrandlistby(cbrand);
		if(cblist.size()>0){
			result="你选择的属于父类,不能删除";
			return "delete";
		}
		CommodityBrand cbrandinfo =commoditybrandService.findById(cbrand);
		cbrandinfo.setCb_scbs(0);
		commoditybrandService.save(cbrandinfo);
		result="删除成功";
		return "delete";
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