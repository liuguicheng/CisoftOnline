package com.cisoft.action;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Backups;
import com.cisoft.model.User;
import com.cisoft.service.BackupsService;
import com.cisoft.utils.BackUpMysqlUtils;
import com.opensymphony.xwork2.ModelDriven;

public class BackupsAction extends Pages<Backups> implements ModelDriven<Backups>{
	private Backups backups=new Backups();
	public Backups getModel() {
		return backups;
	}
	@Resource
	private BackupsService backupsService;
	private String result;
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(backupsService.getList(backups));
		pageResponse.setTotal(backupsService.getCount(backups));
		return "list";
	}
	public Backups getBackups() {
		return backups;
	}

	public void setBackups(Backups backups) {
		this.backups = backups;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String save(){
		//备份
		String username="lgc";
		String password="cisoft";
		String dbname="100nn";
		String filepath=result;
		BackUpMysqlUtils.backup(username, password, dbname, filepath);
		//添加到数据库中
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("usersession");
		backups.setBackupstime(new Date());
		backups.setUser(user);
		backupsService.save(backups);
		result="备份成功";
		return "save";
	}
}
