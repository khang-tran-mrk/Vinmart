<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 6) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 session.setAttribute("role","true");  
	 response.sendRedirect("admin-page");
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<!-- Head -->
	 	 <%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp" %>
	 	<!-- End Head -->
</head>
<body class="app">
		<!-- Header -->
		<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp" %>
		<!-- END Header -->

		<!-- ### $App Screen Content ### -->
        <main class='main-content bgc-grey-100' style="background-color: #131c29!important">
          <div id='mainContent'>
            <div class="container-fluid">
              <h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Data Tables</h4>
              <div class="row">
                <div class="col-md-12">
                  <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    <a title="GO BACK" class="tipS"  href="${pageContext.request.contextPath}/List-Donhang" >
	                        <img src="${pageContext.request.contextPath}/assets/images/trove.jpg" height="50" style="max-width: 50px">
	                        </a>
	                     
	                     <% 
	                     int donhang_id = Integer.parseInt(request.getParameter("donhang_id"));
	                     ConnectionToDB con = new ConnectionToDB();
                                	ResultSet rs = con.selectData("select * from ct_donhang where donhang_id = " 
                                 		+ donhang_id);       
                                	ResultSet p,d,w,ct_dh; 	
                                %>  
	                 Chi tiết đơn hàng #<%=donhang_id %>
                    <table id="dataTable" class="table table-striped table-bordered" >
                        <thead>
                          <tr>
                            <th>Mã sản phẩm</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Địa chỉ</th>
                            <th>Province</th>
                            <th>District</th>
                            <th>Ward</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>Mã sản phẩm</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Địa chỉ</th>
                            <th>Province</th>
                            <th>District</th>
                            <th>Ward</th>
                          </tr>
                        </tfoot>
                        
                        <%while(rs.next()){ %>
                        <tbody>
                           <tr>
                            <th>#<%=rs.getInt("product_id") %></th>
                            
                            <th>
                          
                             <% 
                             ResultSet temp = con.selectData("select product_name from product where product_id = " + rs.getInt("product_id"));
                             temp.next();
                             String tenSP = temp.getString("product_name");
                                ResultSet sp = con.selectData("select * from product where product_id =" +rs.getInt("product_id") );			                                
				                while(sp.next()){%>
							     <div class="image_thumb"> 
							        <img height="50" src="${pageContext.request.contextPath}/assets/images/<%=sp.getString("product_image") %>">
							            <a target="_blank" title="chi-tiet-san-pham" class="tipS" href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=sp.getInt("product_id")%>">
							               <b><%=tenSP%></b>
							            </a>
							    	<div class="clear"></div>
							    </div>
							    <%} %>			
                            </th>
                            <th><%=rs.getString("soLuong")%></th>
                            <th>
                            <%int thanhtien =  rs.getInt("thanhtien");%>
                             	<span style="color:red;"><fmt:formatNumber type = "number" groupingUsed = "true" 
								value="<%=thanhtien%>" />₫ </span>
                            </th>
                            <th><%=rs.getString("diachi")%></th>
                         <% ct_dh = con.selectData("select * from CT_DonHang where donhang_id = "+rs.getInt("donhang_id") + " "); 
					     
					     ct_dh.next();%>
					     <%p = con.selectData("select province_name from province where id = "+ct_dh.getInt("province"));
	                            p.next();
	                            String tenprovince = p.getString("province_name");
	                            
	                            d = con.selectData("select district from district where id = "+ ct_dh.getInt("district")+ " and province_id = " + ct_dh.getInt("province") );
                				d.next();
                				String tendistrict = d.getString("district");
                				
                				w = con.selectData("select ward from ward where id = "+ ct_dh.getInt("ward") );
                				w.next();
                				String tenward = w.getString("ward");
	                          %>
                            <th><%=tenprovince %></th>
                            <th><%=tendistrict %></th>
                            <th><%=tenward %></th>
                          </tr>
                        </tbody>
                       <%} %>
                      </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        
		 <!-- FOOTER -->
		<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp" %>
		<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp" %>
     	<!-- END FOOTER -->
</body>
</html>
<%}%>