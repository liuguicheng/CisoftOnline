//package com.cisoft.utils;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URLEncoder;
//
//import sun.misc.BASE64Encoder;
//
//public class FileUtils {
//	public static String encodeDownloadFilename(String filename, String agent) throws UnsupportedEncodingException{
//		filename=filename.replaceAll("\r\n","");   // 【解决乱码问题，新添加的】
//		if (agent.contains("Firefox")) { // 火狐浏览器
//			filename = "=?UTF-8?B?"
//				+ new BASE64Encoder().encode(filename.getBytes("utf-8"))
//				+ "?=";
//		} else { // IE及其他浏览器
//			filename = URLEncoder.encode(filename, "utf-8");
//		}
//		return filename;
//	}
//
//}
