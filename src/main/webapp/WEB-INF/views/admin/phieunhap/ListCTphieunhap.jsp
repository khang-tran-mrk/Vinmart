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
<%@page import="java.text.NumberFormat"%>
<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 session.setAttribute("role","true");  
	 response.sendRedirect("admin-page");
 }
 %>
 <%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<!-- Head -->
	 	 <%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp" %>
	 	<!-- End Head -->
	 	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	 	
</head>
<body class="app">

		<!-- Header -->
		<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp" %>
		<!-- END Header -->
		  <main class='main-content bgc-grey-100' style="background-color: #131c29!important">
          <div id='mainContent'>
            <div class="container-fluid">
              <h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Data Tables</h4>
              <div class="row">
                <div class="col-md-12">
                  <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    
	                      <% 	int MaPN = Integer.parseInt(request.getParameter("MaPN"));	 
                       		ConnectionToDB con = new ConnectionToDB();
                        	ResultSet rs = con.selectData("select * from CHITIETPN where MaPN =  " + MaPN);
                        	%>
                      <a title="GO BACK" class="tipS"  href="${pageContext.request.contextPath}/List-Phieu-Nhap" >
	                        <img src="${pageContext.request.contextPath}/assets/images/trove.jpg" height="50" style="max-width: 50px">
	                  </a>
                       Chi tiết phiếu nhập #<%=MaPN %>  	 
                    <table id="dataTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                          <tr>                        
                            <th>Mã sản phẩm</th>                       
                            <th>Đơn giá </th>
                            <th>Số lượng</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>                       
                            <th>Mã sản phẩm</th>                       
                            <th>Đơn giá </th>
                            <th>Số lượng</th>
                          </tr>
                        </tfoot>
                        <%while(rs.next()){ %>
                        <tbody>                     	
                          <tr>
                            <td>#<%=rs.getInt("product_id") %></td>                          
                            <td><%=rs.getInt("Dongianhap") %></td>                     
                            <td><%=rs.getInt("Soluongnhap") %></td> 
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