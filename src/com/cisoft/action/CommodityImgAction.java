package com.cisoft.action;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityImg;
import com.cisoft.model.CommoditySpeclist;
import com.cisoft.service.CommodityImgService;
import com.cisoft.service.CommodityService;
import com.cisoft.service.CommoditySpeclistService;
import com.cisoft.utils.Until;
import com.cisoft.utils.UplodImg;
import com.opensymphony.xwork2.ModelDriven;

public class CommodityImgAction extends Pages<CommodityImg> implements ModelDriven<CommodityImg>{

	private CommodityImg commodityImg=new CommodityImg();
	public CommodityImg getModel() {
		// TODO Auto-generated method stub
		return commodityImg;
	}
	@Resource
	CommodityImgService commodityImgService;
	@Resource
	CommodityService commodityService;
	@Resource
	CommoditySpeclistService commoditySpeclistService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}

	public String getList(){
		pageResponse.setRows(commodityImgService.getList(commodityImg));
		pageResponse.setTotal(commodityImgService.getCount(commodityImg));
		return "list";
	}		
	
	public String save(){
		if(commodityImg.getCi_id()==0){
			commodityImg.setCi_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		commodityImgService.save(commodityImg);
		return "save";
	}
	
	public String addView(){
		return "addView";
	}
	public String editView(){
		CommodityImg commodityImgs=commodityImgService.findById(commodityImg);
		ServletActionContext.getContext().getValueStack().push(commodityImgs);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		CommodityImg CommodityImginfo =commodityImgService.findById(commodityImg);
		CommodityImginfo.setCi_bz(commodityImg.getCi_bz());
		CommodityImginfo.setCi_url(commodityImg.getCi_url());
		commodityImgService.save(CommodityImginfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		CommodityImg commodityImgs =commodityImgService.findById(commodityImg);
		commodityImgs.setCi_scbs(0);
		commodityImgService.save(commodityImgs);
		result="删除成功";
		return "delete";
	}
	
	
	
	private List<CommodityImg> cilist=new ArrayList<CommodityImg>();
	private List<CommoditySpeclist> csllist=new ArrayList<CommoditySpeclist>();
	public List<CommodityImg> getCilist() { 
		return cilist;
	}

	public void setCilist(List<CommodityImg> cilist) {
		this.cilist = cilist;
	}
	
	private File[] fileProductPic;
	private String[] fileProductPicFileName;
	public File[] getFileProductPic() {
		return fileProductPic;
	}

	public void setFileProductPic(File[] fileProductPic) {
		this.fileProductPic = fileProductPic;
	}

	public String[] getFileProductPicFileName() {
		return fileProductPicFileName;
	}

	public void setFileProductPicFileName(String[] fileProductPicFileName) {
		this.fileProductPicFileName = fileProductPicFileName;
	}

	
	public List<CommoditySpeclist> getCsllist() {
		return csllist;
	}

	public void setCsllist(List<CommoditySpeclist> csllist) {
		this.csllist = csllist;
	}

	//绑定商品规格 并添加图片
	public String addspecimg(){
		List<String> imgstrlist=new ArrayList<String>();
		if(fileProductPicFileName!=null){
			for(int i=0;i<fileProductPicFileName.length;i++){
				  // 上传商品相册图片
				String imageFileName = new Date().getTime()
						+UplodImg.getExtention(fileProductPicFileName[i]);
				//获取tomcat路径
				// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
				String cfurl =Until.pathstr()+ imageFileName;
				File newfile = new File(cfurl);
				UplodImg.copy(fileProductPic[i], newfile);
				imgstrlist.add(cfurl);
				
				}
			    
			}
		if(cilist!=null){
			if(cilist.size()>0){
				result="";
				for(int i=0;i<cilist.size();i++){
					commodityImg=cilist.get(i);
					commodityImg.setCi_scbs(1);
					if(imgstrlist.size()>0){
						commodityImg.setCi_url(imgstrlist.get(i));
					}
					this.commodityImgService.save(commodityImg);
					result+=commodityImg.getCi_id()+","+commodityImg.getCommodityspec().getCp_name()+","+commodityImg.getCommodityspec().getCp_id()+"|";
				}
			}
		}
		
		if(csllist!=null){
			if(csllist.size()>0){
				CommoditySpeclist csl=new CommoditySpeclist();
				for (int i = 0; i < csllist.size(); i++) {
					csl=csllist.get(i);
					if(imgstrlist.size()>0){
						csl.setCsl_imgs(imgstrlist.get(i));	
					}
				}
				csl.setCls_scbs(1);
				commoditySpeclistService.save(csl);
			}
		}
		result="操作成功";
		return "addspecimgsuccess";
	}
	
	//根据商品查询所有商品
	public String queryAlbum(){
		//相册图片
	    List<CommodityImg> cilist=	this.commodityImgService.findAlbumlist(commodityImg);
		ServletActionContext.getContext().put("cilist", cilist);
	    //商品详细
	    Commodity commodity= this.commodityService.findById(commodityImg.getCommodity());
	    this.commodityImg.setCommodity(commodity);
	    
	    //相册图片
	    String s= commodity.getC_spimg();
	    String[] sd=s.split(",");
	    List<String> sdl=new ArrayList<String>();
	    for (int i = 0; i < sd.length; i++) {
	    	sdl.add(sd[i]);
		}
	    ServletActionContext.getContext().put("sdl", sdl);
	    //规格图片
	    CommoditySpeclist csl=new CommoditySpeclist();
	    csl.setCommodity(commodityImg.getCommodity());
	    List<CommoditySpeclist> csllist=commoditySpeclistService.findbrandlistby(csl);
	    ServletActionContext.getContext().put("csllist", csllist);
		return "queryAlbumsuccess";
	}
	
	//删除图片
	public String delimg(){
		if(result!=null&&!"".equals(result)){
			String[] str=result.split(",");
			if("sl".equals(str[1])){
				Commodity commodity= new Commodity();
				commodity.setC_id(Integer.parseInt(str[0]));
				//缩略图
				commodity=this.commodityService.findById(commodity);
				commodity.setC_sltimg("");
				this.commodityService.save(commodity);
				result="操作成功";
			}else if("xy".equals(str[1])){
				Commodity commodity= new Commodity();
				commodity.setC_id(Integer.parseInt(str[0]));
				//缩略图
				commodity=this.commodityService.findById(commodity);
				commodity.setC_spxximg("");
				this.commodityService.save(commodity);
				result="操作成功";
			}else if("ggid".equals(str[1])){
				//规格图
				CommoditySpeclist csl=new CommoditySpeclist();
				csl.setCsl_id(Integer.parseInt(str[0]));
				CommoditySpeclist cslinfo=this.commoditySpeclistService.findById(csl);
				cslinfo.setCls_scbs(0);
				this.commoditySpeclistService.save(cslinfo);
				result="操作成功";
			}else if("xcid".equals(str[1])){
				//相册图
				Commodity commodity= new Commodity();
				commodity.setC_id(Integer.parseInt(str[0]));
				//缩略图
				commodity=this.commodityService.findById(commodity);
				String s=commodity.getC_spimg();
				System.out.println("共"+s);
				String ss="";
				if(!"".equals(s)){
					String[] sg=s.split(",");
					for(int i=0;i<sg.length;i++){
						if(str[0].equals(sg[i])){
							System.out.println("删除"+str[0]);
						}
						ss+=sg[i]+",";
					}
					System.out.println("剩余："+ss);
				}
				commodity.setC_spimg(ss);
				
				
			}
			result="操作成功";
		}
		return "save";
	}
	
	public String addimg(){
		if(fileProductPicFileName!=null){
			Commodity commodity= new Commodity();
			commodity.setC_id(commodityImg.getCommodity().getC_id());
			//缩略图
			commodity=this.commodityService.findById(commodity);
			
			for(int i=0;i<fileProductPicFileName.length;i++){
				  // 上传商品相册图片
				String imageFileName = new Date().getTime()
						+UplodImg.getExtention(fileProductPicFileName[i]);
				//获取tomcat路径
				// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
				String cfurl =Until.pathstr()+ imageFileName;
				File newfile = new File(cfurl);
				UplodImg.copy(fileProductPic[i], newfile);
				commodity.setC_sltimg(cfurl);
				this.commodityService.save(commodity);				
				}
			    
			}
		result="操作成功";
		return "save";
	}
	
	public String addxxtimg(){
		if(fileProductPicFileName!=null){
			Commodity commodity= new Commodity();
			commodity.setC_id(commodityImg.getCommodity().getC_id());
			//缩略图
			commodity=this.commodityService.findById(commodity);
			
			for(int i=0;i<fileProductPicFileName.length;i++){
				  // 上传商品相册图片
				String imageFileName = new Date().getTime()
						+UplodImg.getExtention(fileProductPicFileName[i]);
				//获取tomcat路径
				// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
				String cfurl =Until.pathstr()+ imageFileName;
				File newfile = new File(cfurl);
				UplodImg.copy(fileProductPic[i], newfile);
				commodity.setC_spxximg(cfurl);
				this.commodityService.save(commodity);				
				}
			    
			}
		result="操作成功";
		return "save";
	}
}
