<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="VinMart.entities.Users"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>


<div id='loader'>
      <div class="spinner"></div>
    </div>

    <script>
      window.addEventListener('load', function load() {
        const loader = document.getElementById('loader');
        setTimeout(function() {
          loader.classList.add('fadeOut');
        }, 300);
      });
    </script>
   

    <div>
    
      <!-- #Left Sidebar ==================== -->
      <div class="sidebar">
        <div class="sidebar-inner">
          <!-- ### $Sidebar Header ### -->
          <div class="sidebar-logo">
            <div class="peers ai-c fxw-nw">
              <div class="peer peer-greed">
                <a class="sidebar-link td-n" href="${pageContext.request.contextPath}/admin-page">
                  <div class="peers ai-c fxw-nw">
                    <div class="peer">
                      <div class="logo">
                        <img src="" alt="">
                      </div>
                    </div>
                    <div class="peer peer-greed">
                      <h5 class="lh-1 mB-0 logo-text" style="color: white !important;">Adminator</h5>
                    </div>
                  </div>
                </a>
              </div>
              <div class="peer">
                <div class="mobile-toggle sidebar-toggle">
                  <a href="" class="td-n">
                    <i class="ti-arrow-circle-left"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>

		
          <!-- ### $Sidebar Menu ### -->
          <ul class="sidebar-menu scrollable pos-r">
            <li class="nav-item mT-30 actived" style="margin-bottom: 10px;">
              <a class="sidebar-link" href="${pageContext.request.contextPath}/admin-page">
                <span class="icon">
                  <i class="c-blue-500 ti-home"></i>
                </span>
                <span class="title" style="color: white !important;">Dashboard</span>
              </a>
            </li>     
               
            <li class="nav-item" style="margin-bottom: 10px;">
              <a class='sidebar-link' href="${pageContext.request.contextPath}/admin-charts">
                <span class="icon">
                  <i class="c-indigo-500 ti-bar-chart"></i>
                </span>
                <span class="title" style="color: white !important;">Charts</span>
              </a>
            </li> 
            <li class="nav-item" style="margin-bottom: 10px;">
              <a class='sidebar-link' href="${pageContext.request.contextPath}/admin-chats">
                <span class="icon">
                  <i class="c-deep-purple-500 ti-comment-alt"></i>
                </span>
                <span class="title" style="color: white !important;">Chat</span>
              </a>
            </li>      
            <li class="nav-item dropdown" style="margin-bottom: 10px;">
              <a class="sidebar-link" href="${pageContext.request.contextPath}/admin-ui">
                <span class="icon">
                    <i class="c-pink-500 ti-palette"></i>
                  </span>
                <span class="title" style="color: white !important;">UI Elements</span>
              </a>
            </li>
            <li class="nav-item dropdown" style="margin-bottom: 10px;">
              <a class="dropdown-toggle" href="javascript:void(0);">
                <span class="icon">
                  <i class="c-orange-500 ti-layout-list-thumb"></i>
                </span>
                <span class="title" style="color: white !important;">Tables</span>
                <span class="arrow">
                  <i class="ti-angle-right"></i>
                </span>
              </a>
              <ul class="dropdown-menu" style="margin-bottom: 10px;">          
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Admin">
                 <span style="color: white !important;">Admin</span> 
                  </a>
                </li>             
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Category">
                  <span style="color: white !important;">Category</span>
                  </a>
                </li>
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Product">
                  <span style="color: white !important;">Product</span>
                  </a>
                </li>
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Phieu-Nhap">
                  <span style="color: white !important;">Phiếu Nhập</span>
                  </a>
                </li>
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Donhang">
                  <span style="color: white !important;">Đơn Hàng</span></a>
                </li>
                <li>
                  <a class='sidebar-link' href="${pageContext.request.contextPath}/List-Thongke">
                  <span style="color: white !important;">Thong ke</span></a>
                </li>
              </ul>
            </li>
        
            <li class="nav-item dropdown" style="margin-bottom: 10px;">
              <a class="dropdown-toggle" href="javascript:void(0);">
                <span class="icon">
                    <i class="c-red-500 ti-files"></i>
                  </span>
                <span class="title" style="color: white !important;">Pages</span>
                <span class="arrow">
                    <i class="ti-angle-right"></i>
                  </span>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <a class='sidebar-link' href="blank.html">Blank</a>
                </li>                 
                <li>
                  <a class='sidebar-link' href="404.html">404</a>
                </li>
                <li>
                  <a class='sidebar-link' href="500.html">500</a>
                </li>
                <li>
                  <a class='sidebar-link' href="signin.html">Sign In</a>
                </li>
                <li>
                  <a class='sidebar-link' href="signup.html">Sign Up</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>

      <!-- #Main ============================ -->
      <div class="page-container">
        <!-- ### $Topbar ### -->
        <div class="header navbar">
          <div class="header-container">
            <ul class="nav-left">
              <li>
                <a id='sidebar-toggle' class="sidebar-toggle" href="javascript:void(0);">
                  <i class="ti-menu"></i>
                </a>
              </li>
              <li class="search-box">
                <a class="search-toggle no-pdd-right" href="javascript:void(0);">
                  <i class="search-icon ti-search pdd-right-10"></i>
                  <i class="search-icon-close ti-close pdd-right-10"></i>
                </a>
              </li>
              <li class="search-input">
                <input class="form-control" type="text" placeholder="Search...">
              </li>
       
					
            </ul>
            <ul class="nav-right">
        	
        	<li class="dropdown" style="top: 15px;right: 52px;">
              <div class="hiscart shownoti">
                <a style=" background-color: white;" href="${pageContext.request.contextPath}/List-Phieu-Nhap" class="temcart no">
                    <div>
                    <i class="bhx-cart"></i> 
                     <span class="">  
                     <%ArrayList<Products>  phieuNhap = new phieunhapDao().getPhieuNhap();%>
                     <%float tongcong =0;  int sum=0; for(int i = 0;i<phieuNhap.size();i++){ 
                    	 sum+=phieuNhap.get(i).getProduct_soLuongMua();
                    	 tongcong +=(phieuNhap.get(i).getProduct_price()-phieuNhap.get(i).getProduct_price()*phieuNhap.get(i).getProduct_discount()/100)*phieuNhap.get(i).getProduct_soLuongMua();%>  
        			<input type="hidden" value="<%=phieuNhap.get(i).getProduct_soLuongMua() %>" />
                    <%} %>
                     <%=sum %>
                    </span>
                    
                    </div>
                   
                </a>
                
                   <div class="header-cart-detail" >
	            <div  class="header-cart-products" style="display: grid;">
	            <%if(phieuNhap.size()>0){ %>
	            	<%for(int i = 0;i<phieuNhap.size();i++){ %>
		            <div  class="row header-cart-item">
			            <div  class="col-xs-3 header-cart-item-img">
				            <img class="notify-img"   src="${pageContext.request.contextPath}/assets/images/<%out.print(phieuNhap.get(i).getProduct_image()); %>">
				        </div>
				            <div   class="col-xs-9 header-cart-item-section">
					            <div   class="row">
					            	<a   title="<%out.print(phieuNhap.get(i).getProduct_name()); %>" class="col-xs-12 header-cart-item-name"><%out.print(phieuNhap.get(i).getProduct_name()); %></a>
					            </div>
					            <div  class="row mt5" style="display: flex;justify-content: space-between;">
						            <div   class="col-xs-4 text-left header-cart-qty" style="padding-right: 72px;">
						                    x<%=phieuNhap.get(i).getProduct_soluongtonkho()%>
						            </div>
						            <div   class="col-xs-8 text-right header-cart-price colormoney" >
						                   <fmt:formatNumber type = "number" groupingUsed = "true" 
											value="<%=(phieuNhap.get(i).getProduct_price()-phieuNhap.get(i).getProduct_price()*phieuNhap.get(i).getProduct_discount()/100)%>" />đ
						            </div>
									             <!-- XOA THEO ID -->
									<form style="margin-left: 87px;" accept-charset="UTF-8"  action="${pageContext.request.contextPath}/xoa-phieu-nhap/<%=phieuNhap.get(i).getProduct_id() %>" method="post"  enctype="multidata/form-data">			             				                      
				                       
				                       <input type="hidden" name="product_id" value="<%=phieuNhap.get(i).getProduct_id() %>" > 
				                       <input type="hidden" name="product_soluongtonkho" value="<%=phieuNhap.get(i).getProduct_soluongtonkho() %>" > 
										<button type="submit" style="background: #fff;" ><i class='fas fa-minus' style='font-size:20px;color:red'></i>
							 			</button>	                       
				                    </form>
				                    			<!-- END XOA THEO ID -->
					            </div>
				           </div>
		           </div>
		           <%} %>
		           <%}else{ %>
		           <h1 class="nocart" style="font-size: 14px;"><b>KHÔNG CÓ SẢN PHẨM TRONG PHIẾU NHẬP</b></h1>
		           <%} %>
	             </div>
	             <div   class="header-cart-total-row" style="justify-content: center;">
		             <div   class="header-cart-total-text">
		             	 Có tổng số <%=sum %> sản phẩm
		             </div>
		             
	              </div>
	         <%if(phieuNhap.size()>0){ %>
	         <form accept-charset="UTF-8"  action="${pageContext.request.contextPath}/creat-phieu-nhap" method="post"  enctype="multidata/form-data">
	          <%for(int i = 0;i<phieuNhap.size();i++){ %>
	          <input hidden="true"  name="product_id[]" value="<%out.print(phieuNhap.get(i).getProduct_id()); %>">
	          <input hidden="true" name="Soluongnhap[]" value="<%out.print(phieuNhap.get(i).getProduct_soluongtonkho()); %>">
	          <input hidden="true" name="Dongianhap[]" value="<%out.print(phieuNhap.get(i).getProduct_price()); %>">
	          
	          <%} %>
	           <button type="submit" style="margin-right: 54px;"  color="white" class="header-cart-go-to-checkout">
	            Hoàn thành phiếu nhập
	          </button>
	          </form>
	            <%} %>
	         
          </div>
                </div>
                </li>
                
              <li class="dropdown">
                <a href="" class="dropdown-toggle no-after peers fxw-nw ai-c lh-1" data-toggle="dropdown">
                  <div class="peer mR-10">
                    <img class="w-2r bdrs-50p" src="https://randomuser.me/api/portraits/men/10.jpg" alt="">
                  </div>
                  <div class="peer">
                    <span class="fsz-sm c-grey-900"></span>
                  </div>
                </a>
                <ul class="dropdown-menu fsz-sm">
       
                  <li role="separator" class="divider"></li>
                  <li>
                    <a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700">
                      <i class="ti-power-off mR-10"></i>
                      <span>Logout</span>
                    </a>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>
          
        </div>