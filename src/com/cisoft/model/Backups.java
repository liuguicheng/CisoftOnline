package com.cisoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*
 * 备份
 */
@Entity
@Table(name="n_backups")
public class Backups extends PageRequest{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String filename;//备份文件名称
	private Date backupstime;//备份时间
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="userid")
	private User user;//备份人
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getBackupstime() {
		return backupstime;
	}
	public void setBackupstime(Date backupstime) {
		this.backupstime = backupstime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
