<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("../trang-chu");	
 }
 else {
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 response.sendRedirect("admin-page");
 }
 %>
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
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form action="" class="tm-edit-product-form">
                  <div class="form-group mb-3">
                    <label for="name">Product Name
                    </label>
                    <input id="name" name="name" type="text" class="form-control validate" required="">
                  </div>
                  <div class="form-group mb-3">
                    <label for="description">Description</label>
                    <textarea class="form-control validate" rows="3" required=""></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label for="category">Category</label>
                    <select class="custom-select tm-select-accounts" id="category">
                      <option selected="">Select category</option>
                      <option value="1">New Arrival</option>
                      <option value="2">Most Popular</option>
                      <option value="3">Trending</option>
                    </select>
                  </div>
                  <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="expire_date">Expire Date
                          </label>
                          <input id="expire_date" name="expire_date" type="text" class="form-control validate hasDatepicker" data-large-mode="true">
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="stock">Units In Stock
                          </label>
                          <input id="stock" name="stock" type="text" class="form-control validate" required="">
                        </div>
                  </div>
                  
              </form></div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i class="fas fa-cloud-upload-alt tm-upload-icon" onclick="document.getElementById('fileInput').click();"></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;">
                  <input type="button" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE" onclick="document.getElementById('fileInput').click();">
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
              </div>
            
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