package VinMart.Controller.admin;

import java.util.ArrayList;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.phieunhapDao;
import VinMart.entities.NhaCungCap;
import VinMart.entities.Products;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
@Controller
public class proController extends BaseController {
	
	// Vào giao diện LIST Product
	@RequestMapping(value = "/List-Product")
	public ModelAndView ListProduct(ModelMap model) {

		model.addAttribute("pro", _pro.listAllPro()); // load du lieu tu function
		_mvShare.setViewName("admin/product/Listproduct");
		return _mvShare;
	}

	// Vào giao diện EDIT Product
	@RequestMapping(value = "/edit-product/{product_id}", method = RequestMethod.GET)
	public ModelAndView Editproduct(@PathVariable int product_id) {
		System.out.print("vao duoc = " + product_id);

		_mvShare.addObject("pro", _pro.listAllPro()); // load du lieu tu function
		_mvShare.setViewName("admin/product/Listproduct");
		return _mvShare;
	}

	// Vào giao diện ADD NCC
	@RequestMapping(value = "/add-ncc", method = RequestMethod.GET)
	public ModelAndView AddNcc() {
		_mvShare.setViewName("admin/product/Addncc");
		return _mvShare;
	}

	// Thực hiện ADD của NCC
	@RequestMapping(value = "/ncc-add", method = RequestMethod.POST)
	public String doAddncc(@RequestParam("TenNCC") String TenNCC, @RequestParam("DiaChi") String DiaChi,
			@RequestParam("Email") String Email, @RequestParam("Sdt") String Sdt) {

		NhaCungCap ncc = new NhaCungCap();

		ncc.setTenNCC(TenNCC);
		ncc.setDiaChi(DiaChi);
		ncc.setEmail(Email);
		ncc.setSdt(Sdt);

		_pro.savencc(ncc);

		return "redirect:/List-Product";
	}

	// Thực hiện ADD product old
	@RequestMapping(value = "/add-productOld", method = RequestMethod.POST)
	public String doAddproductOld(@RequestParam("product_id") int product_id,
			@RequestParam("product_soluongtonkho") int product_soluongtonkho, HttpServletRequest request) {

		HttpSession session = request.getSession();
		phieunhapDao phieunhap = new phieunhapDao();
		phieunhap.themVaoPhieuNhap(product_id, product_soluongtonkho);
		ArrayList<Products> dsPhieuNhap = new ArrayList<Products>();
		dsPhieuNhap = phieunhapDao.getPhieuNhap();
		session.setAttribute("cart", dsPhieuNhap);

		Products product = new Products();
		product.setProduct_id(product_id);
		product.setProduct_soluongtonkho(product_soluongtonkho);
		_pro.addproductOld(product);

		return "redirect:/List-Product";
	}
	
	@RequestMapping(value= "/add-productNew", method = RequestMethod.POST)
	public String doAddproductNew() {
		
		return "redirect:/List-Product";		
	}

	// Vào THUC HIEN XOA San Pham
	@RequestMapping(value = "/del-product/{product_id}", method = RequestMethod.POST)
	public String xoaProduct(@PathVariable int product_id, ModelMap model,HttpSession session) {
		
		System.out.println("test: "+product_id);
		phieunhapDao phieunhap = new phieunhapDao();
		phieunhap.xoaSanPhamRakhoiPhieuNhap(product_id);
		_pro.delete(product_id);
		session.setAttribute("deleteSP", "true");	
		return "redirect:/List-Product";
	}
	
	

}