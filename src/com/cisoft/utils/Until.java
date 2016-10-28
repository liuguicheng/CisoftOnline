package com.cisoft.utils;

public class Until {
	/**
	 * 判断当前系统环境
	 * @return
	 */
	public   static String pathstr(){
//		String systemstr=System.getProperties().getProperty("os.name");
		String path="";
//		if("Mac OS X".equals(systemstr)){
			path="/Users/pro/Desktop/images/";
//		}else{
			//path="D:/100nn/image/";
			
//		}
//		System.out.println("当前系统："+systemstr);
		return path;
				
	}
	
	
	
}
