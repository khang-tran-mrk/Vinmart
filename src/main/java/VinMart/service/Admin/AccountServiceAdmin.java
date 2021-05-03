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
	
	public Customers GetCustomerById(int id) {
		return userDao.GetCustomerById(id);
	}

	public Employees GetEmployeeById(int id) {
		return userDao.GetEmployeeById(id);
	}
	
	public boolean checkEdit(Users user) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.update(user);
	}

	public boolean checkEditCustomer(Customers customer) {
		return userDao.updateCustomer(customer);
	}

	public boolean checkEditEmployee(Employees employee) {
		return userDao.updateEmployee(employee);
	}

	public boolean AddEmployee(Users user, Employees employee) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.AddEmployee(user, employee);
	}

	public boolean AddCustomer(Users user, Customers customer) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.AddCustomer(user, customer);
	}

	public boolean delEmployee(int  id) {
		return userDao.deleteEmployee(id);
	}

	public boolean delete(int  id) {
		return userDao.delete(id);
	}

	public boolean delCUstomer(int id) {
		return userDao.deleteCustomer(id);
	}
}