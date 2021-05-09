package VinMart.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Users;
import VinMart.service.User.AccountService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController extends BaseController {
	@Autowired
	AccountService accountService = new AccountService();

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView Register() {
		_mvShare.setViewName("customer/register");
		_mvShare.addObject("user", new Users());
		_mvShare.addObject("customer", new Customers());
		return _mvShare;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView CreateAccount(@ModelAttribute("user") Users user, @ModelAttribute("customer") Customers customer,HttpSession session) {

		int count = accountService.AddAccount(user, customer);
		if (count > 0) {
			
			session.setAttribute("resThanhCong", "true");
		} else {
			session.setAttribute("resThatBai", "true");
		}
		_mvShare.setViewName("customer/register");
		return _mvShare;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView Login() {
		_mvShare.setViewName("customer/login");
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView LoginAccount(HttpSession session, @ModelAttribute("user") Users user) {
		user = accountService.CheckAccountLogin(user);
		System.out.println("user = " + user);
		if (user != null) {
			_mvShare.setViewName("redirect:trang-chu");
			session.setAttribute("LoginInfo", user);
			session.setAttribute("login", "true");
		} else {
			session.setAttribute("loginFail", "true");
		}
		return _mvShare;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String LoginAccount(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("LoginInfo");
		return "redirect:" + request.getHeader("Referer");
	}
	
	// vao giao dien quên mật khẩu 
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		
		_mvShare.setViewName("customer/forgotpassword");
		
		return _mvShare;
	}
	// vao giao dien quên mật khẩu 
	@RequestMapping(value = "/do-forgot-password/{code}/{email}", method = RequestMethod.GET)
	public ModelAndView forgotPassWORD(@PathVariable String code,@PathVariable String email, HttpSession session ) {
		_mvShare.setViewName("customer/doforgotpassword");
		System.out.println("code = " + code);
		System.out.println("email = " + email+".com");
		session.setAttribute("code", code);
		session.setAttribute("email", email+".com");
		
		return _mvShare;
	}
	//xu ly gui mail thay doi mat khau
	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public void changePassword(HttpSession session, HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException {
		
		
		String action = request.getParameter("action");
		UserDao user = new UserDao();
		String code = user.getRandom();
		if(action.equals("guimail")) {
			String email = request.getParameter("users_email");
			boolean success = user.sendEmail(email, code);
			boolean check = new UserDao().checkEmail(email);
			if( check==true) {
				if (success) 
				{
					session.setAttribute("guimail", "true");
					
		            session.setAttribute("authcode", code);            
		            response.sendRedirect("forgot-password");
				}
				
			}
			else 
			{
				session.setAttribute("guimailFail", "true");
				
				response.sendRedirect("forgot-password");
			}
			
					
		}
		else if (action.equals("xacthuc")) {
			
				String authcode = (String) session.getAttribute("authcode");	
				String users_email =  request.getParameter("users_email");			
				String users_password = request.getParameter("password");
				String repassword = request.getParameter("repassword");
				System.out.println("code" + authcode);
			
				if(users_password.equals(repassword)) 
				{
					Users u = new Users();
					u.setUsers_email(users_email);
					u.setUsers_password(users_password);	
					accountService.checkPassword(u);
					session.setAttribute("xacthuc", "true");
					session.removeAttribute("authcode");
					response.sendRedirect("login");
				}
				else {
					session.setAttribute("xacthucFail", "true");
					response.sendRedirect("do-forgot-password/"+authcode+"/"+users_email );
				}
			
					
		} 
		
	}
}