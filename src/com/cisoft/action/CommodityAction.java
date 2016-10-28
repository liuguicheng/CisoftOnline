package com.cisoft.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityBinding;
import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommodityLabel;
import com.cisoft.model.CommodityP;
import com.cisoft.model.CommoditySort;
import com.cisoft.model.CommodityStatus;
import com.cisoft.model.CommodityType;
import com.cisoft.model.GYSInfo;
import com.cisoft.model.Orders;
import com.cisoft.service.CommodityBindingService;
import com.cisoft.service.CommodityBrandService;
import com.cisoft.service.CommodityImgService;
import com.cisoft.service.CommodityLabelService;
import com.cisoft.service.CommodityPService;
import com.cisoft.service.CommodityService;
import com.cisoft.service.CommoditySortService;
import com.cisoft.service.CommoditySpeclistService;
import com.cisoft.service.CommodityStatusService;
import com.cisoft.service.CommodityTypeService;
import com.cisoft.service.CommoditypropertyService;
import com.cisoft.service.GysService;
import com.cisoft.utils.ParseExcel;
import com.cisoft.utils.Until;
import com.cisoft.utils.writeExcel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class CommodityAction extends Pages<Commodity> implements
		ModelDriven<Commodity> {
	private static final int BUFFER_SIZE = 16 * 1024;
	private Commodity commodity = new Commodity();
	private int qtmbbs;
	
	public int getQtmbbs() {
		return qtmbbs;
	}

	public void setQtmbbs(int qtmbbs) {
		this.qtmbbs = qtmbbs;
	}

	private String g_id;

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public Commodity getModel() {
		// TODO Auto-generated method stub
		return commodity;
	}

	@Resource
	CommodityService commodityService;
	@Resource
	CommodityBrandService commoditybrandService;
	@Resource
	CommodityImgService commodityImgService;
	@Resource
	CommoditySortService commoditysortService;
	@Resource
	CommodityStatusService commoditystatusService;
	@Resource
	GysService gysService;
	@Resource
	CommoditypropertyService commoditypropertyService;
	@Resource
	CommodityPService commodityPService;
	@Resource
	private CommodityLabelService commodityLabelService;
	@Resource
	CommodityTypeService commodityTypeService;
	
	@Resource
	CommoditySpeclistService commoditySpeclistService;
	@Resource
	CommodityBindingService commodityBindingService;
	
	private String result = "";

	public String getResult() {
		return result;
	}

	public String getList() {
		if(commodity.getGysInfo()!=null){
			if(commodity.getGysInfo().getG_id()!=0){
				
			}else{
				commodity.setGysInfo(null);
			}
		}else{
			commodity.setGysInfo(null);
		}
		pageResponse.setRows(commodityService.getList(commodity));
		pageResponse.setTotal(commodityService.getCount(commodity));
		return "list";
	}

	private String brandid;
	private String sortid;
	private String statusid;
	private String gysid;
	private File fileProductPic;
	private String fileProductPicFileName;

	private File spxximg;
	private String spxximgFileName;
	
	public File getSpxximg() {
		return spxximg;
	}

	public void setSpxximg(File spxximg) {
		this.spxximg = spxximg;
	}

	public String getSpxximgFileName() {
		return spxximgFileName;
	}

	public void setSpxximgFileName(String spxximgFileName) {
		this.spxximgFileName = spxximgFileName;
	}

	public String save() {
		if(fileProductPicFileName!=null){
		// 存储缩略图
					String imageFileName = new Date().getTime()
							+ getExtention(fileProductPicFileName);
					//获取tomcat路径
					// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
					String cfurl =Until.pathstr()+ imageFileName;
					File newfile = new File(cfurl);
					copy(fileProductPic, newfile);
					commodity.setC_sltimg(cfurl);
		}
		
		if(spxximgFileName!=null){
			// 存储商品形象图
			String imageFileName = new Date().getTime()
					+ getExtention(spxximgFileName);
			//获取tomcat路径
			// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
			String cfurl =Until.pathstr()+ imageFileName;
			File newfile = new File(cfurl);
			copy(spxximg, newfile);
			commodity.setC_spxximg(cfurl);
			
		}
		
		if(commodity.getC_spms()!=null){
			String[] va=commodity.getC_spms().split(",");
			commodity.setC_spms(va[1]);
			commodity.setC_spsxms(va[0]);
		}
		if (commodity.getC_id() == 0) {
			commodity.setC_scbs(1);
			commodity.setC_sj(2);//默认不上架
			result = "添加成功";
		} else {
			result = "修改成功";
		}
		commodityService.save(commodity);
		
		return "save";
	}

	public String scsave(){
		if(fileProductPicFileName!=null){
			// 存储缩略图
						String imageFileName = new Date().getTime()
								+ getExtention(fileProductPicFileName);
						//获取tomcat路径
						// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
						String cfurl =Until.pathstr()+ imageFileName;
						File newfile = new File(cfurl);
						copy(fileProductPic, newfile);
						commodity.setC_sltimg(cfurl);
			}
			
			if(spxximgFileName!=null){
				// 存储商品形象图
				String imageFileName = new Date().getTime()
						+ getExtention(spxximgFileName);
				//获取tomcat路径
				// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
				String cfurl =Until.pathstr()+ imageFileName;
				File newfile = new File(cfurl);
				copy(spxximg, newfile);
				commodity.setC_spxximg(cfurl);
				
			}
			
			if(commodity.getC_spms()!=null){
				String[] va=commodity.getC_spms().split(",");
				if(va.length!=0){
					commodity.setC_spms(va[1]);
					commodity.setC_spsxms(va[0]);
				}
				
			}
			if (commodity.getC_id() == 0) {
				commodity.setC_scbs(1);
				commodity.setC_sj(2);//默认不上架
				
			} else {
			}
			commodityService.save(commodity);
			result =String.valueOf(commodity.getC_id());
			
			return "save";
	}
	
	private void addcommodityproperty(){
		
//		commoditypropertyService.save(CommodityProperty);
	}
	public String addView() {
		select();
		return "addView";
	}

	// 获取供应商信息并传值
	private void select() {
		commodity = commodity;
		// 获取品牌信息
		List<CommodityBrand> brandlist = this.commoditybrandService
				.findbrandlist();
		ServletActionContext.getContext().put("brandlist", brandlist);
		// 获取供应商信息
		List<GYSInfo> gyslist = this.gysService.findgyxlist();
		ServletActionContext.getContext().put("gyslist", gyslist);
		// 获取商品分类
		List<CommoditySort> sortlist = this.commoditysortService.findParent();
		ServletActionContext.getContext().put("sortlist", sortlist);
		// 获取商品状态
		List<CommodityStatus> statuslist = this.commoditystatusService
				.findstatus();
		ServletActionContext.getContext().put("statuslist", statuslist);
		//获取商品标签
		
		List<CommodityLabel> cllist = this.commodityLabelService.findbrandlist();
		ServletActionContext.getContext().put("cllist", cllist);
		
		//商品类型
		List<CommodityType> ctlist=this.commodityTypeService.findTypelist();
		ServletActionContext.getContext().put("ctlist", ctlist);
	}
  private HashMap<String, String> sxmaps=new HashMap<String, String>();
    @JSON(serialize = false)
	public HashMap<String, String> getSxmaps() {
	return sxmaps;
}

public void setSxmaps(HashMap<String, String> sxmaps) {
	this.sxmaps = sxmaps;
}

	public String editView() {
		select();
		commodity = commodityService.findById(commodity);
		if(commodity.getC_wxms()!=null){
			//商品属性
			String[] sts=commodity.getC_wxms().split(",");
			
			if(sts.length>0){
				if(!"".equals(sts[0])){
				for(int i=0;i<sts.length;i++){
					String sss[]=sts[i].split(":");
					sxmaps.put(sss[0], sss[1]);
				}
				ServletActionContext.getContext().getValueStack().push(sxmaps);
				}
			}
		}
	    ServletActionContext.getContext().getValueStack().push(commodity);
		return "editView";
	}
	
	//查询图片
	public String queryimglist(){
		commodity = commodityService.findById(commodity);
		if (!commodity.getC_spimg().equals("")) {
			String[] imgliststr = commodity.getC_spimg().split(",");
			 imglist = new ArrayList<String>();
			for (int i = 0; i < imgliststr.length; i++) {
				imglist.add(imgliststr[i]);
			}
		}
		return "queryimglist";
	}
	// 修改信息
	public String updatepwd() {
		commodityService.save(commodity);
		result = "修改成功";
		return "updatepwd";
	}

	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete() {
		
		if(result!=null&&!"".equals(result)){
	     
		String[] a=result.split(",");
		int j=0;
		if(a.length>0){
			for (int i = 0; i < a.length; i++) {
				commodity=new Commodity();
				commodity.setC_id(Integer.parseInt(a[i]));
				Commodity commodityinfo = commodityService.findById(commodity);
				commodityinfo.setC_scbs(0);
				commodityService.save(commodityinfo);
				 j++;
			}
		if(a.length==j){
			result = "删除成功";
			return "delete";
		}
		}
		}
		
		Commodity commodityinfo = commodityService.findById(commodity);
		commodityinfo.setC_scbs(0);
		commodityService.save(commodityinfo);
		result = "删除成功";
		return "delete";
	}

	@JSON(serialize = false)
	public String getBrandid() {
		return brandid;
	}

	public void setBrandid(String brandid) {
		this.brandid = brandid;
	}

	
	public String getSortid() {
		return sortid;
	}

	public void setSortid(String sortid) {
		this.sortid = sortid;
	}

	@JSON(serialize = false)
	public String getStatusid() {
		return statusid;
	}

	public void setStatusid(String statusid) {
		this.statusid = statusid;
	}

	@JSON(serialize = false)
	public String getGysid() {
		return gysid;
	}

	public void setGysid(String gysid) {
		this.gysid = gysid;
	}

	private File AjaxProductPic;
	private String AjaxProductPicFileName;
	private List<String> imglist = new ArrayList<String>();

	public List<String> getImglist() {
		return imglist;
	}

	public void setAjaxProductPic(File ajaxProductPic) {
		AjaxProductPic = ajaxProductPic;
	}

	public void setAjaxProductPicFileName(String ajaxProductPicFileName) {
		AjaxProductPicFileName = ajaxProductPicFileName;
	}

	/**
	 * 上传商品图片
	 */
	public String douplodimg() {
		String imageFileName = new Date().getTime()
				+ getExtention(AjaxProductPicFileName);
		// 获取tomcat路径
		// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
		String cfurl =Until.pathstr()+ imageFileName;
		File newfile = new File(cfurl);
		copy(AjaxProductPic, newfile);
		imglist.add(cfurl);
		return "upimg";
	}

	/**
	 * 查询图片
	 */
	public String queryimg() {

		return "upimg";
	}

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

	public void setFileProductPic(File fileProductPic) {
		this.fileProductPic = fileProductPic;
	}

	public void setFileProductPicFileName(String fileProductPicFileName) {
		this.fileProductPicFileName = fileProductPicFileName;
	}

	/**
	 * 前台获取商品列表
	 */
	public String querycommdityList() {
		
		commodity.setC_sj(1);
		List<Commodity> commoditylist = this.commodityService
				.getLists(commodity);
		ServletActionContext.getContext().put("commditylist", commoditylist);
		if(commodity.getCommoditySort()!=null){
			this.sortid=String.valueOf(commodity.getCommoditySort().getCs_id());
		}
		return "commditylist";
	}
	private List<Commodity> commodities;
	
	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	/**
	 * 前台获取商品列表
	 */
	public String querycommdityListajax() {
		commodity.setC_sj(1);
		commodities = this.commodityService
				.getLists(commodity);
		return "querycommdityListajax";
	}

	/**
	 * 商品详情
	 */
	public String querycommodityinfo() {
		commodity = this.commodityService.findById(commodity);
		if (commodity.getC_id() != 0) {
			ServletActionContext.getContext().getValueStack().push(commodity);
			if (!commodity.getC_spimg().equals("")) {
				String[] imgliststr = commodity.getC_spimg().split(",");
				List<String> imglist = new ArrayList<String>();
				for (int i = 0; i < imgliststr.length; i++) {
					imglist.add(imgliststr[i]);
				}
				ServletActionContext.getContext().put("imglist", imglist);
			}
		}
		

		return "commodityinfo";
	}

	/**
	 * 验证商品编号唯一性
	 */
	public  String pncheck(){
		result="1";
		commodity=new Commodity();
		commodity.setC_spbh(g_id);
		List<Commodity> commoditylist=this.commodityService.getLists(commodity);
		if(commoditylist.size()>0){
			result="0";
		}
		return "save";
	}
	/**
	 * 修改商品状态 上架、下架
	 */
	public String upstatus(){
		String[] a=this.gysid.split(",");
		int cpid=0;
		
		int j=0;
		if(a.length<0){
			result="修改失败";
		}else{
			for (int i = 0; i < a.length; i++) {
				cpid=Integer.parseInt(a[i]);
				commodity=new Commodity();
				commodity.setC_id(cpid);
				this.commodity=this.commodityService.findById(commodity);
				if(Integer.parseInt(g_id)==1){
					commodity.setC_sj(1);
				}else if(Integer.parseInt(g_id)==2){
					commodity.setC_sj(2);
				}
				this.commodityService.save(commodity);
				j++;
			}
		if(a.length==j){
			result="修改成功";
		}
		}
		return "save";
	}
	/**
	 * 热销产品
	 * @return
	 */
	public String houtcommodity(){
		commodity=new Commodity();
		commodity.setC_sj(1);
		commodity.setC_scbs(1);
		CommodityStatus cs=new CommodityStatus();
		cs.setCs_id(5);
		commodity.setCommodityStatus(cs);
		commodities = this.commodityService
				.getLists(commodity);
		return "querycommdityListajax";
	}
	
	/**
	 * 记录点击数
	 */
	public String commoditycount(){
		commodity=this.commodityService.findById(commodity);
		if(commodity!=null){
			commodity.setC_djs(commodity.getC_djs()+1);
			this.commodityService.save(commodity);
		}
		return "save";
	}
	
	CommodityP cp;
	
	public CommodityP getCp() {
		return cp;
	}

	public void setCp(CommodityP cp) {
		this.cp = cp;
	}

	/**
	 * 添加商品属性
	 */
	public String addCommodityP(){
		if(this.statusid!=null){
		String str[]=statusid.split(",");
			if(str.length>0){
				for(int i=0;i<str.length;i++){
					String strs[]=str[i].split(":");
					cp=new CommodityP();
					cp.setCp_name(strs[0]);
					cp.setCp_context(strs[1]);
					cp.setCp_scbs(1);
					this.commodityPService.save(cp);
				}
			}
			this.sortid="1";
		}
		this.sortid="2";
			
		
		return "addCommodityPsuccess";
	}
	
	//获取上架商品数量和下架商品数量
	public String querycount(){
		result="";
		int num=this.commodityService.findlistcount(commodity);
		result=String.valueOf(num);
		return "save";
	}
	
	
	List<CommodityBrand> cblist;
	List<CommoditySort> cslist;
	List<CommodityStatus> csslist;
	List<CommodityLabel> clist;
	List<GYSInfo> gyslist;
	private java.util.Map<String , List> domap;
	
	
	
	public java.util.Map<String, List> getDomap() {
		return domap;
	}

	public void setDomap(java.util.Map<String, List> domap) {
		this.domap = domap;
	}

	public List<CommodityBrand> getCblist() {
		return cblist;
	}

	public void setCblist(List<CommodityBrand> cblist) {
		this.cblist = cblist;
	}

	public List<CommoditySort> getCslist() {
		return cslist;
	}

	public void setCslist(List<CommoditySort> cslist) {
		this.cslist = cslist;
	}

	public List<CommodityStatus> getCsslist() {
		return csslist;
	}

	public void setCsslist(List<CommodityStatus> csslist) {
		this.csslist = csslist;
	}

	public List<CommodityLabel> getClist() {
		return clist;
	}

	public void setClist(List<CommodityLabel> clist) {
		this.clist = clist;
	}

	public List<GYSInfo> getGyslist() {
		return gyslist;
	}

	public void setGyslist(List<GYSInfo> gyslist) {
		this.gyslist = gyslist;
	}

	//获取商品品牌、分类、标签、状态、供应商、
	public  String queryspBrand(){
		 cblist=this.commoditybrandService.findbrandlist();
		 cslist= this.commoditysortService.findParent();
		 csslist= this.commoditystatusService.findstatus();
		 clist= this.commodityLabelService.findbrandlist();
		 gyslist= this.gysService.findgyxlist();
		 domap=new HashMap<String, List>();
		 domap.put("cblist", cblist);
		 domap.put("cslist", cslist);
		 domap.put("csslist", csslist);
		 domap.put("clist", clist);
		 domap.put("gyslist", gyslist);
//		ServletActionContext.getContext().put("cblist",cblist);
//		ServletActionContext.getContext().put("cslist",cslist);
//		ServletActionContext.getContext().put("csslist",csslist);
//		ServletActionContext.getContext().put("clist",clist);
//		ServletActionContext.getContext().put("gyslist",gyslist);
		return "queryspBrandjson";
	}
	
	/**
	 * 跳转导入商品页面
	 * 获取商品品牌、分类、供应商信息
	 */
	public String toExpCommodity(){
		 gyslist= this.gysService.findgyxlist();
		 cblist=this.commoditybrandService.findbrandlist();
		 cslist= this.commoditysortService.findParent();
		return "toExpCommoditysuccess";
	}
	
	/**
	 * 生成商品导入模版
	 */
	public String downexcel(){
		
		writeExcel sd=new writeExcel(); 
		UUID uuid = UUID.randomUUID();
		result=uuid+".xls";//路径
		String resultss=ServletActionContext.getServletContext().getRealPath("/Template")+"/"+result;//路径
		sd.writeExcelBo(resultss, null,commodity.getCommodityBrand().getCb_id(),commodity.getCommoditySort().getCs_id(),commodity.getGysInfo().getG_id());
		return "downexcelsuccess";
	}
	
	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * 批量上传商品
	 */
	public String uploadcommdity(){
		if(fileProductPicFileName!=null){
			
			File newfile = new File(ServletActionContext.getServletContext().getRealPath("/Template")+"/"+fileProductPicFileName);
			copy(fileProductPic, newfile);
			System.out.println("文件上传成功");
			//解析excel
			ParseExcel ps=new ParseExcel();
			List<Commodity> commoditylist= ps.doexcel(ServletActionContext.getServletContext().getRealPath("/Template")+"/"+fileProductPicFileName);
			if(commoditylist.size()>0){
				for(int i=0;i<commoditylist.size();i++){
					this.commodityService.save(commoditylist.get(i));
				}
				result=String.valueOf(commoditylist.size());
			}
		}
			
		return "uploadcommditysuccess";
	}
	
	
	
	/**
	 * 商品批量导出
	 */
	public String doExpert(){
		writeExcel sd=new writeExcel(); 
		UUID uuid = UUID.randomUUID();
		result=uuid+".xls";//路径
		String resultss=ServletActionContext.getServletContext().getRealPath("/Template")+"/"+result;//路径
		List<Commodity> commoList=this.commodityService.getLists(commodity);
		sd.writeExcelBo(resultss, commoList,0,0,0);
		return "doExpertsuccess";
	}
	
	
	private List<CommodityType> ctlist;
	 
	public List<CommodityType> getCtlist() {
		return ctlist;
	}

	public void setCtlist(List<CommodityType> ctlist) {
		this.ctlist = ctlist;
	}

	/**
	 * 跳转添加商品规格页面
	 */
	public String toCommoditySpecpage(){
		CommodityType ct=new CommodityType();
		ct.setCt_id(Integer.parseInt(g_id));
		ctlist= this.commodityTypeService.findTypelistby(ct);
		result=result;
		return "toCommoditySpecpage";
	}
	
	
	/**
	 * 商品名称
	 */
	public String queryCommodity(){
		 commodity= this.commodityService.findById(commodity);
		 result=commodity.getC_name();
		return "save";
	}
	
	
}
