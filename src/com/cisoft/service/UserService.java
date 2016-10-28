package com.cisoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cisoft.dao.UserDao;
import com.cisoft.model.User;
import com.cisoft.model.UserAddress;

@Component("userService")
@Transactional
public class UserService {
	@Resource
	private UserDao userDao;
	
	public List<User> findByLogin(User user){
		return userDao.findByLogin(user);
	}
	
	public int getCount(User user){
		return userDao.getCount(user);
	}
	public List<User> getList(User user){
		return userDao.getList(user);
	}
	
	public void save(User user){
		userDao.save(user);
	}
	
	public User findById(User user){
		return userDao.findById(user);
	}
	
	public int isunitexit(int unitid){
		return userDao.isunitexit(unitid);
	}
	public List<User> findByName(String name){
		return userDao.findByName(name);
	}
	
	//根据用户id查询收货地址
		public List<UserAddress> findByUserAddressbyuser(UserAddress user){
			return userDao.findByUserAddressbyuser(user);
		}
		public int getUserAddressCount(UserAddress user){
			return userDao.getUserAddressCount(user);
		}
		public UserAddress findUserAddressByID(UserAddress userAddress){
			return userDao.findUserAddressByID(userAddress);
		}
		public void saveUserAddress(UserAddress userAddress){
			 userDao.saveUserAddress(userAddress);
		}
		public UserAddress findUserAddress(UserAddress user){
			return userDao.findUserAddress(user);
			
		}
		public UserAddress findById(UserAddress user){
			return userDao.findById(user);
		}

		public User findByEmail(String name,int typeid) {
			// TODO Auto-generated method stub
			return userDao.findByEmail(name,typeid);
		}

		public User findnameandemail(User user) {
			// TODO Auto-generated method stub
			return userDao.findnameandemail(user);
		}

		public List<User> findBywxbs(String trim) {
			// TODO Auto-generated method stub
			return userDao.findBywxbs(trim);
		}

		public List<User> findMerchantUsers(User userinfo) {
			// TODO Auto-generated method stub
			return userDao.findMerchantUsers(userinfo);
		}
}
