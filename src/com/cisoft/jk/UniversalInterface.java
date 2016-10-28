package com.cisoft.jk;

import com.cisoft.utils.MD5Unit;

/**
 * 100南宁通用接口
 * 
 * @author lgc write read
 */
public class UniversalInterface {

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
	public String WriteInterface(String interfaceIdentification,
			String userIdentification, String interfaceMD5,
			String returnIdentification,String queryXmlDoc) {
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
	public String ReadInterface(String interfaceIdentification,
			String userIdentification, String interfaceMD5,
			String returnIdentification,String queryXmlDoc) {
		String returnxml = "";
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
								//WxSelectAction sc=new WxSelectAction();
								//returnxml=sc.quyercommoditylist(queryXmlDoc,returnIdentification);
							    break;
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
		
		
		

		return returnxml;
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


}
