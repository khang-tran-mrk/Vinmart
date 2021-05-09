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
                    
	                       
                    <table id="dataTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                          <tr>
                            <th>ID Phiếu nhập</th>
                            <th>Ngày nhập</th>                       
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                           <th>ID Phiếu nhập</th>
                            <th>Ngày nhập</th>                       
                            <th>Action</th>
                          </tr>
                        </tfoot>
                        <% ConnectionToDB con = new ConnectionToDB();
                        	ResultSet rs = con.selectData("select * from PHIEUNHAP ");
                        	while(rs.next()){%>
                        <tbody>
                        	
                          <tr>
                            <td>#<%=rs.getInt("MaPN") %></td>
                            
                            <td><%=rs.getString("NgayNhap") %></td>                     
                            <th style="DISPLAY: flex;">
      			            <!-- SEE DETAIL -->
      			            <form action="${pageContext.request.contextPath}/chi-tiet-phieu-nhap/<%=rs.getInt("MaPN") %>" method="post"  enctype="multidata/form-data">
                             <button  title="DETAIL">
                            	
                            	<i class="fas fa-calendar-week" style='font-size:32px;color:red'></i>
                            </button>
                             <input hidden="true" name="MaPN" value="<%=rs.getInt("MaPN") %>">
                             </form>
                             <a title="" class="tipS"  href=""  data-toggle="modal" data-target="#myModalIN">
	                        <i class="fas fa-print" style='font-size:32px;'></i>
	                        </a>                                                                   
                            </th>
                            
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
     	<!-- The Modal ADD -->
  <div class="modal fade" id="myModalIN">
    <div class="modal-dialog">
      <div class="modal-content" style="width: 170%; margin-left: -168px;">
      <div >Tel: <i style="text-decoration:underline;text-decoration-style: dotted;">0123456789</i>; 
      		Hotline: <i style="text-decoration:underline;text-decoration-style: dotted;">0799854546</i></div>
        <!-- Modal Header -->
        <div class="modal-header" >
        <div style=" margin-left: 308px;">
        <h4><b>PHIẾU NHẬP KHO</b></h4>
        <div style="margin-left: 183px; ">Date: <i style="text-decoration:underline;text-decoration-style: dotted;">12-12-2002</i></div>
        <div style="margin-left: 183px; ">Number: <i style="text-decoration:underline;text-decoration-style: dotted;">#1</i></div>
        </div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div>Nhap tai kho: <i style="text-decoration:underline;text-decoration-style: dotted;"><b>VinMart Le Van Viet</b></i> </div>
        	 <table id="dataTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                          <tr>
                            <th>STT</th>
                            <th>MASP</th>   
                            <th>TenSP</th>
                            <th>So luong</th>                        
                            <th>Don gia</th>
                            <th>%</th>
                            <th>Thanh tien</th>
                          </tr>
                        </thead>
                       
                       
                        <tbody>
                        	
                          <tr>
                            <td>#1</td>
                            <td>#1</td>
                            <td>2</td>                     
                            <td>#1</td>
                            <td>2</td> 
                            <td>2</td> 
                            <td>2</td> 
                          </tr>   
                             <tr>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td>#1</td>
                             </tr>
                                     
                        </tbody>
                      
                      </table>
                    <div style="margin-left: 84px;">Tong so tien bang chu: </div>
                    <div style="border: 1px solid rgba(0,0,0,.2);border-radius: .3rem;outline: 0;"></div>
                    <br> 
                    <div style=" margin-left: 612px;">
                   <div> Ngay 28 thang 07 nam 2021</div>
                    <div style=" margin-left: 60px;">THU KHO</div>
                    <div style=" margin-left: 55px;">(Ky, ho ten)</div>
                    <div style="margin-left: 30px;">Phan Hoai Phuong</div>
                    </div>
                    
        </div>
        
        <!-- Modal footer -->
         
        <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Printf</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- END The Modal ADD -->
</body>
</html>
<%}%>