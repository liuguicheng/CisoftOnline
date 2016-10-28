package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.Role;
@Component("roleDao")
public class RoleDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;

	public int getCount(Role role){
		String sql="select count(*) from Role where scbs=1";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	public List<Role> getList(Role role){
		String sql="from Role where scbs=1";
		List<Role> roles=pageList.getPage(sql, role.getFirstsize(), role.getRows());
		return roles;
	}
	//下拉框
	public List<Role> getList(){
		String sql="from Role where scbs=1";
		return hibernateTemplate.find(sql);
	}
	
	public void save(Role role){
		hibernateTemplate.saveOrUpdate(role);
	}
	
	public Role findById(Role role){
		return hibernateTemplate.get(Role.class, role.getId());
	}
	public Role findById(int id){
		return hibernateTemplate.get(Role.class, id);
	}
}
