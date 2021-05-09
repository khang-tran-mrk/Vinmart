<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
 <%@page import="VinMart.entities.Users"%>
 <%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 6) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 response.sendRedirect("admin-page");
 }
 %>
                    <!DOCTYPE html>
<html>
<body class="app"  >

 
       <table  id="gun2k2" class="table table-striped table-bordered" cellspacing="0" width="100%">
	       		
	      				<thead>
                          <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt</th>                         
                            <th>Khách hàng</th>                         
                            <th>Trạng thái</th>                                             
                            <th>Nhân viên</th>                                          
                            <th>Details</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt</th>                          
                            <th>Khách hàng</th>                      
                            <th>Trạng thái</th>                           
                            <th>Nhân viên</th>                                                             
                            <th>Details</th>
                             <th>Action</th>
                          </tr>
                        </tfoot>
                        <c:if test="${Listdh.size()==0 }" >
                        <tbody>
                          <tr>
                          	<th>NOT DATA</th>
                            <th>NOT DATA</th>                          
                            <th>NOT DATA</th>                      
                            <th>NOT DATA</th>                           
                            <th>NOT DATA</th>                                                             
                            <th>NOT DATA</th>
                             <th>NOT DATA</th>
                          </tr>
                          </tbody>
                        </c:if>
                        <c:forEach var="item" items="${Listdh}" >
                         
                        <tbody>
                          <tr>
                           <th>#${item.donhang_id }</th>
                            <th>${item.donhang_ngaydat }</th>                           
                            <th>${item.nguoimua_id }</th>                       
                            <th>
                         <c:if test="${item.donhang_trangthai==1 }" >
					     Đã xác nhận 
					    </c:if>
					    <c:if test="${item.donhang_trangthai==2 }" >
					     Chờ xuất hàng 
					    </c:if>
					    <c:if test="${item.donhang_trangthai==3 }" >
					    Đang giao hàng
					    </c:if>				    
					    <c:if test="${item.donhang_trangthai==4 }" >
					     Giao thành công
					    </c:if> 
					    <c:if test="${item.donhang_trangthai==0 }" >
					     Đơn hàng đã hủy
					    </c:if> 
					    
					    </th> 
					     <c:if test="${item.donhang_trangthai != 1 }" >
                            <th>${item.nhanvien_id} </th> 
                            </c:if>  
                         <c:if test="${item.donhang_trangthai == 1   }" >
                            <th>NULL </th> 
                            </c:if>   
                                                             
                            <th style="DISPLAY: flex;">
                            <form action="${pageContext.request.contextPath}/ct-don-hang/${item.donhang_id}" method="post"  enctype="multidata/form-data">
                             <button  title="DETAIL">
                            	<i class='fas fa-money-check-alt' style='font-size:32px;color:red'></i>
                            </button>
                             <input hidden="true" name="donhang_id" value="${item.donhang_id}">
                             </form>
                             <a title="" class="tipS"  href=""  data-toggle="modal" data-target="#myModalIN">
	                        <i class="fas fa-print" style='font-size:32px;'></i>
	                        </a>  
                            </th>
                             <th>
                             <c:if test="${item.donhang_trangthai==1 }" >
                             <form action="${pageContext.request.contextPath}/update-trangthai/${item.donhang_id}" method="post"  enctype="multidata/form-data">
                             <button  style="border-style: none; "  class="remove"><i class="tpl-status4 remove"></i>
							    	 <span>Cancel</span>
							 </button>
							  <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai -1}">
								<input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">			
							 </form>
							 </c:if>
							 <form action="${pageContext.request.contextPath}/update-trangthai/${item.donhang_id}" method="post"  enctype="multidata/form-data">
							 <c:if test="${item.donhang_trangthai==1 }" >
								 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
								 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">						  
								 <button  type="submit" style="background: #fff;" class="updatee"><i class='far fa-check-circle updatee' style='font-size:20px;color:green'></i>
							 		<span>Confirm</span>
							 	</button>
							 </c:if>
							 <c:if test="${item.donhang_trangthai==2 }" >
								 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
								 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">
								 <button type="submit" style="background: #fff;" class="updatee"><i class='far fa-check-circle updatee' style='font-size:20px;color:green'></i>
							 		<span>Confirm</span>
							 </button>
							 </c:if>
							 <c:if test="${item.donhang_trangthai==3 }" >
								 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
								 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">
								 <button type="submit" style="background: #fff;" class="updatee"><i class='far fa-check-circle updatee' style='font-size:20px;color:green'></i>
							 		<span>Confirm</span>
							 </button>
							 </c:if>
	
							 </form>
                             </th>
                          </tr>                
                        </tbody>
                        </c:forEach>
                    </table>  
    
     	
</body>
</html>
<%}%>