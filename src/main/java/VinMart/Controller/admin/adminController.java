package VinMart.Controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.entities.Employees;
import VinMart.entities.Users;
import VinMart.service.Admin.AccountServiceAdmin;

@Controller
public class adminController extends BaseController {
	@Autowired
	private AccountServiceAdmin _accountService;

	@RequestMapping("/testmrk")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect: trang-chu");
		return mav;
	}
	// Vào giao diện LIST ADMIN
	@RequestMapping(value = "/List-Admin", method = RequestMethod.GET)
	public ModelAndView Admincharts() {

		_mvShare.setViewName("admin/admin/Listadmin");
		_mvShare.addObject("view_account", _accountService.GetAllAccount());
		_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
		_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
		return _mvShare;
	}

	// Vào giao diện ADD Employee
	@RequestMapping(value = "/add-admin", method = RequestMethod.GET)
	public ModelAndView Add() {

		_mvShare.setViewName("admin/admin/Addadmin");
		return _mvShare;
	}
	@RequestMapping(value = "/addEmployee")
	public String AddEmployee(
			@RequestParam("users_email") String email,
			@RequestParam("users_password") String password,
			@RequestParam("role_id") int role_id,
			@RequestParam("name") String name,
			@RequestParam("sdt") String sdt,
			@ModelAttribute("User") Users user,@ModelAttribute("Employee") Employees employee) {
	
		user.setUsers_email(email);
		user.setUsers_password(password);
		user.setRole_id(role_id);
		
		employee.setName(name); 
		employee.setSdt(sdt);
		_accountService.AddEmployee(user, employee);

	
		return "redirect:/List-Admin";
	}

	// Vào giao diện EDIT ADMIN
	@RequestMapping(value = "/edit-admin/{id}")
	public String Editadmin(@PathVariable int id, Model model) {
		Users user = _accountService.GetUserById(id);
		model.addAttribute("userid", user);
		return "admin/admin/Editadmin";
	}

	@RequestMapping("/editadmin")
	public ModelAndView doUpdateCustomer(@RequestParam("users_id") int id,@RequestParam("users_password") String password,@ModelAttribute("User") Users user) {
		user.setRole_id(id);
		user.setUsers_password(password);
		_accountService.checkEdit(user);
		_mvShare.addObject("view_account", _accountService.GetAllAccount());
		_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
		_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
		_mvShare.setViewName("admin/admin/Listadmin");

		return _mvShare;
	}

	@RequestMapping(value = "/del-admin", method = RequestMethod.GET)
	public ModelAndView DelAdmin() {

		_mvShare.setViewName("admin/admin/Listadmin");
		return _mvShare;
	}
}
