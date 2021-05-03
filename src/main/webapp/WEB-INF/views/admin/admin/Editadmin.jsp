<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("../trang-chu");	
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Head -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
<!-- Head table -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/table.jsp"%>
<!-- END Head table -->
</head>
<body class="app">
	<!-- Header -->
	<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp"%>
	<!-- END Header -->




	<div class="row">
	
		<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
			<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
			<c:url value="/editadmin" var="editadmin" />
			<form action="${ editadmin}" method="POST" modelAttribute="userid" class="tm-edit-product-form">
				<div class="row">
					<div class="col-12">
						<h2 class="tm-block-title d-inline-block">Add Product</h2>
					</div>
				</div>
				<div class="row tm-edit-product-row">
					<div class="col-xl-6 col-lg-6 col-md-12">
							<div class="form-group mb-3">
								<label for="name" > Id </label> <input id="name" name="users_id" value="${ userid.users_id }"   readonly required class="form-control validate"/>
							</div>
							<div class="form-group mb-3">
								<label for="name" > User </label> <input id="name" name="users_email" value="${ userid.users_email }" type="email"  readonly required class="form-control validate"/>
							</div>	
							<div class="form-group mb-3">
								<label for="name" > Password </label> <input id="name" name="users_password" value="${ userid.users_password }" type="password" required class="form-control validate"/>
							</div>	
							<div class="form-group mb-3">
								<label for="role" >Role</label> <input id="role" name="role_id" value="${ userid.role_id }" readonly required class="form-control validate"/>
							</div>					
							</div>

						
					</div>
					
					<div class="col-12">
						<button type="submit"
							class="btn btn-primary btn-block text-uppercase">Lưu</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	<!-- FOOTER -->
	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
	<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	<!-- END FOOTER -->
</body>
</html>
<%}%>