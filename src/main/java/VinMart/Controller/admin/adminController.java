package VinMart.Controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.Users;
import VinMart.service.Admin.AccountServiceAdmin;

@Controller
public class adminController extends BaseController {
	@Autowired
	private AccountServiceAdmin _accountService;

	// Vào giao diện LIST ADMIN
	@RequestMapping(value = "/List-Admin", method = RequestMethod.GET)
	public ModelAndView Admincharts() {

		_mvShare.setViewName("admin/admin/Listadmin");
		_mvShare.addObject("view_account", _accountService.GetAllAccount());
		
		_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
		_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
		return _mvShare;
	}

	
	@RequestMapping(value = "/addEmployee")
	public String AddEmployee(@RequestParam("users_email") String email,
			@RequestParam("users_password") String password, @RequestParam("role_id") int role_id,
			@RequestParam("name") String name, @RequestParam("sdt") String sdt,
			@RequestParam("gioitinh") boolean gioitinh, @ModelAttribute("User") Users user,
			@ModelAttribute("Employee") Employees employee, ModelMap model,HttpSession session) {

		user.setUsers_email(email);
		user.setUsers_password(password);
		user.setRole_id(role_id);

		employee.setName(name);
		employee.setSdt(sdt);
		employee.setGioitinh(gioitinh);
		boolean check = _accountService.AddEmployee(user, employee);
		if (check == false) {
			System.out.println("khong thanh cong");
			session.setAttribute("addNVFail", "true");
			
			return "riderect:List-Admin";
		}
		else {
			session.setAttribute("addNV", "true");
			return "redirect:/List-Admin";
		}
		
	}
	
	
		@RequestMapping(value = "/addCustomer")
		public String AddCustomer(@RequestParam("users_email") String email,
				@RequestParam("users_password") String password, @RequestParam("name") String name,
				@RequestParam("sdt") String sdt, @RequestParam("gioitinh") boolean gioitinh,
				@ModelAttribute("User") Users user, @ModelAttribute("Customer") Customers customer, ModelMap model) {

			user.setUsers_email(email);
			user.setUsers_password(password);

			customer.setName(name);
			customer.setSdt(sdt);
			customer.setGioitinh(gioitinh);
			boolean check = _accountService.AddCustomer(user, customer);
			if (check == false) {
				System.out.println("khong thanh cong");
				model.addAttribute("message_editemployee", "Chỉnh sửa không thành công");
				return "riderect:admin/admin/AddCustomer";
			}
			return "redirect:/List-Admin";
		}

	// Vào giao diện EDIT ADMIN
	@RequestMapping(value = "/edit-admin/{id}")
	public String Editadmin(@PathVariable int id, Model model) {
		Users user = _accountService.GetUserById(id);
		model.addAttribute("userid", user);
		return "admin/admin/modalAndajax";
	}

	@RequestMapping("/editadmin")
	public String updateUser(@RequestParam("users_id") int id, @RequestParam("users_password") String password,
			@RequestParam("role_id") int role_id,
			@ModelAttribute("User") Users user) {
		user.setRole_id(id);
		user.setUsers_password(password);
		user.setRole_id(role_id);
		 _accountService.checkEdit(user);
		
		 return "redirect:/List-Admin";
	}

	// Vào giao diện EDIT Customer
		@RequestMapping(value = "/edit-customer/{id}")
		public String EditCustomer(@PathVariable int id, Model model) {
			_mvShare.addObject("view_account", _accountService.GetAllAccount());
			_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
			_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
			Customers customers = _accountService.GetCustomerById(id);
			model.addAttribute("customers", customers);
			return "admin/admin/modalAndajax";
		}

		@RequestMapping("/editcustomer")
		public String updateCustomer(@RequestParam("id") int id,@RequestParam("name") String name, @RequestParam("sdt") String sdt,
				@RequestParam("gioitinh") boolean gioitinh, @ModelAttribute("customers") Customers customers) {
			customers.setId(id);
			customers.setName(name);
			customers.setSdt(sdt);
			customers.setGioitinh(gioitinh);
			_accountService.checkEditCustomer(customers);
			
			return "redirect:/List-Admin";
		}

		// Vào giao diện EDIT Employee
		@RequestMapping(value = "/edit-employee/{id}")
		public String EditEmployee(@PathVariable int id, Model model) {
			Employees employees = _accountService.GetEmployeeById(id);
			model.addAttribute("employees", employees);
			return "admin/admin/modalAndajax";
		}

		@RequestMapping("/editemployee")
		public String updateEmployee(@RequestParam("id") int id,@RequestParam("name") String name, @RequestParam("sdt") String sdt,
				@RequestParam("gioitinh") boolean gioitinh, @ModelAttribute("employees") Employees employees) {
			System.out.println("name = " + name);
			System.out.println("sdt = " + sdt);
			System.out.println("gioitinh = " + gioitinh);
			employees.setId(id);
			employees.setName(name);
			employees.setSdt(sdt);
			employees.setGioitinh(gioitinh);
			 _accountService.checkEditEmployee(employees);
			 return "redirect:/List-Admin";
		}

		
		@RequestMapping(value = "/del-employee")
		public String delEmployee(@RequestParam("id") int id) {
			
			 _accountService.delEmployee(id);
			
			 
			 return "redirect:/List-Admin";
		}

		
		@RequestMapping(value = "/del-customer")
		public String delCustomer(@RequestParam("id") int id) {
			 _accountService.delCUstomer(id);
			 
			 _accountService.delete(id);
			 return "redirect:/List-Admin";
		}
}
