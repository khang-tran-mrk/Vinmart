<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>
 <%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 7) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 response.sendRedirect("admin-page");
 }
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<!-- Head -->
	 	 <%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp" %>
	 	<!-- End Head -->
	 	<!-- Head table -->
	 	 <%@include file="/WEB-INF/views/layouts/admin/decorators/table.jsp" %>
		<!-- END Head table -->
</head>
<body class="app">
		<!-- Header -->
		<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp" %>
		<!-- END Header -->
		
		
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Employee</h2>
              </div>
            </div>
            <c:url value="/addEmployee" var="addEmployee" />
            <form action="${ addEmployee }" method="POST" class="tm-edit-product-form">
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                
                  <div class="form-group mb-3">
                  <div class="form-group mb-3">
                    <label for="name">Email
                    </label>
                    <input id="name" name="users_email"  type="email" class="form-control validate" required="">
                  </div>
                  <div class="form-group mb-3">
                    <label for="name">Mật khẩu
                    </label>
                    <input id="name" name="users_password" type="password" class="form-control validate" required="">
                  </div>
                    <label for="name">Họ và tên
                    </label>
                    <input id="name" name="name" type="text" class="form-control validate" required="">
                  </div>
                  <div class="form-group mb-3">
                    <label for="name">Số diện thoại
                    </label>
                    <input id="name" name="sdt" type="text" class="form-control validate" required="">
                  </div>
              
                 <%ConnectionToDB con = new ConnectionToDB();
							ResultSet rs = con.selectData("select * from Role where role_id != 1 and role_id != 3");
										while(rs.next()){%>
							
							<input type="radio"  name="role_id" value="<%=rs.getInt("role_id") %>">
							<label for="male"><%=rs.getString("role_name") %></label><br> 
							
						<%} %>
                                 
              </div>
             <!--   <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i class="fas fa-cloud-upload-alt tm-upload-icon" onclick="document.getElementById('fileInput').click();"></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;">
                  <input type="button" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE" onclick="document.getElementById('fileInput').click();">
                </div>
              </div>-->
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Thêm nhân viên</button>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
 		<!-- FOOTER -->
		<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp" %>
		<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp" %>
     	<!-- END FOOTER -->
</body>
</html>
<%}%>