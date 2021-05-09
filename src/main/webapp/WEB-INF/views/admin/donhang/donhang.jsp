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
		<%@include file="/WEB-INF/views/layouts/customer/decorators/headinfo.jsp" %>
		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
		
	<style>
	  #bill th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
  }
  #bill td, #bill th {
 
  padding: 8px;
}
	</style>
</head>
<body class="app" >
		<!-- Header -->
		<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp" %>
		<!-- END Header -->

		<!-- ### $App Screen Content ### -->
        <main class='main-content bgc-grey-100'  style="background-color: #131c29!important">
          <div id='mainContent'  >
            <div class="container-fluid">
              <h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Data Tables</h4>
              <div class="row" >
                <div class="col-md-12" >
                  <div class="bgc-white bd bdrs-3 p-20 mB-20" >

                   <div id="history" class="history"   >
    
    <div class="choose" style="margin-top: -20px;">
        <h3 class="lsmh active" data-tab="orderlist">Lịch sử mua hàng</h3>    
    </div>
    <div class="tcontent orderlist" data-tab="orderlist" >  
    <div class="order sso" data-id=""   >
	    <div class="status" >
	   
			    <div class="createdate infoOther" data-id="" >			
				  
                    
				    <!-- TRANG THAI DON HANG -->
				    <div class="orderstatus" data-id="" >
					    <label id = "trangthaidonhang" class="complete statusdelivery">Check trạng thái <i class="tpl-status1"></i>
					     
					 
					    </label>
					    <div class="list-status info-status hidden">
						    <div class="status">
						   		
							    <button id="xacnhan" style="border-style: none;" ><i class="tpl-status1"></i> 
							    	<span>Đã xác nhận</span>
							    </button>
							     <button id="chohang" style="border-style: none;" ><i class="tpl-status2"></i> 
							    	<span>Chờ xuất hàng</span>
							    </button>
							    <button id="danggiao" style="border-style: none;" ><i class="tpl-status6"></i> 
							    	<span>Đang giao hàng</span>
							    </button>
							    <button id="thanhcong" style="border-style: none;" ><i class="tpl-status7"></i>
							    	 <span>Giao thành công</span>
							     </button>
							     <button id="canceldh" style="border-style: none;" ><i class="tpl-status4"></i>
							    	 <span>Cancel</span>
							     </button>
							   
						     </div>
					     </div>
				     </div>
					
				     
			  </div>
		     <div class="clear"></div>
		     
	     </div>
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
	   
     </div>
     
     

     </div>
   
</div>
                     
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
     	
     	<!-- FOOTER -->
		

    
    
  
    <script  src="//cdn.tgdd.vn/bachhoaxanh/www/Scripts/min/history.min.v202103121957.js"></script>
   
   	<script type="text/javascript">
  	 
    $(document).ready(function() {
        $('#chohang').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/cho-xuat-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	//$("#trangthaidonhang").text("");
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#xacnhan').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/xac-nhan-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#danggiao').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/dang-giao-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#thanhcong').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/giao-thanh-cong",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#canceldh').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/huy-giao-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
        	return false;
    });
});
    </script>
    
   <script>
		$(document).ready(function() {
			$('.remove').click(function(event) {
				var donhang_id = $(this).attr("donhang_id");
				if(confirm("Bạn có muốn hủy mục này ?")){
					
					window.location = "${pageContext.request.contextPath}/update-trangthai/"+donhang_id;
					
				}else{
						return false;
				}
			});
		});
	</script> 
	
	 <script>
		$(document).ready(function() {
			$('.updatee').click(function(event) {
				var donhang_id = $(this).attr("donhang_id");
				if(confirm("Bạn có muốn Duyệt đơn này ?")){
					type: "POST",
					window.location = "${pageContext.request.contextPath}/update-trangthai/"+donhang_id;
					
				}else{
						return false;
				}
			});
		});
	</script> 
   	<!-- Hoa don -->
     	<div class="modal fade" id="myModalIN">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="width: 154%;margin-left: -72px;">
      
        <!-- Modal Header -->
        <div class="modal-header" style="border-bottom: none;">
        <div>
        <a style="background: #ed1c24;">
        <img src="https://vinmart.com/images/logo_2.png" alt=""  style=" width: 140px;"/>
        
        </a>
        <div style="font-size: 13px;"><i>Ngày bán: 07/07/2022</i></div>
        </div>
        <div style=" margin-left: 30px;">
          <h4 class="modal-title"><b>Cửa hàng VinMart</b></h4>
          <div style="font-size: 12px;">Đ/c: 120 Lê Văn Việt, Phường Hiệp Phú, Q9, Tp.HCM</div>
           <div style="font-size: 12px;">Hotline: 0123456789</div>
          </div>
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div style=" margin-left: 148px;"><b>HÓA ĐƠN BÁN HÀNG</b></div>
          <div style=" margin-left: 182px;"><b>#HD001</b></div>
          
          <div><b>Khách hàng: Phan Hoài Phương</b></div>
          <table id="bill" style="display: flex;justify-content: center;">
			  <tr>
			    <th>Mặt hàng</th>
			    <th>Đơn giá</th>
			    <th>SL</th>
			    <th>Thành tiền</th>
			  </tr>
			  <tr>
			    <td>1</td>
			    <td style="float: right;">2</td>
			    <td style="text-align: center;" >3</td>
			    <td style="float: right;">4</td>
			  </tr>
			</table>
			
			<div style="border: 1px dashed;outline: 0;"></div>
			
			<div style="margin-left: 210px; padding-top: 20px;"> 
				<div><b>Cộng tiền hàng:</b> <b style="float: right;"> 68,000</b></div>
				<div style="justify-content: space-between;display: flex;">
					<div style="width: 102px;">
					<b style="float: right;">Tiền Ship:</b>
					</div>  
					<b style="float: right;"> 25,000</b>
				</div>
				<div style="justify-content: space-between;display: flex;">
					<div style="width: 102px;">
					<b style="float: right;">Tong cong:</b>
					</div>  
					<b style="float: right;"> 125,000</b>
				</div>
				
				<div><i>Một trăm hai lăm nghìn đồng chẵn</i></div>
			</div>
			 <div style="text-align: center; padding-top: 20px; padding-bottom: 20px;font-size: 15px;">
			 <b>Xin cảm ơn quý khách, hẹn gặp lại!</b>
			 </div>
        </div>
        
        <!-- Modal footer -->
       
        <div class="modal-footer">
        	
         <form  class="tm-edit-product-form" action="${pageContext.request.contextPath}/del-category" method="post">
          <button style="width: 100%;background-color: red;" type="submit" class="btn btn-primary btn-block text-uppercase deleteCate">OK ?</button>
          <input type="hidden" name="category_id"  id="category_id"  />
          </form>
          
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    <!-- End Hoa don -->
</body>
</html>
<%}%>