package com.cisoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cisoft.model.GYSInfo;
import com.cisoft.model.User;
import com.cisoft.model.UserAddress;
@Component("userDao")
public class UserDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	@Resource
	private PageList pageList;

	public List<User> findByLogin(User user){
		StringBuilder sql=new StringBuilder("from User where u_scbs=1");
		if(user.getU_email()!=null){
			sql.append(" and u_email='"+user.getU_email()+"'");
		}else if(user.getU_name()!=null){
			sql.append(" and u_name='"+user.getU_name()+"'");
		}
		sql.append(" and u_pwd='"+user.getU_pwd()+"'");
		List<User> users=hibernateTemplate.find(sql.toString());
		return users;
	}
	
	public int getCount(User user){
		StringBuilder sql=new StringBuilder("select count(*) from User where u_scbs=1");
		if(user.getU_name()!=null&&!user.getU_name().equals("")){
        	sql.append(" and  u_name like '%"+user.getU_name().trim()+"%'");
        }
        if(user.getUwx_gzbs()!=-1){
        	sql.append(" and uwx_gzbs="+user.getUwx_gzbs());
        }
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public List<User> getList(User user){
		StringBuilder sql=new StringBuilder("from User  where u_scbs=1");
        if(user.getU_name()!=null&&!user.getU_name().equals("")){
        	sql.append(" and  u_name like '%"+user.getU_name().trim()+"%'");
        }
        if(user.getUwx_gzbs()!=-1){
        	sql.append(" and uwx_gzbs="+user.getUwx_gzbs());
        }
		sql.append(" order by u_id desc");
		List<User> users= pageList.getPage(sql.toString(), user.getFirstsize(), user.getRows());
		return users;
	}
	
	public void save(User user){
		hibernateTemplate.saveOrUpdate(user);
	}
	
	public User findById(User user){
		return hibernateTemplate.get(User.class,user.getU_id());
	}
	
	public int isunitexit(int unitid){
		String sql="select count(*) from User where u_scbs=1 and unit.id="+unitid+"";
		long count=(Long) hibernateTemplate.find(sql).get(0);
		return (int) count;
	}
	//密码重置
	public List<User> findByName(String name){
		List<User> users=null;
		if(name!=null&&name.trim().length()!=0){
			String sql="from User where u_scbs=1 and u_zsName = '"+name+"'";
			users=hibernateTemplate.find(sql);
		}
		
		return users;
	}
	
	//根据用户id查询收货地址
	public List<UserAddress> findByUserAddressbyuser(UserAddress user){
		StringBuilder sql=new StringBuilder("from UserAddress  where ua_scbs=1");
        if(user.getUser().getU_id()!=0){
        	sql.append(" and user.u_id="+user.getUser().getU_id());
        }
        if(user.getUa_status()!=-1){
        	sql.append(" and ua_status="+user.getUa_status());
        }
		sql.append(" order by ua_status desc");
		List<UserAddress> users= hibernateTemplate.find(sql.toString());
		return users;
	}
	public int getUserAddressCount(UserAddress user){
		StringBuilder sql=new StringBuilder("select count(*) from UserAddress  where ua_scbs=1");
        if(user.getUser().getU_id()!=0){
        	sql.append(" and user.u_id ="+user.getUser().getU_id());
        }
		sql.append(" order by ua_id desc");
		long count=(Long) hibernateTemplate.find(sql.toString()).get(0);
		return (int) count;
	}
	public UserAddress findUserAddressByID(UserAddress userAddress){
		return hibernateTemplate.get(UserAddress.class,userAddress.getUa_id());
	}
	public void saveUserAddress(UserAddress userAddress){
		hibernateTemplate.saveOrUpdate(userAddress);
	}
	public UserAddress findUserAddress(UserAddress user){
		StringBuilder sql=new StringBuilder("from UserAddress  where ua_scbs=1");
        if(user.getUser()!=null){
		if(user.getUser().getU_id()!=0){
        	sql.append(" and user.u_id="+user.getUser().getU_id());
        }
        }
        if(user.getUa_status()!=-1){
        	sql.append(" and ua_status="+user.getUa_status());
        }
		sql.append(" order by ua_id desc");
		List<UserAddress> u=hibernateTemplate.find(sql.toString());
		if(u.size()>0){
			 UserAddress useraddress=(UserAddress) hibernateTemplate.find(sql.toString()).get(0);
			 return useraddress;
		}
	  
		return null;
		
	}
	
	public UserAddress findById(UserAddress user){
		return hibernateTemplate.get(UserAddress.class,user.getUa_id());
	}
	//检查用户明是否存在
	public User findByEmail(String name,int typeid) {
		StringBuilder sql=new StringBuilder("from User  where u_scbs=1 ");
		if(name!=null){
			sql.append(" and u_email='"+name+"'");
		}
		if(typeid!=0){
			sql.append(" and uwx_gzbs="+typeid);
		}
		List<User> users= hibernateTemplate.find(sql.toString());
		if(users.size()>0){
			return users.get(0);
		}
		return null;
	}

	public User findnameandemail(User user) {
		StringBuilder sql=new StringBuilder("from User  where u_scbs=1");
		if(user!=null){
			if(user.getU_name()!=null&&user.getU_email()!=null){
				sql.append(" and u_name='"+user.getU_name()+"'");
				sql.append(" and u_email='"+user.getU_email()+"'");
			}
			
		}
		List<User> users= hibernateTemplate.find(sql.toString());
		if(users.size()>0){
			return users.get(0);
		}
		return null;
	}

	public List<User> findBywxbs(String trim) {
		List<User> users=null;
		if(trim!=null&&trim.trim().length()!=0){
			String sql="from User where u_scbs=1 and  uwx_bs= '"+trim+"'";
			users=hibernateTemplate.find(sql);
		}
		
		return users;
	}

	public List<User> findMerchantUsers(User userinfo) {
		StringBuilder sql=new StringBuilder("from User where u_scbs=1");
			if(userinfo!=null){
				if(userinfo.getMerchantInfo()!=null){
					if(userinfo.getMerchantInfo().getMi_id()!=0){
						sql.append(" and merchantInfo.mi_id="+userinfo.getMerchantInfo().getMi_id());
					}
				}
			}
			
			List<User> users=hibernateTemplate.find(sql.toString());
		
		return users;
	}
}
