package VinMart.Controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.phieunhapDao;
import VinMart.entities.CT_Phieunhap;
import VinMart.entities.Phieunhap;
import VinMart.entities.Products;

@Controller
public class phieunhapController extends BaseController {

		//Vào giao diện LIST Phieu nhap
		@RequestMapping(value ="/List-Phieu-Nhap", method= RequestMethod.GET)
		public ModelAndView listPhieuNhap( ) {
	
		_mvShare.setViewName("admin/phieunhap/Listphieunhap");
		
		return _mvShare;
		}
		
		// VAO giao dien LIST CHI TIET PHIEU NHAP
		@RequestMapping(value ="/chi-tiet-phieu-nhap/{MaPn}", method= RequestMethod.POST)
		public ModelAndView listCTPhieuNhap(@PathVariable int MaPn) {
	
		_mvShare.setViewName("admin/phieunhap/ListCTphieunhap");
		
		return _mvShare;
		}
		
		
		//Vào THUC HIEN XOA Phieu Nhap
		@RequestMapping(value ="/xoa-phieu-nhap/{product_id}", method= RequestMethod.POST)
		public String xoaPhieuNhap(@PathVariable int product_id,@RequestParam("product_soluongtonkho") int product_soluongtonkho) {
			
		phieunhapDao phieunhap = new phieunhapDao();
		phieunhap.xoaSanPhamRakhoiPhieuNhap(product_id);
		Products pro = new Products();
		pro.setProduct_id(product_id);
		pro.setProduct_soluongtonkho(product_soluongtonkho);
		if(phieunhap.kiemTraSanPhamConTrongDBChua(product_id,product_soluongtonkho) ==true)
		{
			_phieunhap.updateProbyID(pro);
		}
		else {
			_pro.delete(product_id);
		}
		
		
		

		return "redirect:/List-Product";
		}
		
		//tao phieu nhap
		@RequestMapping(value ="/creat-phieu-nhap", method= RequestMethod.POST)
		public void creatPhieuNhap(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		
			
		Phieunhap pn = new Phieunhap();
		new phieunhapDao().addPN(pn);
		String[] product_id = request.getParameterValues("product_id[]");	
		String[] Soluongnhap = request.getParameterValues("Soluongnhap[]");
		String[] Dongianhap = request.getParameterValues("Dongianhap[]");
		
		
		CT_Phieunhap ct_pn = new CT_Phieunhap();
		ct_pn.setProduct_id(product_id);
		ct_pn.setDongianhap(Dongianhap);
		ct_pn.setSoluongnhap(Soluongnhap);
		
		new phieunhapDao().addCTPN(ct_pn);
		
		//xoa phieu nhap
		int size = product_id.length;
	    int [] arr = new int [size];
	    for(int i=0; i<size; i++) {
	         arr[i] = Integer.parseInt(product_id[i]);
	    }
	    System.out.println(Arrays.toString(arr));
	    new phieunhapDao().xoa(arr);
		
	    response.sendRedirect("List-Phieu-Nhap");
		}
		
}
