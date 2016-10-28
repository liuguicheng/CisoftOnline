package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.ShoppingcarDao;
import com.cisoft.model.ShoppingCart;


@Component("shoppingcarService")
@Transactional
public class ShoppingCarService {
	@Resource
	private ShoppingcarDao shoppingcarDao;
	
	public int getCount(ShoppingCart shoppingCart){
		return shoppingcarDao.getCount(shoppingCart);
	}
	public List<ShoppingCart> getList(ShoppingCart shoppingCart){
		return shoppingcarDao.getList(shoppingCart);
	}
	
	public void save(ShoppingCart shoppingCart){
		shoppingcarDao.save(shoppingCart);
	}
	
	public ShoppingCart findById(ShoppingCart shoppingCart){
		return shoppingcarDao.findById(shoppingCart);
	}
	
	public int isunitexit(int unitid){
		return shoppingcarDao.isunitexit(unitid);
	}
	public List<ShoppingCart> getLists(ShoppingCart comm) {
		// TODO Auto-generated method stub
		return shoppingcarDao.getLists(comm);
	}
	public List<ShoppingCart> findBycids(String id) {
		// TODO Auto-generated method stub
		return shoppingcarDao.findBycids(id);
	}
}
