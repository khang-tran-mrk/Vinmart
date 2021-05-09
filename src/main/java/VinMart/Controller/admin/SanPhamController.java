package VinMart.Controller.admin;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import VinMart.dao.ProductDao;
import VinMart.dao.phieunhapDao;
import VinMart.entities.Products;




@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
				maxFileSize=1024*1024*10,      // 10MB
				maxRequestSize=1024*1024*50)   // 50MB

public class SanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String chucNang = request.getParameter("chucNang");
		
		if (chucNang.equals("Them")) {
		try {
			
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			
			String product_name = request.getParameter("product_name");
			int product_soluongtonkho = Integer.parseInt(request.getParameter("product_soluongtonkho"));
			int product_price = Integer.parseInt(request.getParameter("product_price"));
			
		
//			
			int product_discount = Integer.parseInt(request.getParameter("product_discount"));
			int product_danhmuc = Integer.parseInt(request.getParameter("product_danhmuc"));
			
			
			
			//upload anh
			String product_image = getFileName(request); 
			int product_view = Integer.parseInt("0");
			int product_purchased = Integer.parseInt("0");
			int product_trangthai = Integer.parseInt("1");
			int product_soLuongMua = Integer.parseInt("1");
			String product_content = request.getParameter("product_content");
			
			String product_thuonghieu = request.getParameter("product_thuonghieu");
			String product_sanxuat = request.getParameter("product_sanxuat");
			String product_thanhphan = request.getParameter("product_thanhphan");
			String product_nongdocon = request.getParameter("product_nongdocon");
			String product_luongga = request.getParameter("product_luongga");
			String product_luongduong = request.getParameter("product_luongduong");
			String product_thetich = request.getParameter("product_thetich");
			String product_baoquan = request.getParameter("product_baoquan");
			String product_sudung = request.getParameter("product_sudung");
			String product_nsx = request.getParameter("product_nsx");
			String product_hsd = request.getParameter("product_hsd");		
			int MaNCC = Integer.parseInt(request.getParameter("MaNCC"));
			int nhanvien_id = Integer.parseInt(request.getParameter("nhanvien_id"));
			
			
			
			Products pro = new Products();
			pro.setProduct_id(product_id);
			pro.setProduct_name(product_name);
			pro.setProduct_price(product_price);
			pro.setProduct_discount(product_discount);
			pro.setProduct_danhmuc(product_danhmuc);
			pro.setProduct_image(product_image);
			pro.setProduct_view(product_view);
			pro.setProduct_purchased(product_purchased);
			pro.setProduct_trangthai(product_trangthai);
			pro.setProduct_soLuongMua(product_soLuongMua);
			pro.setProduct_content(product_content);
			pro.setProduct_soluongtonkho(product_soluongtonkho);
			pro.setProduct_thuonghieu(product_thuonghieu);
			pro.setProduct_sanxuat(product_sanxuat);
			pro.setProduct_thanhphan(product_thanhphan);
			pro.setProduct_nongdocon(product_nongdocon);
			pro.setProduct_luongga(product_luongga);
			pro.setProduct_luongduong(product_luongduong);
			pro.setProduct_thetich(product_thetich);
			pro.setProduct_baoquan(product_baoquan);
			pro.setProduct_sudung(product_sudung);
			pro.setProduct_nsx(product_nsx);
			pro.setProduct_hsd(product_hsd);
			pro.setNhanvien_id(nhanvien_id);
			pro.setMaNCC(MaNCC);
			new ProductDao().save(pro);
			System.out.println("product_id =  " + product_id);
			System.out.println("product_name =  " + product_name);
			System.out.println("xong them san pham ! ");
			phieunhapDao phieunhap = new phieunhapDao();
			int product_idByPhieuNhap = Integer.parseInt(request.getParameter("product_idByPhieuNhap"));
			System.out.println("product_idByPhieuNhap =  " + product_idByPhieuNhap);
			phieunhap.themVaoPhieuNhap(product_idByPhieuNhap, product_soluongtonkho);		
			ArrayList<Products> dsPhieuNhap = new ArrayList<Products>();
			dsPhieuNhap = phieunhapDao.getPhieuNhap();
			session.setAttribute("cart", dsPhieuNhap);
			response.sendRedirect("List-Product");
		
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("List-Product");
		}
		}else {
			try {
				
				int product_id = Integer.parseInt(request.getParameter("product_id"));
				
				String product_name = request.getParameter("product_name");
				int product_soluongtonkho = Integer.parseInt(request.getParameter("product_soluongtonkho"));
				int product_price = Integer.parseInt(request.getParameter("product_price"));
				int product_discount = Integer.parseInt(request.getParameter("product_discount"));
				int product_danhmuc = Integer.parseInt(request.getParameter("product_danhmuc"));		
				//upload anh
				String product_image = getFileName(request);
				System.out.println("hinh anh =" + product_image);
				
				int product_view = Integer.parseInt(request.getParameter("product_view"));
				int product_purchased = Integer.parseInt(request.getParameter("product_purchased"));
				int product_trangthai = Integer.parseInt(request.getParameter("product_trangthai"));
				int product_soLuongMua = Integer.parseInt("1");
				String product_content = request.getParameter("product_content");
				
				String product_thuonghieu = request.getParameter("product_thuonghieu");
				String product_sanxuat = request.getParameter("product_sanxuat");
				String product_thanhphan = request.getParameter("product_thanhphan");
				String product_nongdocon = request.getParameter("product_nongdocon");
				String product_luongga = request.getParameter("product_luongga");
				String product_luongduong = request.getParameter("product_luongduong");
				String product_thetich = request.getParameter("product_thetich");
				String product_baoquan = request.getParameter("product_baoquan");
				String product_sudung = request.getParameter("product_sudung");
				String product_nsx = request.getParameter("product_nsx");
				String product_hsd = request.getParameter("product_hsd");		
				int MaNCC = Integer.parseInt(request.getParameter("MaNCC"));
				int nhanvien_id = Integer.parseInt(request.getParameter("nhanvien_id"));
				
				
				
				Products pro = new Products();
				pro.setProduct_id(product_id);
				pro.setProduct_name(product_name);
				pro.setProduct_price(product_price);
				pro.setProduct_discount(product_discount);
				pro.setProduct_danhmuc(product_danhmuc);
				pro.setProduct_image(product_image);
				pro.setProduct_view(product_view);
				pro.setProduct_purchased(product_purchased);
				pro.setProduct_trangthai(product_trangthai);
				pro.setProduct_soLuongMua(product_soLuongMua);
				pro.setProduct_content(product_content);
				pro.setProduct_soluongtonkho(product_soluongtonkho);
				pro.setProduct_thuonghieu(product_thuonghieu);
				pro.setProduct_sanxuat(product_sanxuat);
				pro.setProduct_thanhphan(product_thanhphan);
				pro.setProduct_nongdocon(product_nongdocon);
				pro.setProduct_luongga(product_luongga);
				pro.setProduct_luongduong(product_luongduong);
				pro.setProduct_thetich(product_thetich);
				pro.setProduct_baoquan(product_baoquan);
				pro.setProduct_sudung(product_sudung);
				pro.setProduct_nsx(product_nsx);
				pro.setProduct_hsd(product_hsd);
				pro.setNhanvien_id(nhanvien_id);
				pro.setMaNCC(MaNCC);
				new ProductDao().update(pro);
				
				System.out.println("xong edit san pham ! ");
				phieunhapDao phieunhap = new phieunhapDao();
						
				phieunhap.upDatePhieuNhap(product_id,product_name,product_price,product_discount,product_image, product_soluongtonkho);		
				ArrayList<Products> dsPhieuNhap = new ArrayList<Products>();
				dsPhieuNhap = phieunhapDao.getPhieuNhap();
				session.setAttribute("cart", dsPhieuNhap);
				response.sendRedirect("List-Product");
			
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("List-Product");
			}
		}
	}  

	private String getFileName(HttpServletRequest request) throws IOException, ServletException {
		//String projectName = "JavaWeb/DoAnJava";
			
		Part file = request.getPart("product_image");
		System.out.println("file: "+file.getSubmittedFileName().isEmpty() + file.getSubmittedFileName().isBlank());
		
		System.out.println("ten: "+ request.getParameter("product_image_name")); 
		
		//Nếu không có file tải lên thì lấy lại tên cũ đưa vào DB
		if(file.getSubmittedFileName().isEmpty() || file.getSubmittedFileName().isBlank() ) return request.getParameter("product_image_name");
		
		String fileName = file.getSubmittedFileName();
		
		String duongdanWin = getServletContext().getRealPath("") + "assets"+File.separator+"images";
        file.write(duongdanWin + File.separator + fileName); 
       
        System.out.println("duongdanWin" + duongdanWin);
    	System.out.println("fileName" + fileName);
    	
		return fileName;		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}