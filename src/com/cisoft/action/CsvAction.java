package com.cisoft.action;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.Purchase;
import com.cisoft.model.PurchasePayments;
import com.cisoft.model.PurchaseReceipt;
import com.cisoft.model.PurchaseReturn;
import com.cisoft.model.StockInventory;
import com.cisoft.model.Storeroom;
import com.cisoft.model.UserAddress;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.PurchasePaymentsService;
import com.cisoft.service.PurchaseReceiptService;
import com.cisoft.service.PurchaseReturnService;
import com.cisoft.service.PurchaseService;
import com.cisoft.service.StockInventoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 导出数据到csv文件
 * @author Luxh
 */
public class CsvAction extends ActionSupport {
    private static final long serialVersionUID = -2862629695443964658L;
    
    /**
     * 包含完整路径的文件名
     * 传递给下载Action进行下载
     */
    private String url;
    @Resource
	OrdersService ordersService;
    @Resource
	OrdersCommodityDetailsService ocdetailsService;
    @Resource
	StockInventoryService stockInventoryService;
	@Resource
	PurchaseService purchaseService;
	@Resource
	PurchasePaymentsService purchasepaymentsService;
	@Resource
	PurchaseReturnService purchasereturnService;
	@Resource
	PurchaseReceiptService purchasereceiptService;
	
	
    @JSON(serialize=false)
    public OrdersCommodityDetailsService getOcdetailsService() {
		return ocdetailsService;
	}


	public void setOcdetailsService(OrdersCommodityDetailsService ocdetailsService) {
		this.ocdetailsService = ocdetailsService;
	}


	public StockInventoryService getStockInventoryService() {
		return stockInventoryService;
	}


	@JSON(serialize=false)
    public OrdersService getOrdersService() {
		return ordersService;
	}


	public void setOrdersService(OrdersService ordersService) {
		this.ordersService = ordersService;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}
	
	@JSON(serialize=false)
	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	@JSON(serialize=false)
	public PurchasePaymentsService getPurchasepaymentsService() {
		return purchasepaymentsService;
	}

	@JSON(serialize=false)
	public PurchaseReturnService getPurchasereturnService() {
		return purchasereturnService;
	}


	/**
     * 导出数据
     */
    public String exportData2CSV() {
        List novels = getNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writeData2CSV(novels,path);
        url=filename;
        return SUCCESS;
        
    }
    
    private List<Map<String,String>> printlist;

	public List<Map<String, String>> getPrintlist() {
		return printlist;
	}


	public void setPrintlist(List<Map<String, String>> printlist) {
		this.printlist = printlist;
	}

	@JSON(serialize=false)
	public PurchaseReceiptService getPurchasereceiptService() {
		return purchasereceiptService;
	}


	/**
     * 打印内容查询
     * @return
     */
	public String printdata(){
		
		List novels = getNovels();
		if(novels.size()>0){
			printlist=new ArrayList<Map<String,String>>();
			for(int i=0;i<novels.size();i++){
				OrdersCommodityDetails ocds=(OrdersCommodityDetails) novels.get(i);
            	String bh=ocds.getOrder().getO_bh();
            	String spname=ocds.getCommodity().getC_name();
            	int spnum=ocds.getO_num();
            	double spdj=ocds.getCommodity().getC_jg();
            	String dgname=ocds.getOrder().getUseraddress().getUa_shName();
            	String dgdh=ocds.getOrder().getUseraddress().getUa_shDh();
            	String dgdh2=ocds.getOrder().getUseraddress().getUa_shDh();
            	String dgdz=ocds.getOrder().getUseraddress().getUa_address();
            	String dgtime=ocds.getOrder().getO_startTime();
            	String dgfl="";
            	int ddfl=ocds.getOrder().getO_sort();
            	if(ddfl==1){
            		dgfl="pc端下单";
            	}else if(ddfl==2){
            		dgfl="微信端下单";
            	}
            	Map<String,String> prinlmap=new HashMap();
            	
            	prinlmap.put("dgfl", dgfl);
            	prinlmap.put("dgtime", dgtime);
				prinlmap.put("dgdz", dgdz);
				prinlmap.put("dgdh2", dgdh2);
				prinlmap.put("dgdh", dgdh);
				prinlmap.put("dgname", dgname);
				prinlmap.put("spdj", String.valueOf(spdj));
				prinlmap.put("spnum", String.valueOf(spnum));
				prinlmap.put("spname", spname);
				prinlmap.put("bh", bh);
				prinlmap.put("id", String.valueOf((i+1)));
				printlist.add(prinlmap);
			}
		}
		return "printdatasuccess";
	}

    
    
    
    /**
     * 把数据按一定的格式写到csv文件中
     * @param novels     数据集合
     * @param fileName  csv文件完整路径
     */
    public void writeData2CSV(List novels,String fileName) {
    	 OutputStreamWriter osr=null;
        try {
             osr = new OutputStreamWriter(new FileOutputStream(fileName),"GBK");//输出  
            //输出标题头
            //注意列之间用","间隔,写完一行需要回车换行"rn"
            String title = "序号,订单编号,订购商品,订购数量,订购单价,订购用户名,订购用户电话,订购用户地址,订购日期,订单分类\r\n";
            osr.write(title);
            
            String content = null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(novels.size());
            for(int i=0;i<novels.size();i++) {
            	OrdersCommodityDetails ocds=(OrdersCommodityDetails) novels.get(i);
            	String bh=ocds.getOrder().getO_bh();
            	String spname=ocds.getCommodity().getC_name();
            	int spnum=ocds.getO_num();
            	double spdj=ocds.getCommodity().getC_jg();
            	String dgname=ocds.getOrder().getUseraddress().getUa_shName();
            	String dgdh=ocds.getOrder().getUseraddress().getUa_shDh();
            	String dgdh2=ocds.getOrder().getUseraddress().getUa_shDh();
            	String dgdz=ocds.getOrder().getUseraddress().getUa_address();
            	String dgtime=ocds.getOrder().getO_startTime();
            	String dgfl="";
            	int ddfl=ocds.getOrder().getO_sort();
            	if(ddfl==1){
            		dgfl="pc端下单";
            	}else if(ddfl==2){
            		dgfl="微信端下单";
            	}
            	String zt="";
                content =(i+1)+","+bh+","+spname+","+spnum+","+spdj+","+dgname+","+dgdh+"/"+dgdh2+","+dgdz+","+dgtime+","+dgfl+"\r\n";
                osr.write(content);
            }
        }catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally {
            try {
                if(osr!=null) {
                	osr.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /**
     * 构造一些数据
     * 实际上可能是从数据库中把大量的数据查出来
     */
	@JSON(serialize=false)
    private List getNovels() {
        ActionContext context=ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
	    List  list=new ArrayList();
		  try {
		      String id=request.getParameter("result"); 
		      if(id.equals("0")){
		    	  String truename=request.getParameter("truename");
		    	  String kddh=request.getParameter("shrdh");
		    	  String shrinfo=request.getParameter("shrdh");
		    	  String shrdh=request.getParameter("shrdh");
		    	  String shdz=request.getParameter("shdz");
		    	  String zts=request.getParameter("zts");
		    	  String xdstartime=request.getParameter("xdstartime");
		    	  String xdendtime=request.getParameter("xdendtime");
		    	  String fkstratime=request.getParameter("fkstratime");
		    	  String fkendtime=request.getParameter("fkendtime");
		    	  String sortid=request.getParameter("sortid");
		    	  OrdersCommodityDetails orders=new OrdersCommodityDetails(); 
		    	  Orders or=new Orders();
		    	  or.setO_sort(Integer.parseInt(sortid));
		    	  or.setO_bh(truename);
		    	  or.setO_status(Integer.parseInt(zts));
		    	  UserAddress ua=new UserAddress();
		    	  ua.setUa_address(shdz);
		    	  ua.setUa_shDh(shrdh);
		    	  ua.setUa_shName(shrinfo);
		    	  or.setUseraddress(ua);
		    	  orders.setOrder(or);
		    	  list=this.ocdetailsService.queryList(orders, xdstartime, xdendtime, fkstratime, fkendtime, kddh);
		      }else{
		    	  list=  this.ocdetailsService.findByids(id);
		      }
		      
		  }catch(Exception e){
			  e.printStackTrace();
		  }
        
        return list;
    }
	
	
	/**
     * 查询库存导出数据
     */
	@JSON(serialize=false)
    private List getkcNovels() {
        ActionContext context=ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
	    List  list=new ArrayList();
		  try {
		    	  String truename=request.getParameter("truename");
		    	  String s_id=request.getParameter("s_id");//库房
		    	  String xdstartime=request.getParameter("xdstartime");
		    	  String xdendtime=request.getParameter("xdendtime");
		    	  String fkstratime=request.getParameter("fkstratime");
		    	  String fkendtime=request.getParameter("fkendtime");
		    	  String status=request.getParameter("status");//状态1、入库 2 出库
		    	  StockInventory stockInventory=new StockInventory();
		    	  stockInventory.setSi_zt(Integer.parseInt(status));
		    	  if(!"undefined".equals(s_id)){
		    	  Storeroom storeroom =new Storeroom();
		    	  storeroom.setS_id(Integer.parseInt(s_id));
		    	  stockInventory.setStoreroom(storeroom);
		    	  }
		    	  Commodity commodity =new Commodity();
		    	  commodity.setC_name(truename);
		    	  stockInventory.setCommodity(commodity);
		    	  list=stockInventoryService.queryList(stockInventory, xdstartime, xdendtime, fkstratime, fkendtime);
		      
		      
		  }catch(Exception e){
			  e.printStackTrace();
		  }
        
        return list;
    }
	
	
	 /**
     * 库存转入scv
     */
    public void writekcData2CSV(List novels,String fileName) {
    	 OutputStreamWriter osr=null;
        try {
             osr = new OutputStreamWriter(new FileOutputStream(fileName),"GBK");//输出  
            //输出标题头
            //注意列之间用","间隔,写完一行需要回车换行"rn"
            String title = "序号,商品名称,库存,入库时间,最后出库时间,所属库房\r\n";
            osr.write(title);
            
            String content = null;
            System.out.println(novels.size());
            for(int i=0;i<novels.size();i++) {
            	StockInventory si=(StockInventory) novels.get(i);
            	String spname=si.getCommodity().getC_name();
            	int kc=si.getSi_smsl();
            	Date rktime=si.getSi_date();
            	Date cktime=si.getSi_lastckdate();
            	String kf=si.getStoreroom().getStorehouse().getSh_name()+" "+si.getStoreroom().getS_name();
            	
                content =(i+1)+","+spname+","+kc+","+rktime+","+cktime+","+kf+"\r\n";
                osr.write(content);
            }
        }catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally {
            try {
                if(osr!=null) {
                	osr.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /**
     * 库存导出数据
     */
    public String exportkcData2CSV() {
        List novels =this.getkcNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/kc"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writekcData2CSV(novels,path);
        url=filename;
        return SUCCESS;
        
    }
    
    
    
    /**
     * 打印内容查询（库存）
     * @return
     */
	public String kcprintdata(){
		
		List novels = getkcNovels();
		if(novels.size()>0){
			printlist=new ArrayList<Map<String,String>>();
			for(int i=0;i<novels.size();i++){
				StockInventory si=(StockInventory) novels.get(i);
            	String spname=si.getCommodity().getC_name();
            	int kc=si.getSi_smsl();
            	Date rktime=si.getSi_date();
            	Date cktime=si.getSi_lastckdate();
            	String kf=si.getStoreroom().getStorehouse().getSh_name()+" "+si.getStoreroom().getS_name();
            	Map<String,String> prinlmap=new HashMap();
            	
            	prinlmap.put("spname", spname);
            	prinlmap.put("kc",String.valueOf(kc));
				prinlmap.put("rktime", rktime.toString());
				if(cktime!=null){
					prinlmap.put("cktime", cktime.toString());
				}else{
					prinlmap.put("cktime", "");	
				}
				prinlmap.put("kf", kf);
				prinlmap.put("id", String.valueOf((i+1)));
				printlist.add(prinlmap);
			}
		}
		return "printdatasuccess";
	}
	
	
	/**
	 * 采购订单 导出
	 */
	public String exportcgorderData2CSV(){
		List novels =this.getcgorderNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/cgorders"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writekccgorderData2CSV(novels,path);
        url=filename;
        return SUCCESS;
	}


	private void writekccgorderData2CSV(List novels, String path) {
		// TODO Auto-generated method stub
		 OutputStreamWriter osr=null;
	        try {
	             osr = new OutputStreamWriter(new FileOutputStream(path),"GBK");//输出  
	            //输出标题头
	            //注意列之间用","间隔,写完一行需要回车换行"rn"
	            String title = "序号,采购单号,采购日期,仓库－库房,最新状态\r\n";
	            osr.write(title);
	            
	            String content = null;
	            System.out.println(novels.size());
	            for(int i=0;i<novels.size();i++) {
	            	Purchase prc=(Purchase) novels.get(i);       
	            	String cgno=prc.getP_no();
	            	String cgdate=prc.getP_cgDate().toString();
	            	String cgck=prc.getStoreroom().getStorehouse().getSh_name()+"-"+prc.getStoreroom().getS_name();
	            	int ztid=prc.getP_zt();
	            	String ztstr="";
	            	if(ztid==1){
	            		ztstr="未付款";
	            	}else if(ztid==2){
	            		ztstr="未收货";
	            	}else if(ztid==3){
	            		ztstr="已收货";
	            	}else if(ztid==4){
	            		ztstr="已退货";
	            	}
	                content =(i+1)+","+cgno+","+cgdate+","+cgck+","+ztstr+"\r\n";
	                osr.write(content);
	            }
	        }catch(Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException(e);
	        }finally {
	            try {
	                if(osr!=null) {
	                	osr.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	}


	private List getcgorderNovels() {
		 ActionContext context=ActionContext.getContext();  
		    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
		    List  list=new ArrayList();
			  try {
			    	  String truename=request.getParameter("truename");
			    	  String p_zt=request.getParameter("p_zt");//
			    	  String xdstartime=request.getParameter("xdstartime");
			    	  String xdendtime=request.getParameter("xdendtime");
			    	  String s_id=request.getParameter("s_id");//状态1、入库 2 出库
			    	  Purchase gys=new Purchase();
			    	  gys.setP_no(truename.trim());
			    	  gys.setP_zt(Integer.parseInt(p_zt));
			    	  if(s_id!=null){
			    		  Storeroom st=new Storeroom();
			    		  st.setS_id(Integer.parseInt(s_id));
			    		  gys.setStoreroom(st);
			    	  }
			    	list=  purchaseService.findpcorder(gys,xdstartime,xdendtime);
			  }catch(Exception e){
				  e.printStackTrace();
			  }
	        
	        return list;
	}
	
	/**
	 * 采购统计订单打印内容
	 */
	public String printcgorderdata(){
			
			List novels =getcgorderNovels();
			if(novels.size()>0){
				printlist=new ArrayList<Map<String,String>>();
				for(int i=0;i<novels.size();i++){
					Purchase prc=(Purchase) novels.get(i);       
	            	String cgno=prc.getP_no();
	            	String cgdate=prc.getP_cgDate().toString();
	            	String cgck=prc.getStoreroom().getStorehouse().getSh_name()+"-"+prc.getStoreroom().getS_name();
	            	int ztid=prc.getP_zt();
	            	String ztstr="";
	            	if(ztid==1){
	            		ztstr="未付款";
	            	}else if(ztid==2){
	            		ztstr="未收货";
	            	}else if(ztid==3){
	            		ztstr="已收货";
	            	}else if(ztid==4){
	            		ztstr="已退货";
	            	}else{
	            		ztstr="";
	            	}
	            	Map<String,String> prinlmap=new HashMap();
	            	
	            	prinlmap.put("cgno", cgno);
	            	prinlmap.put("cgdate", cgdate);
					prinlmap.put("cgck", cgck);
					prinlmap.put("ztstr", ztstr);
					prinlmap.put("id", String.valueOf((i+1)));
					printlist.add(prinlmap);
				}
			}
			return "printdatasuccess";
	}
	
	/**
	 * 采购付款-导出
	 */
	public String exportcgfkData2CSV(){
		List novels =this.getcgfkNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/cgfk"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writekccgfkData2CSV(novels,path);
        url=filename;
        return SUCCESS;
	}


	private void writekccgfkData2CSV(List novels, String path) {
		// TODO Auto-generated method stub
				 OutputStreamWriter osr=null;
			        try {
			             osr = new OutputStreamWriter(new FileOutputStream(path),"GBK");//输出  
			            //输出标题头
			            //注意列之间用","间隔,写完一行需要回车换行"rn"
			            String title = "序号,采购单号,付款日期,付款金额,付款类型\r\n";
			            osr.write(title);
			            
			            String content = null;
			            System.out.println(novels.size());
			            for(int i=0;i<novels.size();i++) {
			            	PurchasePayments gys=(PurchasePayments) novels.get(i);    
			            	String ppno=gys.getPp_no();
			            	String pptime=gys.getPp_fkdate().toString();
			            	String ppje=String.valueOf(gys.getPp_fjje());
			            	int fklx= gys.getPp_zflx();
			            	String ztstr="";
			            	if(fklx==1){
			            		ztstr="网银转账";
			            	}else if(fklx==2){
			            		ztstr="现金支付";
			            	}
			                content =(i+1)+","+ppno+","+ppno+","+ppno+","+ztstr+"\r\n";
			                osr.write(content);
			            }
			        }catch(Exception e) {
			            e.printStackTrace();
			            throw new RuntimeException(e);
			        }finally {
			            try {
			                if(osr!=null) {
			                	osr.close();
			                }
			            } catch (IOException e) {
			                e.printStackTrace();
			            }
			        }
	}


	private List getcgfkNovels() {
		ActionContext context=ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
	    List  list=new ArrayList();
		  try {
		    	  String truename=request.getParameter("truename");
		    	  String pp_zflx=request.getParameter("pp_zflx");//
		    	  String xdstartime=request.getParameter("xdstartime");
		    	  String xdendtime=request.getParameter("xdendtime");
		    	  PurchasePayments gys=new PurchasePayments();
		    	  gys.setPp_no(truename);
		    	  gys.setPp_zflx(Integer.parseInt(pp_zflx));
		    	  list=  this.purchasepaymentsService.findlistby(gys,xdstartime,xdendtime);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
        
        return list;
	}
	
	public String printcgfkdata(){
		List novels =getcgfkNovels();
		if(novels.size()>0){
			printlist=new ArrayList<Map<String,String>>();
			for(int i=0;i<novels.size();i++){
				PurchasePayments gys=(PurchasePayments) novels.get(i);    
            	String ppno=gys.getPp_no();
            	String pptime=gys.getPp_fkdate().toString();
            	String ppje=String.valueOf(gys.getPp_dfje());
            	int fklx= gys.getPp_zflx();
            	String ztstr="";
            	if(fklx==1){
            		ztstr="网银转账";
            	}else if(fklx==2){
            		ztstr="现金支付";
            	}
            	Map<String,String> prinlmap=new HashMap();
            	
            	prinlmap.put("ppno", ppno);
            	prinlmap.put("pptime", pptime);
				prinlmap.put("ppje", ppje);
				prinlmap.put("ztstr", ztstr);
				prinlmap.put("id", String.valueOf((i+1)));
				printlist.add(prinlmap);
			}
		}
		return "printdatasuccess";
	}
	
	//退货导出
	public String exportcgthData2CSV(){
		List novels =this.getcgthNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/cgth"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writekccgthData2CSV(novels,path);
        url=filename;
        return SUCCESS;
	}


	private void writekccgthData2CSV(List novels, String path) {
		 OutputStreamWriter osr=null;
	        try {
	             osr = new OutputStreamWriter(new FileOutputStream(path),"GBK");//输出  
	            //输出标题头
	            //注意列之间用","间隔,写完一行需要回车换行"rn"
	            String title = "序号,采购单号,退货日期,退货人,备注\r\n";
	            osr.write(title);
	            
	            String content = null;
	            System.out.println(novels.size());
	            for(int i=0;i<novels.size();i++) {
	            	PurchaseReturn pr=(PurchaseReturn) novels.get(i);
	            	String no=pr.getPr_no();
	            	String time=pr.getPr_shdate().toString();
	            	String thr=pr.getPr_username();
	            	String bz=pr.getPr_bz();
	                content =(i+1)+","+no+","+time+","+thr+","+bz+"\r\n";
	                osr.write(content);
	            }
	        }catch(Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException(e);
	        }finally {
	            try {
	                if(osr!=null) {
	                	osr.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }		
	}


	private List getcgthNovels() {
		ActionContext context=ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
	    List  list=new ArrayList();
		  try {
		    	  String truename=request.getParameter("truename");
		    	  String xdstartime=request.getParameter("xdstartime");
		    	  String xdendtime=request.getParameter("xdendtime");
		    	  PurchaseReturn pr=new PurchaseReturn();
		    	  pr.setPr_no(truename);
		    	  list= purchasereturnService.findlist(pr,xdstartime,xdendtime);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
        
        return list;
	}
	//退货统打印
	public String printcgthdata(){
		List novels =getcgthNovels();
		if(novels.size()>0){
			printlist=new ArrayList<Map<String,String>>();
			for(int i=0;i<novels.size();i++){
				PurchaseReturn pr=(PurchaseReturn) novels.get(i);
            	String no=pr.getPr_no();
            	String time=pr.getPr_shdate().toString();
            	String thr=pr.getPr_username();
            	String bz=pr.getPr_bz();
            	
            	Map<String,String> prinlmap=new HashMap();
            	
            	prinlmap.put("no", no);
            	prinlmap.put("time", time);
				prinlmap.put("thr", thr);
				prinlmap.put("bz", bz);
				prinlmap.put("id", String.valueOf((i+1)));
				printlist.add(prinlmap);
			}
		}
		return "printdatasuccess";
	}
	
	/**
	 * 收货
	 * 
	 */
	public String exportcgshData2CSV(){
		List novels =this.getcgshNovels();
        ActionContext ac = ActionContext.getContext();   
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);   
		  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String time=sdf.format(new Date());
		String filename="expertimg/cgsh"+time+".csv";
		String path = sc.getRealPath("/")+filename;
        writekccgshData2CSV(novels,path);
        url=filename;
        return SUCCESS;
	}


	private void writekccgshData2CSV(List novels, String path) {
		OutputStreamWriter osr=null;
        try {
             osr = new OutputStreamWriter(new FileOutputStream(path),"GBK");//输出  
            //输出标题头
            //注意列之间用","间隔,写完一行需要回车换行"rn"
            String title = "序号,采购单号,收货日期,收货人,备注\r\n";
            osr.write(title);
            
            String content = null;
            System.out.println(novels.size());
            for(int i=0;i<novels.size();i++) {
            	PurchaseReceipt pr=(PurchaseReceipt) novels.get(i);
            	String no=pr.getPr_no();
            	String time=pr.getPr_shdate().toString();
            	String thr=pr.getPr_username();
            	String bz=pr.getPr_bz();
                content =(i+1)+","+no+","+time+","+thr+","+bz+"\r\n";
                osr.write(content);
            }
        }catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally {
            try {
                if(osr!=null) {
                	osr.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }			
	}


	private List getcgshNovels() {
		ActionContext context=ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST); 
	    List  list=new ArrayList();
		  try {
		    	  String truename=request.getParameter("truename");
		    	  String xdstartime=request.getParameter("xdstartime");
		    	  String xdendtime=request.getParameter("xdendtime");
		    	  PurchaseReturn pr=new PurchaseReturn();
		    	  pr.setPr_no(truename);
		    	  list= this.purchasereceiptService.findlist(pr,xdstartime,xdendtime);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
        
        return list;
	}
	public String printcgshdata(){
		List novels =getcgshNovels();
		if(novels.size()>0){
			printlist=new ArrayList<Map<String,String>>();
			for(int i=0;i<novels.size();i++){
				PurchaseReceipt pr=(PurchaseReceipt) novels.get(i);
            	String no=pr.getPr_no();
            	String time=pr.getPr_shdate().toString();
            	String thr=pr.getPr_username();
            	String bz=pr.getPr_bz();
            	
            	Map<String,String> prinlmap=new HashMap();
            	
            	prinlmap.put("no", no);
            	prinlmap.put("time", time);
				prinlmap.put("thr", thr);
				prinlmap.put("bz", bz);
				prinlmap.put("id", String.valueOf((i+1)));
				printlist.add(prinlmap);
			}
		}
		return "printdatasuccess";
	}
	
}