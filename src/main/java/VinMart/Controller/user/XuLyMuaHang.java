package VinMart.Controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VinMart.dao.cartDao;
import VinMart.entities.Products;

public class XuLyMuaHang extends HttpServlet  {
	private static final long serialVersionUID = 1L;

    public XuLyMuaHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		
		String action = request.getParameter("action");
		System.out.println(action);
		System.out.println(product_id);
		
		cartDao cart = new cartDao();
		if (action.equals("giam")) 
		{
			
			
		         cart.giamGioHang(product_id);
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			session.setAttribute("cart", dsGioHang);
			response.sendRedirect("gio-hang");
		}
			
		else if(action.equals("update")) {
			
			int sl = Integer.parseInt(request.getParameter("sl"));
			System.out.println("sl: "+ sl);
			cart.tangsoluonggiohang(product_id,sl);
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			session.setAttribute("cart", dsGioHang);
			response.sendRedirect("gio-hang");
		}
		else if(action.equals("them")) {
			cart.themVaoGioHang(product_id);
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			session.setAttribute("cart", dsGioHang);
			response.sendRedirect("gio-hang");
		}
		else if(action.equals("mua")) {
			System.out.println("mua hang");
			cart.themVaoGioHang(product_id);
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			session.setAttribute("cart", dsGioHang);
			System.out.println("thanh cong mua hang");
			response.sendRedirect("chi-tiet-san-pham/"+product_id );
			
		}
		else if(action.equals("xoa")) {
			new cartDao().xoaSanPhamRakhoiGioHang(product_id);
			System.out.print("xoa thanh cong");
			response.sendRedirect("gio-hang");
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
