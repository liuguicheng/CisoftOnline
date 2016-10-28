package com.cisoft.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * 备份和还原数据库
 */
public class BackUpMysqlUtils {
	public static void backup(String username,String password,String dbname,String filepath){
		 String cmd ="mysqldump" +" -u"+username + " -p"+password+" "+dbname+">"+filepath;
		  try {
			  Runtime.getRuntime().exec(cmd);
		  }
		  catch (IOException e) {
			  throw new RuntimeException("导出失败");
		  }
	}
	
	public static void recover(){
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddhhmmss");
		String filepath = "/Users/pro/Desktop/images/("+df.format(new Date())+").sql"; // 备份的路径地址   
		   //新建数据库test 

		  String stmt1 = "mysqladmin -u root -proot create test"; 

		  String stmt2 = "mysql -u root -proot test < " + filepath; 
		  String[] cmd = { "cmd", "/c", stmt2 }; 
		 
		  try { 
		   Runtime.getRuntime().exec(stmt1); 
		   Runtime.getRuntime().exec(cmd); 
		   System.out.println("数据已从 " + filepath + " 导入到数据库中"); 
		  } catch (IOException e) { 
		   e.printStackTrace(); 
		  }  
	}
}
