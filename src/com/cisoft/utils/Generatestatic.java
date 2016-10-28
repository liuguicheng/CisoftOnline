//package com.cisoft.utils;
//import java.io.BufferedReader;
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.net.URLConnection;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
//import org.apache.commons.io.FileUtils;
//
//public class Generatestatic {
//	
//
//	/**
//	 * @author Xing,XiuDong
//	 * 抓取网页源代码
//	 */
//
//		public static final String generate(final String url) {
//			if (StringUtils.isBlank(url)) {
//				return null;
//			}
//
//			Pattern pattern = Pattern.compile("(http://|https://){1}[//w//.//-/:]+");
//			Matcher matcher = pattern.matcher(url);
//			if (!matcher.find()) {
//				return null;
//			}
//
//			StringBuffer sb = new StringBuffer();
//
//			try {
//				URL _url = new URL(url);
//				URLConnection urlConnection = _url.openConnection();
//				BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
//
//				String inputLine;
//				while ((inputLine = in.readLine()) != null) {
//					sb.append(inputLine);
//				}
//			} catch (MalformedURLException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//
//			return sb.toString();
//		}
//
//		/**
//		 * Test Code
//		 * Target : http://www.google.cn/
//		 */
//		public static void main(String[] args) throws IOException {
//			String src = Generatestatic.generate("http://www.100nn.cn/");
//
//			File file = new File("/Users/pro/Desktop/" + File.separator + "index.html");
//			FileUtils.writeStringToFile(file, src, "UTF-8");
//		}
//
//	}
