package com.cisoft.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

import com.cisoft.model.Commodity;
import com.thoughtworks.xstream.XStream;


public class ObjectToXml<T>{
	private final String TITLE = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>";
	private final String ROOT_START = "<objects>";
	private final String ROOT_END = "</objects>";
	public String getObjectToXml(List<T> list) {
		   StringBuffer stringBuffer = new StringBuffer();
		   stringBuffer.append(TITLE);
		   stringBuffer.append(ROOT_START);
		   for (int i = 0; i < list.size(); i++) {
		    Object object = list.get(i);
		    stringBuffer.append("<" + object.getClass().getSimpleName());
		    Field[] fields = object.getClass().getDeclaredFields();
		    for (int j = 0; j < fields.length; j++) {
		     try {
		      String name = fields[j].getName();
		      Method method = object.getClass().getMethod(
		        "get" + name.substring(0, 1).toUpperCase()
		          + name.substring(1), new Class[] {});
		      Object result = method.invoke(object, new Object[] {});
		      stringBuffer.append(" " + name + "=\"" + result + "\"");
		     } catch (Exception e) {
		      e.getStackTrace();
		     }
		    }
		    stringBuffer.append(" />");
		   }
		   stringBuffer.append(ROOT_END);
		   return stringBuffer.toString();
		}
	
	
	public  T parse(String xml){
		XStream xStream=new XStream();
		//xStream.alias("xml", T.class);
		T weixinAccept=(T) xStream.fromXML(xml);
		return weixinAccept;
	}
	
	public static String toxml(Object d){
		XStream xStream=new XStream();
		//xStream.alias("xml",List.class);
		String xml=xStream.toXML(d);
		return xml;
	}
}
