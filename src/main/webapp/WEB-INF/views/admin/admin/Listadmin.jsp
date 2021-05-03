
<%
Users check = (Users) session.getAttribute("LoginInfo");
if (check == null) {
	response.sendRedirect("trang-chu");
} else {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Users user = (Users) session.getAttribute("LoginInfo");
if ((user.getRole_id() == 7) || (user.getRole_id() == 1) || (user.getRole_id() == 2)) {
	System.out.print("user: " + user.getRole_id());

} else {
	response.sendRedirect("admin-page");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Head -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
</head>
<body class="app">
	<!-- Header -->
	<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp"%>
	<!-- END Header -->
	<!-- ### $App Screen Content ### -->
	<main class='main-content bgc-grey-100'>
		<div id='mainContent'>
			<%
			if (user.getRole_id() == 1) {
			%>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30">Thông tin user</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<!--  thêm nhân viên -->
							<a title="Thêm user nhân viên" class="tipS"
							href="#myAddNhanVien"  data-toggle="modal" data-target=""> <img
								src="${pageContext.request.contextPath}/assets/images/add.png"
								height="50" style="max-width: 50px">
							</a>
							
							
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									
										<thead>
											<tr>
												<th>ID</th>
												<th>Email</th>
												<th>Password</th>
												<th>Role_id</th>
												<th>Action</th>
											</tr>
										</thead>
									<c:forEach var="item" items="${ view_account }" begin="0"
								end="${ view_account.size() }" varStatus="loop">
									<tbody>
										<tr>
											<th>${ item.users_id }</th>
											<th>${ item.users_email }</th>
											<th>${ item.users_password }</th>
											<c:if test="${ item.role_id == 1 }">
											<th>ADMIN</th>
											</c:if>
											
											<c:if test="${ item.role_id == 2 }">
											<th>NHANVIEN_FULL</th>
											</c:if>
											<c:if test="${ item.role_id == 3 }">
											<th>KHACHHANG</th>
											</c:if>
											<c:if test="${ item.role_id == 4 }">
											<th>NHANVIEN_DANHMUC</th>
											</c:if>
											<c:if test="${ item.role_id == 5 }">
											<th>NHANVIEN_SANPHAM</th>
											</c:if>
											<c:if test="${ item.role_id == 6 }">
											<th>NHANVIEN_DONHANG</th>
											</c:if>
											<c:if test="${ item.role_id == 7 }">
											<th>NHANVIEN_KHACHHANG</th>
											</c:if>
											<c:if test="${ item.role_id == 8 }">
											<th>NHANVIEN_DOANHTHU</th>
											</c:if>
											<th>
												<!-- EDIT THEO ID --> 
												<a title="Chỉnh sửa user" class="tipS editRole"
												href="#myEditRole" data-toggle="modal">
													<img
													src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
													height="50" style="max-width: 50px">
												</a> 	
											<input type="hidden" id="users_id" value="${item.users_id}" > 
											<input type="hidden" id="users_email" value="${item.users_email}" > 
											<input type="hidden" id="users_password" value="${item.users_password}" > 
											<input type="hidden" id="role_id" value="${item.role_id}" > 
											</th>
										</tr>
									</tbody>
									</c:forEach>
								</table>
							


						</div>
					</div>
				</div>
			</div>
			<%} %>
			<%
			if ( (user.getRole_id() == 1) ||(user.getRole_id() == 2) ) {
			%>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30">Thông tin nhân viên</h4>

				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									
										<thead>
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
												<th>Action</th>
											</tr>
										</thead>
									<c:forEach var="item" items="${ view_employees }" begin="0"
								end="${ view_employees.size() }" varStatus="loop">
									<tbody>
										<tr>
											<th>${ item.id }</th>
											<th>${ item.name }</th>
											<th>${ item.sdt }</th>
											<th>${ item.gioitinh }</th>
											<th>
												<!-- EDIT THEO ID -->
												 <a title="Chỉnh sửa nhân viên" class="tipS editNV"
												href="#myEditNhanvien" data-toggle="modal"	>
													<img src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
													height="50" style="max-width: 50px">
												</a> 
												<!-- DEL THEO ID --> 
												<a title="Xóa nhanviên" class="tipS removeNV"
													href="#myDelNhanvien" data-toggle="modal"> 
													<img src="${pageContext.request.contextPath}/assets/images/xoa.png"
														height="40" style="max-width: 40px">
												</a>
											<input type="hidden" id="id_nv" value="${item.id}" > 
											<input type="hidden" id="name_nv" value="${item.name}" > 
											<input type="hidden" id="sdt_nv" value="${item.sdt}" > 
											<input type="hidden" id="gioitinh_nv" value="${item.gioitinh}" > 
											
											</th>
										</tr>
									</tbody>
									</c:forEach>
								</table>							
						</div>
					</div>
				</div>
			</div>
			<%} %>
	
			<!--  thêm khách hàng -->
				<a title="Thêm user khách hàng" class="tipS"
				href=""  data-toggle="modal" data-target="#myAddKhachHang"> 
				<img src="${pageContext.request.contextPath}/assets/images/add.png"
					height="50" style="max-width: 50px">
			</a>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30">Thông tin khách hàng</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									
										<thead>
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
												<th>Action</th>
											</tr>
										</thead>
									<c:forEach var="item" items="${ view_customers }" begin="0"
								end="${ view_customers.size() }" varStatus="loop">
									<tbody>
										<tr>
											<th>${ item.id }</th>
											<th>${ item.name }</th>
											<th>${ item.sdt }</th>
											<th>${ item.gioitinh }</th>
											<th>
												<!-- EDIT THEO ID --> 
											<a title="Chỉnh sửa Khách hàng" class="tipS editKH"
								href="#myEditKhachHang" data-toggle="modal"	>
													<img
													src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
													height="50" style="max-width: 50px">
											</a> <!-- DEL THEO ID --> 
									<a title="Xóa user" class="tipS removeKH"
								href="#myDelKhachHang" data-toggle="modal"> 
								<img src="${pageContext.request.contextPath}/assets/images/xoa.png"
													height="40" style="max-width: 40px">
											</a>
											<input type="hidden" id="id" value="${item.id}" > 
											<input type="hidden" id="name" value="${item.name}" > 
											<input type="hidden" id="sdt" value="${item.sdt}" > 
											<input type="hidden" id="gioitinh" value="${item.gioitinh}" > 
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

	</main>
	
	<%@include file="/WEB-INF/views/admin/admin/modalAndajax.jsp"%>
	<!-- FOOTER -->
	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
	<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	<!-- END FOOTER -->
</body>
</html>
<%
}
%>