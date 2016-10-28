package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Menu;
import com.cisoft.model.User;
@Component("menuDao")
public class MenuDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	Transaction transaction;
	
	public List<Menu> getList(){
		String sql="from Menu";
		List<Menu> menus=hibernateTemplate.find(sql);
		return menus;
	}
	
	public Menu findById(int id){
		return hibernateTemplate.get(Menu.class, id);
	}
	//下拉框
	public List<Menu> getParent(){
		String sql="from Menu where page is null or page=''";
		return hibernateTemplate.find(sql);
	}
	
	public void save(Menu menu){
		hibernateTemplate.saveOrUpdate(menu);
	}

	//一级菜单
	public List<Menu> getFirstMenu(){
		String sql="from Menu where parentid=0";
		List<Menu> menus=hibernateTemplate.find(sql);
		return menus;
	}
	
	//一级菜单下面的子菜单
	public List<Menu> getByPid(int parentid){
		String sql="from Menu where   parentid='"+parentid+"'";
		List<Menu> menus=hibernateTemplate.find(sql);
		return menus;
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
