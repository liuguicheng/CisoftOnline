package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.RoleDao;
import com.cisoft.model.Role;

@Component("roleService")
@Transactional
public class RoleService {
	@Resource
	private RoleDao roleDao;
	
	public int getCount(Role role){
		return roleDao.getCount(role);
	}
	public List<Role> getList(Role role){
		return roleDao.getList(role);
	}
	public List<Role> getList(){
		return roleDao.getList();
	}
	
	public void save(Role role){
		roleDao.save(role);
	}
	
	public Role findById(Role role){
		return roleDao.findById(role);
	}
	public Role findById(int id){
		return roleDao.findById(id);
	}
}
