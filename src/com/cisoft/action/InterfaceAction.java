package com.cisoft.action;

import com.cisoft.utils.MD5Unit;
/**
 * 对外接口action
 */
public class InterfaceAction {
	
	/**
	 * 写数据接口
	 * @param interfaceIdentification
	 *            接口标识
	 * @param userIdentification
	 *            调用用户标识
	 * @param interfaceMD5
	 *            调用加密
	 * @param returnIdentification
	 *            返回标识
	 * @param queryXmlDoc 传参数           
	 * @return 返回
	 */
	public String WriteInterface() {
		String returnxml = "";

		return returnxml;
	}
	
	

	/**
	 * 查询接口
	 * @param interfaceIdentification
	 *            接口标识
	 * @param userIdentification
	 *            调用用户标识
	 * @param interfaceMD5
	 *            调用加密
	 * @param returnIdentification
	 *            返回标识
	 * @param queryXmlDoc 传参数           
	 * @return 返回
	 */
	public String ReadInterface() {
		
		if(interfaceIdentification!=null){
			if(!interfaceIdentification.equals("")){
				//解析接口标识
				String bsstr[]=interfaceIdentification.split("&");
				switch (Integer.parseInt(bsstr[0])) {
				case 01:
					//微信版
					if(userIdentification.equals("01wxcx")){
						//验证访问用户
						//解析密钥
						String md5jx=doPasswordEncryption(queryXmlDoc,userIdentification);
						//验证加密密钥
						if(!interfaceMD5.equals(md5jx)){
							//验证失败返回错误提示
							returnxml="<?xml version=\"1.0\" encoding=\"UTF-8\" ?><objects>" +
									"<zt>-1</zt>"+
									"<result>接口密钥错误</result>" +
									"</objects>";
							break;
						}else{
							
							if(bsstr[1].equals("splb")){
								//商品列表
								queryXmlDoc=queryXmlDoc;
								returnIdentification=returnIdentification;
								return "interface_splb";
							}else if(bsstr[1].equals("spxq")){
								//商品详细
							}else if(bsstr[1].equals("ddlb")){
								//订单列表
							}else if(bsstr[1].equals("ddxq")){
								//订单详细
							}else if(bsstr[1].equals("gwclb")){
								//购物车列表
							}else if(bsstr[1].equals("gwcxq")){
								//购物车详细
							}else if(bsstr[1].equals("shdzlb")){
								//收货地址列表
							}else if(bsstr[1].equals("shdzxq")){
								//收货地址详细
							}
						}
					}else{
						//访问用户名错误
						returnxml="<?xml version=\"1.0\" encoding=\"UTF-8\" ?><objects>" +
								"<zt>-1</zt>"+
								"<result>接口用户错误</result>" +
								"</objects>";
						break;
					}
					break;
				case 02:
					//android版
					break;
				case 03:
					//iphone 版
					
					break;
				default:
					break;
				}
				
			}
		}

		return "success";
	}

	//密钥加密md5
	private String doPasswordEncryption(String queryXmlDoc,
			String userIdentification) {
		
		String md5jm="";
		try{
			String queryxml=queryXmlDoc.substring(20,45)+userIdentification;
			md5jm=MD5Unit.md5(queryxml);
		}catch(Exception e){
			e.printStackTrace();
		}
		return md5jm;
	}
	
	
	private String returnxml;
	private String interfaceIdentification;
	private String userIdentification;
	private String interfaceMD5;
	private String returnIdentification;
	private String queryXmlDoc;
	
	
	public String getReturnxml() {
		return returnxml;
	}

	public void setReturnxml(String returnxml) {
		this.returnxml = returnxml;
	}

	public String getInterfaceIdentification() {
		return interfaceIdentification;
	}

	public void setInterfaceIdentification(String interfaceIdentification) {
		this.interfaceIdentification = interfaceIdentification;
	}

	public String getUserIdentification() {
		return userIdentification;
	}

	public void setUserIdentification(String userIdentification) {
		this.userIdentification = userIdentification;
	}

	public String getInterfaceMD5() {
		return interfaceMD5;
	}

	public void setInterfaceMD5(String interfaceMD5) {
		this.interfaceMD5 = interfaceMD5;
	}

	public String getReturnIdentification() {
		return returnIdentification;
	}

	public void setReturnIdentification(String returnIdentification) {
		this.returnIdentification = returnIdentification;
	}

	public String getQueryXmlDoc() {
		return queryXmlDoc;
	}

	public void setQueryXmlDoc(String queryXmlDoc) {
		this.queryXmlDoc = queryXmlDoc;
	}
}
