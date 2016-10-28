package com.cisoft.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.CommoditySpec;
import com.cisoft.model.CommoditySpecVlaue;
import com.cisoft.service.CommoditySpecService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品规格管理
 * @author pro
 *
 */
public class CommoditySpecAction extends Pages<CommoditySpec> implements
ModelDriven<CommoditySpec> {
	
	CommoditySpec cspec=new CommoditySpec();
	
	public CommoditySpec getCspec() {
		return cspec;
	}

	public void setCspec(CommoditySpec cspec) {
		this.cspec = cspec;
	}

	public CommoditySpec getModel() {
		// TODO Auto-generated method stub
		return cspec;
	}
	@Resource
	CommoditySpecService commoditySpecService;
	
	
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(commoditySpecService.getList(cspec));
		pageResponse.setTotal(commoditySpecService.getCount(cspec));
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
//						cbrand.setCb_imgurl(cfurl);
//			}
		if(cspec.getCp_id()==0){
			result="保存成功";
		}else{
			result="修改成功";
		}
		commoditySpecService.save(cspec);
		if(cspec.getCp_id()!=0){
			result=String.valueOf(cspec.getCp_id());
		}
		return "save";
	}
	
	public String addView(){
		List<CommoditySpec> cs=commoditySpecService.findlist(cspec);
		ServletActionContext.getContext().put("cbrand", cs);
		return "addView";
	}
	public String editView(){
		List<CommoditySpec> cs=this.commoditySpecService.findlist(cspec);
		ServletActionContext.getContext().put("cbrand", cs);
		cspec=commoditySpecService.findById(cspec);
		ServletActionContext.getContext().getValueStack().push(cspec);
		List<CommoditySpecVlaue> csvlist=this.commoditySpecService.findspecvallist(cspec);
		ServletActionContext.getContext().put("csvlist", csvlist);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommoditySpec cbrandinfo =commoditySpecService.findById(cspec);
		commoditySpecService.save(cbrandinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		
		CommoditySpec cbrandinfo =commoditySpecService.findById(cspec);
		commoditySpecService.delete(cbrandinfo);
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
	
	
	private List<CommoditySpecVlaue> csvlist;

	public List<CommoditySpecVlaue> getCsvlist() {
		return csvlist;
	}

	public void setCsvlist(List<CommoditySpecVlaue> csvlist) {
		this.csvlist = csvlist;
	}
	
	/**
	 * 保存商品规格值
	 */
	public String dosavespecval(){
		if(csvlist!=null){
			if(csvlist.size()>0){
				int j=0;
				for(int i=2;i<csvlist.size();i++){
					CommoditySpecVlaue cs=csvlist.get(i);
					this.commoditySpecService.savespecval(cs);
					j++;
				}
				result="保存成功";
			}
		}
		return "save";
	}
	private  CommoditySpecVlaue csvpecval;
	 

	public CommoditySpecVlaue getCsvpecval() {
		return csvpecval;
	}

	public void setCsvpecval(CommoditySpecVlaue csvpecval) {
		this.csvpecval = csvpecval;
	}

	/**
	 * 删除商品规格值
	 */
	public String dodeletespecval(){
		try{
		this.commoditySpecService.deletespecval(csvpecval);
		result="删除成功";
		}catch(Exception e ){
			e.printStackTrace();
		}
		return "save";
	}
	
	/**
	 * 查询商品规格值
	 */
     public  String doselectspecval(){
    	 List<CommoditySpecVlaue> csvlist=this.commoditySpecService.findspecvallist(cspec);
    	 if(csvlist!=null){
    		 if(csvlist.size()>0){
    			 String sd="";
    			 for (int i = 0; i < csvlist.size(); i++) {
    				 sd+=csvlist.get(i).getCpv_name()+",";
				}
    			 result=sd;
    		 }else{
    			 result="2";
    		 }
    	 }
    	 
    	 return "save";
     }
     
     /**
      * 查询规格及规格值
      */
     public String doselectspecandval(){
    	 result="";
    	 String s="";
    	 cspec=commoditySpecService.findById(cspec);
 		if(cspec!=null){
 			if(!"".equals(cspec.getCp_name())){
 				result=cspec.getCp_name()+"|"+cspec.getCp_bz()+"|"+cspec.getCp_zsfs()+"|";
 				List<CommoditySpecVlaue> csvlist=this.commoditySpecService.findspecvallist(cspec);
 				if(csvlist!=null){
 				if(csvlist.size()>0){
 					
 					for (int i = 0; i < csvlist.size(); i++) {
						s+=csvlist.get(i).getCpv_name()+",";
					}
 					int d=s.lastIndexOf(',');
 					 if (d > -1) {
					    	s= s.substring(0, d) + s.substring(d + 1, s.length());
					      
					      }
 				}
 				}
 				result+=s;
 			}
 		}
 		
 		return "save";
     }
     
}
