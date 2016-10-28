package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.MenuDao;
import com.cisoft.model.Menu;

@Component("menuService")
@Transactional
public class MenuService {
	@Resource
	private MenuDao menuDao;
	
	public List<Menu> getList(){
		return menuDao.getList();
	}
	
	public Menu findById(int id){
		return menuDao.findById(id);
	}
	public List<Menu> getParent(){
		return menuDao.getParent();
	}
	
	public void save(Menu menu){
		menuDao.save(menu);
	}

	
	public List<Menu> getFirstMenu(){
		return menuDao.getFirstMenu();
	}
	public List<Menu> getByPid(int parentid){
		return menuDao.getByPid(parentid);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return menuDao.getCount();
	}
}
