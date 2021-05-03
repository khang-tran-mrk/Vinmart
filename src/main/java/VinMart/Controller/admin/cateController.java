	package VinMart.Controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.entities.Categorys;

@Controller
public class cateController extends BaseController {

	//Vào giao diện LIST Category
	@RequestMapping(value ="/List-Category")
	public ModelAndView Admincharts(ModelMap model) {

	_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function 
	_mvShare.setViewName("admin/category/Listcategory");
	
	return _mvShare;
	}
	
	//Vào giao diện ADD Cate
	@RequestMapping(value ="/add-category", method= RequestMethod.GET)
	public ModelAndView Addcate() {

	_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function 
	_mvShare.setViewName("admin/category/Addcategory");
	
	return _mvShare;
	}
	//Thực hiện ADD của cate
	@RequestMapping(value ="/category-add", method= RequestMethod.POST)
	public String doAddcate(@RequestParam("category_name") String category_name,@RequestParam("p_id") int p_id,HttpSession sess) {
		
		
		Categorys cate = new Categorys();
		
		cate.setCategory_name(category_name);
		cate.setP_id(p_id);
		
		_cate.save(cate);
		
		
		return "redirect:/List-Category";
	}
	
	//Vào giao diện EDIT Category
	@RequestMapping(value ="/edit-category/{category_id}", method= RequestMethod.GET)
	public ModelAndView Editcate(@PathVariable long category_id) {
		
		
		_mvShare.addObject("cate",_cate.findById(category_id));
		

	_mvShare.addObject("cateAll",_cate.listAll()); 
	_mvShare.setViewName("admin/category/Editcategory");
	return _mvShare;
	}
	//THUC HIEN EDIT Category
	@RequestMapping(value ="/category-edit", method= RequestMethod.POST)
	public String doEditcate(@RequestParam("category_id") int category_id,@RequestParam("category_name") String category_name,@RequestParam("p_id") int p_id,ModelMap model) {
		
		Categorys cate = new Categorys();
			
		cate.setCategory_id(category_id);
		cate.setCategory_name(category_name);
		cate.setP_id(p_id);
			
		_cate.update(cate);
		
	return "redirect:/List-Category";
	}
	
	
	//Vào THUC HIEN XOA Category
	@RequestMapping(value ="/del-category", method= RequestMethod.POST)
	public String xoaCate(@RequestParam("category_id") int category_id) {

	_cate.delete(category_id);
	
	return "redirect:/List-Category";
	}
	
}
