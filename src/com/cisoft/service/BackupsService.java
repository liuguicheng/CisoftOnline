package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.BackupsDao;
import com.cisoft.model.Backups;

@Component("backupsService")
@Transactional
public class BackupsService {
	@Resource
	private BackupsDao backupsDao;
	
	public void save(Backups backups){
		backupsDao.save(backups);
	}
	
	public int getCount(Backups backups){
		return backupsDao.getCount(backups);
	}
	public List<Backups> getList(Backups backups){
		return backupsDao.getList(backups);
	}
	
	public int isuserexit(int userid){
		return backupsDao.isuserexit(userid);
	}
}
