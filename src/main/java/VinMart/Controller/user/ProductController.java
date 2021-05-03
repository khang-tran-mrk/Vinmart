package VinMart.Controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.dao.ProductDao;
import VinMart.dao.cartDao;
import VinMart.entities.CT_DonHang;
import VinMart.entities.Donhang;
import VinMart.service.User.CategoryService;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	 private CategoryService cateService;
	@RequestMapping(value ={"/chi-tiet-san-pham/{product_id}"}, method= RequestMethod.GET)
	public ModelAndView Index(@PathVariable long product_id,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);
		if(session.isNew()==false) {
			
			//lay han su dung
			 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
             Date nsx = null;
           	String start = _pro.GetProductByID(product_id).getProduct_nsx();
           	nsx = simpleDateFormat.parse(start);
           	Date hsx = null;
         	String endDate = _pro.GetProductByID(product_id).getProduct_hsd();
         	hsx = simpleDateFormat.parse(endDate);
         	long getdays = hsx.getTime()-nsx.getTime();
         	int day = (int) TimeUnit.MILLISECONDS.toDays(getdays);
         	_mvShare.addObject("day",day);
			
			//end lay han su dung
			int pro = (int) product_id;
			new ProductDao().updateView(pro);
			_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header tu function 	
			_mvShare.addObject("pro",_pro.GetProductByID(product_id)); // load du lieu san pham theo id danh muc
			_mvShare.addObject("Byid",_pro.GetProductByID(product_id).getProduct_danhmuc()); // load du lieu de lay id cho link
			_mvShare.addObject("ByName",_pro.GetCateName(_pro.GetProductByID(product_id).getProduct_danhmuc()).getCategory_name()); // load du lieu de lay id cho link
			int i= _pro.GetProductByID(product_id).getProduct_danhmuc(); 
			
			_mvShare.addObject("AllProductsById",cateService.GetSpLienquanByID(i)); 
			
			_mvShare.addObject("Spbanchay",_pro.GetSpBanChay()); // load du lieu san pham ban chay
	
			//_mvShare.addObject("getNamecate",cateService.GetNameByID(i)); 
			//System.out.print("getNamecate: "+ cateService.GetNameByID(i));
		}
		_mvShare.setViewName("customer/product_details");
	return _mvShare;
	}
	 
	@RequestMapping(value ="/Thanhtoan", method= RequestMethod.POST)
	public void thanhToan(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		
		int nguoimua_id = Integer.parseInt(request.getParameter("nguoimua_id"));
		Date donhang_ngaydat = new Date();
		int donhang_trangthai = Integer.parseInt("1"); // vừa vô mua mặc định là 1 là đang chờ duyệt
		
		String donhang_dahuy = request.getParameter("NULL"); // chua huy
		Donhang dh = new Donhang();	
		dh.setNguoimua_id(nguoimua_id);
		dh.setDonhang_ngaydat(donhang_ngaydat);
		dh.setDonhang_trangthai(donhang_trangthai);
		
		dh.setDonhang_dahuy(donhang_dahuy);
		new cartDao().adddh(dh);
		
		
		String[] product_id = request.getParameterValues("product_id[]");
		String[] soLuong = request.getParameterValues("soLuong[]");
		String[] thanhtien = request.getParameterValues("thanhtien[]");
		String diachi = request.getParameter("diachi");
		String province = request.getParameter("province_id");		
		String district = request.getParameter("district");	
		String ward = request.getParameter("ward"); 	
		CT_DonHang ct_dh = new 	CT_DonHang();
		ct_dh.setProduct_id(product_id);
		ct_dh.setSoLuong(soLuong);
		ct_dh.setThanhtien(thanhtien);
		ct_dh.setDiachi(diachi);	
		ct_dh.setProvince(province);
		ct_dh.setDistrict(district);
		ct_dh.setWard(ward);
		
		new cartDao().addctdh(ct_dh);
		
		String[] product_idDel  = request.getParameterValues("product_idDel[]");
		int size = product_idDel.length;
	    int [] arr = new int [size];
	    for(int i=0; i<size; i++) {
	         arr[i] = Integer.parseInt(product_idDel[i]);
	    }
	    System.out.println(Arrays.toString(arr));
	    new cartDao().xoa(arr);
	    HttpSession session = request.getSession();
	    session.setAttribute("checkouts", "true");
	    response.sendRedirect("gio-hang");
	}
	
	//Vào THUC HIEN XOA san pham khoi gio hang
	@RequestMapping(value ="/del-product-cart", method= RequestMethod.POST)
	public String xoaCate(@RequestParam("product_id") int product_id) {

		new cartDao().xoaSanPhamRakhoiGioHang(product_id);
	
		return "redirect:/gio-hang";
	}
	
	
	@RequestMapping(value ="/Xoatatca", method= RequestMethod.POST)
	public void xoaTatCa(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		
		String[] product_idDel  = request.getParameterValues("product_idDel[]");
		int size = product_idDel.length;
	    int [] arr = new int [size];
	    for(int i=0; i<size; i++) {
	         arr[i] = Integer.parseInt(product_idDel[i]);
	    }
	    System.out.println(Arrays.toString(arr));
	    new cartDao().xoa(arr);
		
	    response.sendRedirect("gio-hang");
	}
	
	
	@RequestMapping(value ="/lich-su-mua-hang/{id}", method= RequestMethod.GET)
	public ModelAndView lichSuMuaHang(@PathVariable int id) {
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function
		_mvShare.setViewName("customer/lichsumuahang");
	return _mvShare;
	}
}
