package com.cisoft.weixin;

import com.cisoft.model.WeixinAccept;
import com.thoughtworks.xstream.XStream;

/*
 * xml
 */
public class XmlUtils<T> {
	//解析
	public  T parsexml(String xml,String root,Class<T> clazz){
		XStream xStream=new XStream();
		xStream.alias(root,clazz);
		T t=(T)xStream.fromXML(xml);
		return t;
	}
	
	//封装
	public String toxml(Object obj,String root,Class<T> clazz){
		XStream xStream=new XStream();
		xStream.alias(root, clazz);
				
		String xml=xStream.toXML(obj);
		return xml;
	}
	
	public static void main(String[] args) {
		WeixinAccept wa=new WeixinAccept();
//		wa.setCreateTime("liuguiceng");
		wa.setEvent("ererui");
		XStream xStream=new XStream();
		xStream.alias("xml", WeixinAccept.class);
				
		String xml=xStream.toXML(wa);
		System.out.println(xml);
		
	}
}
