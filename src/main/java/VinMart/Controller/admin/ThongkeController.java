package VinMart.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;

@Controller
public class ThongkeController extends BaseController{
	
	//Vào giao diện LIST Thong ke
	@RequestMapping(value ="/List-Thongke")
	public ModelAndView Admincharts(ModelMap model) {

	//_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function 
	_mvShare.setViewName("admin/thongke/theongay");
	
	return _mvShare;
	}
}
