package com.cisoft.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;

public class UplodImg {

	private static final int BUFFER_SIZE = 16 * 1024;
	/**
	 * 上传商品缩略图
	 */

	public static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
   public static void upfile(File src,String url){
	   try{
	   long length = src.length(); // 文件的真实大小
		// 将上传的文件保存到服务器的硬盘上
		InputStream is = new BufferedInputStream(new FileInputStream(
				src));
		File tempFile = new File(url);
		FileUtils.forceMkdir(src.getParentFile()); // 创建上传文件所在的父目录
		OutputStream os = new BufferedOutputStream(
				new FileOutputStream(tempFile));
		int len = 0;
		byte[] buffer = new byte[1024];

		while (-1 != (len = is.read(buffer))) {
			os.write(buffer, 0, len);

		}
		is.close();
		os.flush();
		os.close();
	   }catch(Exception e){
		  System.out.println(e.getMessage());
	   }
   }
	public static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
}
