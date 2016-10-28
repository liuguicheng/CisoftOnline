package com.cisoft.action;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.cisoft.model.Commodity;
import com.cisoft.model.Orders;
import com.cisoft.model.OrdersCommodityDetails;
import com.cisoft.model.OrdersRecord;
import com.cisoft.model.ShoppingCart;
import com.cisoft.model.User;
import com.cisoft.model.UserAddress;
import com.cisoft.service.BigDecimalDemo;
import com.cisoft.service.CommodityService;
import com.cisoft.service.OrdersCommodityDetailsService;
import com.cisoft.service.OrdersRecordService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.ShoppingCarService;
import com.cisoft.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

public class ShoppingCarAction extends Pages<ShoppingCart> implements
		ModelDriven<ShoppingCart> {

	private ShoppingCart shoppingCart = new ShoppingCart();
	private String g_id;

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public ShoppingCart getModel() {
		// TODO Auto-generated method stub
		return shoppingCart;
	}

	@Resource
	ShoppingCarService shoppingCarService;
	@Resource
	OrdersService ordersService;
	@Resource
	CommodityService commodityService;
	@Resource
	OrdersRecordService ordersrecordService;
	@Resource
	private UserService userService;
	@Resource
	OrdersCommodityDetailsService ocdetailsService;
	private String result = "";

	public String getResult() {
		return result;
	}

	public String getList() {
		pageResponse.setRows(shoppingCarService.getList(shoppingCart));
		pageResponse.setTotal(shoppingCarService.getCount(shoppingCart));
		return "list";
	}

	private String num;
	private String type;
    private String c_id;
	@JSON(serialize = false)
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@JSON(serialize = false)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	@JSON(serialize = false)
	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String save() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		Commodity commodity=new Commodity();
		commodity.setC_id(Integer.parseInt(c_id));
		ShoppingCart shoppingCartinfo= new ShoppingCart();
		shoppingCartinfo.setUser(user);
		shoppingCartinfo.setCommodity(commodity);
		shoppingcarlist=shoppingCarService.getLists(shoppingCartinfo);
		if(shoppingcarlist.size()>0){
			shoppingCartinfo=shoppingcarlist.get(0);
			if(shoppingCartinfo!=null){
				shoppingCartinfo.getOrdetail().setO_num(Integer.parseInt(num)+shoppingCartinfo.getOrdetail().getO_num());
				shoppingCartinfo.getOrdetail().setO_zjg(shoppingCartinfo.getOrdetail().getO_num()*shoppingCartinfo.getOrdetail().getCommodity().getC_jg());
				ocdetailsService.save(shoppingCartinfo.getOrdetail());
				if (type.equals("1")) {
					msg = "1";
					result = "添加购物车成功";
				} else if (type.equals("2")) {
					msg="2";
				}
				return "save";
			}
		}else{
		//创建订单商品明细
		OrdersCommodityDetails orcdetail=scorder(Integer.parseInt(c_id),Integer.parseInt(num));
		if(orcdetail!=null){
			shoppingCart.setSc_scbs(1);
			shoppingCart.setUser(user);
			shoppingCart.setCommodity(orcdetail.getCommodity());
			shoppingCart.setOrdetail(orcdetail);
			shoppingCarService.save(shoppingCart);
			if (type.equals("1")) {
				msg = "1";
				result = "添加购物车成功";
			} else if (type.equals("2")) {
				msg="2";
			}
			return "save";
		}
		}
		return "";
		

		
	}

	public String addView() {
		return "addView";
	}

	public String editView() {
		shoppingCart = shoppingCarService.findById(shoppingCart);
		ServletActionContext.getContext().getValueStack().push(shoppingCart);
		return "editView";
	}

	// 修改信息
	public String updatepwd() {
		result = "修改成功";
		return "updatepwd";
	}

	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete() {
		ShoppingCart shoppingCarts = shoppingCarService.findById(shoppingCart);
		shoppingCarts.setSc_scbs(0);
		shoppingCarService.save(shoppingCarts);
		msg = "删除成功";
		result = "删除成功";
		return "delete";
	}

	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * 前台功能 添加购物车
	 */
	public String addgwc() {
		try {
			shoppingCart.setSc_scbs(1);
			User user = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("usersession");
			shoppingCart.setUser(user);
			shoppingCarService.save(shoppingCart);
			msg = "添加成功";
		} catch (Exception e) {

		}
		return "addgwc";
	}

	private List<ShoppingCart> shoppingcarlist;

	@JSON(serialize = false)
	public List<ShoppingCart> getShoppingcarlist() {
		return shoppingcarlist;
	}

	public void setShoppingcarlist(List<ShoppingCart> shoppingcarlist) {
		this.shoppingcarlist = shoppingcarlist;
	}

	/**
	 * 查看购物车
	 */
	public String querygwclist() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		shoppingCart=new ShoppingCart();
		shoppingCart.setUser(user);
		shoppingcarlist = this.shoppingCarService.getLists(shoppingCart);
		ServletActionContext.getContext().put("shoppingcarlist", shoppingcarlist);
		
		//获取收货地址
		UserAddress userAddress=new UserAddress();
		userAddress.setUser(user);
		userAddress.setUa_status(-1);
		List<UserAddress> useraddress=this.userService.findByUserAddressbyuser(userAddress);
		ServletActionContext.getContext().put("useraddress", useraddress);
		
		return "querygwclist_1";
	}
	/**
	 * 查看购物车商品数量
	 */
	public String querygwccount() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		if(user==null){
			c_id="0";
		}else{
		shoppingCart=new ShoppingCart();
		shoppingCart.setUser(user);
		int num=this.shoppingCarService.getCount(shoppingCart);
		c_id=String.valueOf(num);
		}
		return "querygwccount";
	}

	/**
	 * 删除商品
	 */
	public String deletegwc() {
		String[] a=c_id.split(",");
		int cpid;
		int j=0;
		if(a.length<0){
			deletedd(Integer.parseInt(c_id));	
			msg = "删除成功";
			return "deletegwc";
		}else{
			for (int i = 0; i < a.length; i++) {
				cpid=Integer.parseInt(a[i]);
				//删除购物车
				deletedd(cpid);
				 j++;
			}
		if(a.length==j){
			msg = "删除成功";
			return "deletegwc";
		}
		
		}
		msg = "删除失败";
		return "deletegwc";
	}
	/**
	 * 用户删除订单
	 * @param cpid
	 */
	private void deletedd(int cpid){
		//删除购物车
		shoppingCart=new ShoppingCart();
		shoppingCart.setSc_id(cpid);
		ShoppingCart shoppingCarts = shoppingCarService.findById(shoppingCart);
		shoppingCarts.setSc_scbs(0);
		shoppingCarService.save(shoppingCarts);
//		//设置订单步骤
//		addorderrecord(shoppingCarts.getOrders(),3);
//		//删除订单
//		 Orders orders= this.ordersService.findById(shoppingCarts.getOrders());
//		 orders.setO_scbs(0);
//		 this.ordersService.save(orders);
	}

	/**
	 * 创建订单－商品明细
	 * 
	 * @param c_id 商品id
	 */
//	private Orders scorder(int c_id,int num) {
//		// 获取用户信息
//		User user = (User) ServletActionContext.getRequest().getSession()
//							.getAttribute("usersession");
//		// 获取商品信息
//		Commodity commodity = new Commodity();
//		commodity.setC_id(c_id);
//		commodity = commodityService.findById(commodity);
//		if (commodity != null) {
////			//添加订单记录
////			Orders orders = new Orders();
////			orders.setO_scbs(1);
////			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////			orders.setO_startTime(s.format(new Date()));
////			orders.setO_status(6);
////			orders.setUser(user);
////			this.ordersService.save(orders);
//			
//			//添加订单明细
//			OrdersCommodityDetails orcdetail=new OrdersCommodityDetails();
//			orcdetail.setCommodity(commodity);
//			orcdetail.setO_num(num);
//			orcdetail.setO_scbs(1);
//			this.ocdetailsService.save(orcdetail);
//			
//			// 添加订单操作记录
////			addorderrecord(orders, 6);
//			return orders;
//		}
//		return null;
//	}
	/**
	 * 创建订单－商品明细
	 * 
	 * @param c_id 商品id
	 */
	private OrdersCommodityDetails scorder(int c_id,int num) {
		// 获取用户信息
		User user = (User) ServletActionContext.getRequest().getSession()
							.getAttribute("usersession");
		// 获取商品信息
		Commodity commodity = new Commodity();
		commodity.setC_id(c_id);
		commodity = commodityService.findById(commodity);
		if (commodity != null) {
			
			//添加订单明细
			OrdersCommodityDetails orcdetail=new OrdersCommodityDetails();
			orcdetail.setCommodity(commodity);
			orcdetail.setO_num(num);
			orcdetail.setO_scbs(1);
			orcdetail.setUser(user);
			double zjg=num*commodity.getC_jg();
			orcdetail.setO_zjg(zjg);
			this.ocdetailsService.save(orcdetail);
			return orcdetail;
		}
		return null;
	}
	
	
	// 添加订单操作记录
	private void addorderrecord(Orders order, int step) {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("usersession");
		OrdersRecord orecord = new OrdersRecord();
		orecord.setOr_scbs(1);
		orecord.setOr_step(step);
		orecord.setOr_szsj(new Date());
		orecord.setOrders(order);
		orecord.setUser(user);
		orecord.setOr_czr(user.getU_zsName());
		ordersrecordService.save(orecord);
	}

	/**
	 * 用户结算
	 * @return
	 */
	public String yhjs(){
		return "";
	}
	
	/**
	 * 确认订单
	 * 
	 */
	public String qrorder(){
		//商品列表
		queryjsorder();
		//收货地址列表
		queryuseraddress();
		
		return "qrorder_1";
	}
	//用户地址
	private void queryuseraddress(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		UserAddress userAddress=new UserAddress();
		userAddress.setUser(user);
		userAddress.setUa_status(-1);
		List<UserAddress> useraddress=this.userService.findByUserAddressbyuser(userAddress);
		ServletActionContext.getContext().put("useraddress", useraddress);
	}
	//需要提交结算的订单
	private void queryjsorder(){
//		List<Orders> jsorderlist=this.ordersService.findjsorders(c_id);
//		ServletActionContext.getContext().put("orderslist", jsorderlist);
		BigDecimalDemo bdouble=new BigDecimalDemo();
		List<OrdersCommodityDetails> jsorderlist=ocdetailsService.findByids(c_id);
		String[] num=null;
		if(numid!=null){
			num=numid.split(",");
		}
		if(jsorderlist.size()>0){
			c_id="";
			this.g_id="";
		for(int i=0;i<jsorderlist.size();i++){
			c_id+=jsorderlist.get(i).getCommodity().getC_id()+",";
			g_id+=jsorderlist.get(i).getO_id()+",";
			if(num!=null){
			OrdersCommodityDetails orc=jsorderlist.get(i);
			orc.setO_num(Integer.parseInt(num[i]));
//			double jg=bdouble.add(0.01, orc.getO_num()*orc.getCommodity().getC_jg());
			orc.setO_zjg(orc.getO_num()*orc.getCommodity().getC_jg());
			this.ocdetailsService.save(orc);
			}
		}
		ServletActionContext.getContext().getValueStack().push(c_id);
		ServletActionContext.getContext().getValueStack().push(g_id);
		
		}
		ServletActionContext.getContext().put("orderslist", jsorderlist);
	}
	
	private String numid;

	public void setNumid(String numid) {
		this.numid = numid;
	}
	
	//计算运费
	public  String jsyf(){
		List<OrdersCommodityDetails> jsorderlist=ocdetailsService.findByids(c_id);
		msg="0.00";
		String[] num=null;
		if(numid!=null){
			num=numid.split(",");
		}
		
		double zyf=0;
		if(jsorderlist.size()>0){
			for(int i=0;i<jsorderlist.size();i++){
				if(num!=null){
				OrdersCommodityDetails ocd=jsorderlist.get(0);
				//单价
				double dj= ocd.getCommodity().getC_zl();
				//单个选中商品邮费
				double dgyf=dj*Integer.parseInt(num[i]);
				//总邮费
				zyf+=dgyf;
				}
				
			}
			
			msg= String.valueOf(zyf);
		}
		
		return "deletegwc";
	}
	
	
}
