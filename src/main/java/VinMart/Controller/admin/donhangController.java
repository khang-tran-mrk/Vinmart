package VinMart.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.entities.Donhang;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
public class donhangController extends BaseController{

	//Vào giao diện LIST DON HANG
	@RequestMapping(value ="/List-Donhang")
	public ModelAndView ListDonHang() {
		
		_mvShare.addObject("Listdh", _dh.listDhID1()); // load du lieu list don hang co trang thai =1 
		_mvShare.setViewName("admin/donhang/donhang");
	return _mvShare;
	}
	
	@RequestMapping(value ="/xac-nhan-hang", method= RequestMethod.POST)
	public ModelAndView Xacnhanhang() {
		
		_mvShare.addObject("Listdh", _dh.listDhID1()); // load du lieu list don hang co trang thai =1
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
	return _mvShare;
	}
	
	
	@RequestMapping(value ="/cho-xuat-hang", method= RequestMethod.POST)
	public ModelAndView Choxuathang() {
		
		_mvShare.addObject("Listdh", _dh.listDhID2()); // load du lieu list don hang co trang thai =2 
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
	return _mvShare;
	}
	
	@RequestMapping(value ="/dang-giao-hang", method= RequestMethod.POST)
	public ModelAndView Danggiaohang() {
		
		_mvShare.addObject("Listdh", _dh.listDhID3()); // load du lieu list don hang co trang thai =3 
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
	return _mvShare;
	}
	
	@RequestMapping(value ="/giao-thanh-cong", method= RequestMethod.POST)
	public ModelAndView Giaothanhcong() {
		
		_mvShare.addObject("Listdh", _dh.listDhID4()); // load du lieu list don hang co trang thai =4 
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
	return _mvShare;
	}
	
	@RequestMapping(value ="/huy-giao-hang", method= RequestMethod.POST)
	public ModelAndView HuyGiaoHang() {
		
		_mvShare.addObject("Listdh", _dh.listDhID0()); // load du lieu list don hang co trang thai =4 
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
	return _mvShare;
	}
	
	
	
	//THUC HIEN UPDATE DONHANG
	@RequestMapping(value ="/update-trangthai/{donhang_id}", method= RequestMethod.POST)
	public String doEditcate(@PathVariable int donhang_id,@RequestParam("donhang_trangthai") int donhang_trangthai ,@RequestParam("nhanvien_id") int nhanvien_id) {
	/*
		if(donhang_trangthai==2) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = new Date();
	        //PLus 24h
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(new Date());
	        cal.add(Calendar.HOUR, 24);
	        Date date2 = null;
	       
	    	  try {
	    		 //lay ngaygiao
	    		
	  	      	String hientai = simpleDateFormat.format(currentDate); // hien tai
	  	      	date2 = simpleDateFormat.parse(hientai);
	  	      	
	  	    	long getdays = date2.getTime()+259200000;
	  	    	System.out.println("getdays =" + getdays);
	  	    	int star = (int) TimeUnit.MILLISECONDS.toDays(259200000);
	  	    	int day = (int) TimeUnit.MILLISECONDS.toDays(getdays);
	  	    	
	  	    	_mvShare.addObject("day",day);
	  			
	  			//end lay ngaygiao


	    	   System.out.println("Differance between date " + star + " and " + hientai + " is " + day + " days.");
	    	  } catch (Exception e) {
	    	   e.printStackTrace();
	    	  }
		} */
		
		Donhang  dh= new Donhang();
		
		dh.setDonhang_id(donhang_id);
		dh.setDonhang_trangthai(donhang_trangthai);
		dh.setNhanvien_id(nhanvien_id);
			
		_dh.update(dh);
			
		return "redirect:/List-Donhang";
	}
	
	//Vào giao diện LIST CTDON HANG
	@RequestMapping(value ="/ct-don-hang/{donhang_id}", method= RequestMethod.POST)
		public ModelAndView ListCTDonHang(@RequestParam(value="donhang_id",required=false) int donhang_id) {
		System.out.println("donhang_id = " + donhang_id);
			_mvShare.setViewName("admin/donhang/ctdonhang");
			return _mvShare;
			}
	
	//Vào giao diện HUY DONHANG tu trang nguoi dung
		@RequestMapping(value ="/view-huy/{donhang_id}", method= RequestMethod.GET)
		public ModelAndView Editcate(@PathVariable int donhang_id) {
			
			System.out.println("donhang_id = " + donhang_id);
			
		_mvShare.setViewName("customer/lichsumuahang");
		return _mvShare;
		}
	//THUC HIEN HUY DONHANG tu trang nguoi dung
		@RequestMapping(value ="/huy-don-hang", method= RequestMethod.POST)
		public String doCancel(@RequestParam("donhang_id") int donhang_id,
							@RequestParam("donhang_trangthai") int donhang_trangthai,
							@RequestParam("nguoimua_id") int nguoimua_id,
							@RequestParam(required=false,name="check_1") String check_1,
							@RequestParam(required=false,name="check_2") String check_2,
							@RequestParam(required=false,name="check_3") String check_3,
							@RequestParam(required=false,name="check_4") String check_4,HttpServletRequest request) {
			Donhang  dh= new Donhang();
			
			HttpSession session = request.getSession();
			System.out.print("donhang_trangthai= "+donhang_trangthai);
			System.out.print("donhang_id= "+donhang_id);
			System.out.print("check_1= "+check_1);
			System.out.print("check_2= "+check_2);
			System.out.print("check_3= "+check_3);
			System.out.print("check_4= "+check_4);
			String donhang_dahuy = check_1 + " " +check_2  + " " + check_3  + " " + check_4;
			dh.setDonhang_id(donhang_id);
			dh.setDonhang_trangthai(donhang_trangthai);
			dh.setDonhang_dahuy(donhang_dahuy);
			_dh.cancel(dh);
			session.setAttribute("canceluser", "true");	
			return "redirect:/lich-su-mua-hang/"+nguoimua_id;
		}
	
	
}
