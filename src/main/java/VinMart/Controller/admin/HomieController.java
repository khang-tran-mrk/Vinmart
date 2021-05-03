package VinMart.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;

@Controller
public class HomieController extends BaseController {
	
	//Vào giao diện Charts
	@RequestMapping(value ="/admin-charts", method= RequestMethod.GET)
	public ModelAndView Admincharts() {

		_mvShare.setViewName("admin/charts");
	return _mvShare;
	}
	
	//Vào giao diện Chats
	@RequestMapping(value ="/admin-chats", method= RequestMethod.GET)
	public ModelAndView Adminchat() {

	_mvShare.setViewName("admin/chat");
	return _mvShare;
	}
	
	//Vào giao diện UI
	@RequestMapping(value ="/admin-ui", method= RequestMethod.GET)
	public ModelAndView Adminui() {

	_mvShare.setViewName("admin/ui");
	return _mvShare;
	}
	
	
	
}
