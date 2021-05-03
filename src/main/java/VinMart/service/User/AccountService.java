
package VinMart.service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Users;

@Service
public class AccountService {
	@Autowired
	UserDao userDao = new UserDao();

	public int AddAccount(Users user,Customers customer) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.AddAccount(user,customer);
	}	
	public Users CheckAccountLogin(Users user) {
		String pass = user.getUsers_password();
		user = userDao.GetUserByAccount(user);
		if (user != null) {
			if (BCrypt.checkpw(pass, user.getUsers_password())) {
				return user;
			} else {
				return null;
			}
		}
		return null;
	}
	
	
}
