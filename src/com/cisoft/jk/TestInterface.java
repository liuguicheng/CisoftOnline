package com.cisoft.jk;

import com.cisoft.utils.MD5Unit;

/**
 * 测试类
 * @author pro
 *
 */
public class TestInterface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UniversalInterface ui=new UniversalInterface();
		
		String queryXmlDoc="<?xml version=\"1.0\" encoding=\"UTF-8\" ?><objects><commoditySort>2</commoditySort><commodityname></commodityname></objects>";
		String interfaceMD5="";
		try{
			String queryxml=queryXmlDoc.substring(20,45)+"01wxcx";
			System.out.println(queryxml);
			interfaceMD5=MD5Unit.md5(queryxml);
			System.out.println("md5="+interfaceMD5);
			ui.ReadInterface("01&splb", "01wxcx",
					interfaceMD5, "xml", queryXmlDoc);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
