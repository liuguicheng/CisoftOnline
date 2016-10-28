package com.cisoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.User;
import com.cisoft.service.CommodityService;
import com.cisoft.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

public class WXCommodityAction extends Pages<Commodity> implements
ModelDriven<Commodity> {
	
	@Resource
	CommodityService commodityService;
	private Commodity commodity ;
	List<Commodity> commoditylist ;
	public Commodity getModel() {
		// TODO Auto-generated method stub
		return commodity;
	}
    private String bsid;
    
	
	public String getBsid() {
		return bsid;
	}

	public void setBsid(String bsid) {
		this.bsid = bsid;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public List<Commodity> getCommoditylist() {
		return commoditylist;
	}

	public void setCommoditylist(List<Commodity> commoditylist) {
		this.commoditylist = commoditylist;
	}
	@Resource
	private UserService userService;
	 private String cdbs;//判断惨淡标识
	    
	    
		public String getCdbs() {
			return cdbs;
		}

		public void setCdbs(String cdbs) {
			this.cdbs = cdbs;
		}
	
	private String scid;
	
	public String getScid() {
		return scid;
	}

	public void setScid(String scid) {
		this.scid = scid;
	}

	/**
	 * 前台获取商品列表
	 */
	public String querycommdityList() {
//		User user = (User) ServletActionContext.getRequest().getSession()
//				.getAttribute("usersession");
	   String opoenid= (String) ServletActionContext.getRequest().getSession()
				.getAttribute("useropenid");
		if(opoenid!=null){
			List<User> users=userService.findBywxbs(opoenid.toLowerCase().trim());
			if(users!=null){
				ServletActionContext.getRequest().getSession().setAttribute("usersession",users.get(0));
			}
		
			if(commodity==null){
			commodity=new Commodity();
		
			}else{
			
				if(commodity.getCommoditySort()!=null){
			  
					scid=	String.valueOf(commodity.getCommoditySort().getCs_id());
			}
		}
		commodity.setC_sj(1);
	    commoditylist = this.commodityService
				.getLists(commodity);
		}else{
			if(bsid!=null){
				//验证是否登录
				List<User> users=userService.findBywxbs(bsid.toLowerCase().trim());
				if(users.size()>0){
					System.out.println("wcxnontn＋用户标识别："+users.get(0).getUwx_gzbs());
					ServletActionContext.getRequest().getSession().removeAttribute("useropenid");
					ServletActionContext.getRequest().getSession().invalidate();
					ServletActionContext.getRequest().getSession().setAttribute("useropenid",bsid.toLowerCase().trim());
				}else{
					User user=new User();
					user.setUwx_bs(bsid.toLowerCase().trim());
					user.setU_scbs(1);
					user.setUwx_gzbs(0);
					userService.save(user);
					ServletActionContext.getRequest().getSession().removeAttribute("useropenid");
					ServletActionContext.getRequest().getSession().invalidate();
					ServletActionContext.getRequest().getSession().setAttribute("useropenid",bsid.toLowerCase().trim());
				}
				return "returnlist";
			}else{
				scid ="5";
				cdbs="5";
				System.out.println(scid);
				System.out.println("cdbs="+cdbs);
			return "wxlist";
			}
		}
		return "wxcommditylist";
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
		if(commodity==null){
			commodity=new Commodity();
		}
		commodity.setC_sj(1);
		commoditylist=commodityService.getLists(commodity);
		return "querywxcommdityListajax";
	}
    private Map<String, String> sxmap=new HashMap<String, String>();
    
    
    
	public Map<String, String> getSxmap() {
		return sxmap;
	}

	public void setSxmap(Map<String, String> sxmap) {
		this.sxmap = sxmap;
	}

	/**
	 * 商品详情
	 */
	public String querycommodityinfo() {
		commodity = this.commodityService.findById(commodity);
		System.out.println("商品详细id＝"+commodity.getC_id());
		if (commodity.getC_id() != 0) {
			if (!commodity.getC_spimg().equals("")) {
				String[] imgliststr = commodity.getC_spimg().split(",");
				List<String> imglist = new ArrayList<String>();
				for (int i = 0; i < imgliststr.length; i++) {
					imglist.add(imgliststr[i]);
				}
				ServletActionContext.getContext().put("imglist", imglist);
			}
			if(commodity.getC_wxms()!=null&&!"".equals(commodity.getC_wxms())){
				//商品属性
				String[] sts=commodity.getC_wxms().split(",");
				if(sts.length>0){
					for(int i=0;i<sts.length;i++){
						String s[]=sts[i].split(":");
						sxmap.put(s[0], s[1]);
					}
					
				}
			}
		}
		
		System.out.println("bsid="+bsid);
        if(bsid.equals("1")){
        	return "wxcommodityinfo";
        }else if(bsid.equals("2")){
        	//跳转商品属性详细页面
        	return "wxcommodityinfoxx";
        }
        return "error";
		
	}

	
	
	
	
}
