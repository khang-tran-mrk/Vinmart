
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>

 <%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
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
		  <main class='main-content bgc-grey-100' style="background-color: #000000!important">
          <div id='mainContent'>
            <div class="container-fluid">
              <h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Data Tables</h4>
              
              <div  class="row">
              <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModalbieudo1">Xem bieu do Tron</button>
              <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModalbieudo2">Xem bieu do KV</button>
                <div class="col-md-12">
                  <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    				<%
                    				ConnectionToDB con = new ConnectionToDB();
		                 			ResultSet rs = null;
		                 			int tongtien = 0;
		                 			
									String ngaybatdau=null;
		                 			String ngayketthuc=null;
		                 			
									String type = request.getParameter("type");
									if (request.getParameter("ngaybatdau")!=null){
										ngaybatdau =  request.getParameter("ngaybatdau");
		                                ngayketthuc = request.getParameter("ngayketthuc");
		                                
									}
									
									%> 
									<form action=""  method = "get">
                                	<input type = date name = "ngaybatdau" max="<%=LocalDate.now() %>" value = "<%=ngaybatdau %>" required>
                                	<input type = date name = "ngayketthuc" value = "<%=ngayketthuc%>" required>
                                	
                                	<select name = "type">
                                	<%if(type != null){ %>
                                	<%if(type.equals("donhang")){ %>
                                		<option value = "donhang" >Đơn hàng</option>
                                		<option value = "product_id">Mã Sản Phẩm</option>
                                		<%}else{ %>
                                		<option value = "product_id">Mã Sản Phẩm</option>
                                		<option value = "donhang" >Đơn hàng</option>
                                		<%}}else{ %>
                                		<option value = "donhang" >Đơn hàng</option>
                                		<option value = "product_id">Mã Sản Phẩm</option>
                                		<%} %>
                                		
                                	</select>
                                	
                                	<input class="btn btn-info btn-sm" type = submit value = "Thống kê">
                                </form>      
	         
	<%if (ngaybatdau != null && ngayketthuc != null && type != null) {%>              
                    <table id="dataTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
           <%if (type.equals("donhang")) {
			ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau 
            	+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
									%>         
                        <thead>
                          <tr>
                            <th>DonHangID</th>
                            <th>Nguoi mua</th>                       
	                        <th>Ngày mua</th> 
							<th>Thành tiền</th> 
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>DonHangID</th>
                            <th>Nguoi mua</th>                        
                            <th>Ngày mua</th> 
							<th>Thành tiền</th> 
                          </tr>
                        </tfoot>
              <%while(donhang.next()){
            	 
				rs = con.selectData("select top (1) * from ct_donhang where donhang_id = "+donhang.getInt("donhang_id"));
				rs.next();
				int thanhtien= rs.getInt("thanhtien");%> 
            		     
                        <tbody>
                        	
                          <tr>
                           <th><%=rs.getInt("donhang_id")%></th>
                           <th><%=donhang.getInt("nguoimua_id")%></th>                       
                           <th><%=donhang.getString("donhang_ngaydat")%></th>
                           <th><fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=thanhtien%>" /></th>
                           
                          </tr>   
                                     
                        </tbody>
               <%}}else{
            	   ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau 
                       	+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
            	   
				%>    
						 <thead>
                          <tr>
                            <th>ProductID</th>
                            <th>Product name</th>                       
                            <th>Buyed</th>                         
                            <th>Doanh thu </th>                      
                          </tr>
                        </thead>
                       
              <%while(donhang.next()){
            	  ResultSet ct_dh = con.selectData("select * from ct_donhang where donhang_id =" + donhang.getInt("donhang_id"));
            	 while(ct_dh.next()){ 
            	  ResultSet sanpham = con.selectData("select * from product where product_id =" + ct_dh.getInt("product_id"));
          
	               
	                int soluong =  ct_dh.getInt("soLuong");
	               
	                while(sanpham.next()){
	                	 tongtien += (sanpham.getInt(3)-sanpham.getInt(3)*sanpham.getInt(4)/100)*soluong;
		 		%>   	<tbody>
                        	
                          <tr>                                             
                           <th>#<%=sanpham.getInt("product_id")%></th>
                           <th><%=sanpham.getString("product_name") %></th>
                           <th><%=soluong%></th>                       
                           <th><fmt:formatNumber type = "number" groupingUsed = "true" 
                           value = "<%=(sanpham.getInt(3)-sanpham.getInt(3)*sanpham.getInt(4)/100)*soluong%>" /></th>
                          </tr>   
                                     
                        </tbody>
             <%}}} %>
              			<tfoot>
                          <tr>
                            <th>ProductID</th>
                            <th>Product name</th>                       
                            <th>Buyed</th>                         
                            <th>Doanh thu </th>   
                          </tr>
                          <tr>
                          	<td></td>
                            <td></td>                       
                            <td></td>                         
                          
							<td >Tổng tiền: <fmt:formatNumber type = "number" groupingUsed = "true" value = "<%=tongtien%>" /></td>
							</tr>
                        </tfoot>
                        <%} %>
                      </table>
                      <%} %>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <!-- bieu do  -->
        	<!-- Modal -->
			  <div class="modal fade" id="myModalbieudo1" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">BIỂU ĐỒ DOANH THU SẢN PHẨM THEO ĐƠN HÀNG</h4>
			        </div>
			        <div class="modal-body">
			          <jsp:include page="../bieudo/bieudotron.jsp"></jsp:include>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
        	
        <!-- end bieu do -->
        
        <!-- Modal 2-->
			  <div class="modal fade" id="myModalbieudo2" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">BIỂU ĐỒ DOANH THU SẢN PHẨM THEO ĐƠN HÀNG</h4>
			        </div>
			        <div class="modal-body">
			          <jsp:include page="../bieudo/bieudokhuvuc.jsp"></jsp:include>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
        	
        <!-- end bieu do 2-->
 		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp" %>
		<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp" %>
     	<!-- END FOOTER -->
</body>
</html>
