package VinMart.service.Admin;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.Users;

@Service
public class AccountServiceAdmin {
	@Autowired
	UserDao userDao = new UserDao();

	public List<Users> GetAllAccount() {
		return userDao.GetAllUser();
	}
	
	public List<Employees> GetAllEmployees() {
		return userDao.GetAllEmployees();
	}
	
	public List<Customers> GetAllCustomers() {
		return userDao.GetAllCustomers();
	}

	public Users GetUserById(int id) {
		return userDao.GetUserById(id);
	}

	public void checkEdit(Users user) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		userDao.update(user);
	}
	
	public void AddEmployee(Users user,Employees employee) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		userDao.AddEmployee(user,employee);
	}
}