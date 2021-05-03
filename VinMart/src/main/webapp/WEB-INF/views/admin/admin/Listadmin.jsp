<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 7) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
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
	<main class='main-content bgc-grey-100' style="background-color: #000000!important">
		<div id='mainContent'>
		<%
		 if( user.getRole_id() == 1){
			
		 %>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Thông tin user</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<a title="Thêm user nhân viên" class="tipS"
								href="${pageContext.request.contextPath}/add-admin"> <img
								src="${pageContext.request.contextPath}/assets/images/add.png"
								height="50" style="max-width: 50px">
							</a>
							<c:forEach var="item" items="${ view_account }" begin="0"
								end="${ view_account.size() }" varStatus="loop">
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<c:if test="${ loop.first }">
										<thead>
											<tr>
												<th>ID</th>
												<th>Email</th>
												<th>Password</th>
												<th>Role_id</th>
											</tr>
										</thead>
									</c:if>
									<tbody>
										<tr>
											<th>${ item.users_id }</th>
											<th>${ item.users_email }</th>
											<th>${ item.users_password }</th>
											<th>${ item.role_id }</th>

											<th>
												<!-- EDIT THEO ID --> <a title="Chỉnh sửa user" class="tipS"
												href="${pageContext.request.contextPath}/edit-admin/${ item.users_id }">
													<img
													src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
													height="50" style="max-width: 50px">
											</a> <!-- DEL THEO ID --> <a title="Xóa user" class="tipS remove"
												href="${pageContext.request.contextPath}/del-admin"> <img
													src="${pageContext.request.contextPath}/assets/images/xoa.png"
													height="40" style="max-width: 40px">
											</a>
											</th>
										</tr>
									</tbody>
								</table>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>
			<%} %>
			<%if( (user.getRole_id() == 1) || (user.getRole_id() == 2) ){ %>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Thông tin nhân viên</h4>

				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<c:forEach var="item" items="${ view_employees }" begin="0"
								end="${ view_employees.size() }" varStatus="loop">
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<c:if test="${ loop.first }">
										<thead>
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
											</tr>
										</thead>
									</c:if>
									<tbody>
										<tr>
											<th>${ item.id }</th>
											<th>${ item.name }</th>
											<th>${ item.sdt }</th>
											<th>${ item.gioitinh }</th>
										</tr>
									</tbody>
								</table>
							</c:forEach>
								

						</div>
					</div>
				</div>
			</div>
			<%} %>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Thông tin khách hàng</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<c:forEach var="item" items="${ view_customers }" begin="0"
								end="${ view_customers.size() }" varStatus="loop">
								<table id="dataTable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">									
									<c:if test="${ loop.first }">
										<thead>
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
											</tr>
										</thead>
									</c:if>
									<tbody>
										<tr>
											<th>${ item.id }</th>
											<th>${ item.name }</th>
											<th>${ item.sdt }</th>
											<th>${ item.gioitinh }</th>
										</tr>
									</tbody>
								</table>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>

		</div>

	</main>
	<!-- FOOTER -->
	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
	<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	<!-- END FOOTER -->
</body>
</html>
<%}%>