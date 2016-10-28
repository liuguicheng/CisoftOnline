package com.cisoft.utils;

import java.io.File;
import java.io.IOException;

public class dd {
	/**
	 * Java代码实现MySQL数据库导出
	 * 
	 * @author GaoHuanjie
	 * @param hostIP MySQL数据库所在服务器地址IP
	 * @param userName 进入数据库所需要的用户名
	 * @param password 进入数据库所需要的密码
	 * @param savePath 数据库导出文件保存路径
	 * @param fileName 数据库导出文件文件名
	 * @param databaseName 要导出的数据库名
	 * @return 返回true表示导出成功，否则返回false。
	 */
	public static boolean exportDatabaseTool(String hostIP, String userName, String password, String savePath, String fileName,	String databaseName) {
		File saveFile = new File(savePath);
		if (!saveFile.exists()) {// 如果目录不存在
			saveFile.mkdirs();// 创建文件夹
		}
		if (!savePath.endsWith(File.separator)) {
			savePath = savePath + File.separator;
		}

		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("cd /usr/local/mysql-5.6.16-osx10.7-x86_64/ mysqldump").append(" --opt").append(" -h").append(hostIP);
		stringBuilder.append(" --user=").append(userName) .append(" --password=").append(password).append(" --lock-all-tables=true");
		stringBuilder.append(" --result-file=").append(savePath + fileName).append(" --default-character-set=utf8 ").append(databaseName);
		System.out.println(stringBuilder.toString());
		try {
//			stringBuilder.append("cd /Users/pro/Desktop/mysqldump -hlocalhost -ulgc -pcisoft --opt test>/Users/pro/Desktop/images/11.sql");
			Process process = Runtime.getRuntime().exec(stringBuilder.toString());
			if (process.waitFor() == 0) {// 0 表示线程正常终止。
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) throws InterruptedException {
		if (exportDatabaseTool("127.0.0.1", "lgc", "cisoft", "/Users/pro/Desktop/images/", "11.sql", "test")) {
			System.out.println("数据库备份成功！！！");
		} else {
			System.out.println("数据库备份失败！！！");
		}
	}
}
