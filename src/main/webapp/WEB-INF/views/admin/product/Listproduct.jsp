
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
<%@page import="java.text.NumberFormat"%>
<%
	Users user = (Users) session.getAttribute("LoginInfo");
if ((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)) {
	System.out.print("user: " + user.getRole_id());

} else {
	response.sendRedirect("admin-page");
}
%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Head -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body class="app">
	<!-- Header -->
	<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp"%>
	<!-- END Header -->
	<%
		ConnectionToDB con = new ConnectionToDB();
	%>
	<!-- ### $App Screen Content ### -->
	<main class='main-content bgc-grey-100'
		style="background-color: #000000 !important">
		<div id='mainContent'>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30">Data Tables</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<div style="display: flex;">
								<div style="padding-left: 85px;">
									Chọn nhập thêm số lượng sản phẩm đã tồn tại:
									<a data-toggle="modal" data-target="#product-old"
										title="ADD PRODUCT" class="tipS" href="">
										<img
											src="${pageContext.request.contextPath}/assets/images/add.png"
											height="40" style="max-width: 50px">
									</a>
								</div>
								<div style="padding-left: 85px;">
									Hoặc thêm sản phẩm mới:
									<a data-toggle="modal" data-target="#product-new"
										title="ADD PRODUCT" class="tipS" href="">
										<img
											src="${pageContext.request.contextPath}/assets/images/add.png"
											height="40" style="max-width: 50px">
									</a>
								</div>
								<a data-toggle="modal" data-target="#addncc"
									style="width: 200px; float: right; BACKGROUND-COLOR: green; margin-left: 146px"
									title="Thêm Nhà cung cấp"
									class="btn btn-primary btn-block text-uppercase" href="">Thêm
									Nhà cung cấp</a>
							</div>
							<table id="dataTable" class="table table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>ID SP</th>
										<th>Name</th>
										<th>Category_id</th>
										<th>MONEY</th>
										<th>Trang Thai</th>
										<th>SL ton kho</th>
										<th>Thuong Hieu</th>
										<th>NSX</th>
										<th>HSD</th>
										<th>Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>ID SP</th>
										<th>Name</th>
										<th>Category_id</th>
										<th>MONEY</th>
										<th>Trang Thai</th>
										<th>SL ton kho</th>
										<th>Thuong Hieu</th>
										<th>NSX</th>
										<th>HSD</th>
										<th>Action</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="pros" items="${pro}" varStatus="i">
										<tr>
											<th>${pros.product_id}</th>
											<td>
												<div class="image_thumb">
													<img height="50" alt="${pros.product_name}"
														src="${pageContext.request.contextPath}/assets/images/${pros.product_image}" />
													<div class="clear"></div>
												</div>
												<a target="_blank" title="${pros.product_name}" class="tipS"
													href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}">
													<b>${pros.product_name}</b>
												</a>
												<div class="f11">Đã bán: ${pros.product_purchased} |
													Xem: ${pros.product_view}</div>
											</td>
											<td>${pros.product_danhmuc}</td>
											<td>
												<a target="_blank" title="" class="tipS">
													<b>
														Discount:
														<span style="color: red;">-${pros.product_discount}%</span>
													</b>
												</a>
												<br>
												<a target="_blank" title="" class="tipS">
													<b>
														Sale:
														<span style="color: red;">
															<fmt:formatNumber type="number" groupingUsed="true"
																value="${pros.product_price-pros.product_price*pros.product_discount/100}" />
															₫
														</span>
													</b>
												</a>
												<br>
												<a target="_blank" title="" class="tipS">
													<b>
														Price:
														<span style="color: red;">
															<fmt:formatNumber type="number" groupingUsed="true"
																value="${pros.product_price}" />
															₫
														</span>
													</b>
												</a>
											</td>
											<c:if test="${pros.product_soluongtonkho >0}">
												<td>Còn hàng</td>
											</c:if>
											<c:if test="${pros.product_soluongtonkho <= 0}">
												<td>SOLD</td>
											</c:if>
											<td>${pros.product_soluongtonkho}</td>
											<td>${pros.product_thuonghieu}</td>
											<td>${pros.product_nsx}</td>
											<td>${pros.product_hsd}</td>
											<td>
												<!-- EDIT THEO ID -->
												<a title="Chỉnh sửa sản phẩm" class="tipS edit"
													href="#product_update" data-toggle="modal">
													<img
														src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
														height="50" style="max-width: 50px"
														onclick="edit(${i.count })">
												</a>
												<!-- XOA THEO ID -->
												<a title="Xóa sản phẩm" class="tipS delete"
													href="#myModaldel" data-toggle="modal">
													<img
														src="${pageContext.request.contextPath}/assets/images/xoa.png"
														height="40" style="max-width: 40px"
														onclick="del(${i.count })">
												</a>
												<!-- Dữ liệu để edit -->
												<input type="hidden" id="product_id"
													value="${pros.product_id}" />
												<input type="hidden" id="product_name"
													value="${pros.product_name}" />
												<input type="hidden" id="product_price"
													value="${pros.product_price}" />
												<input type="hidden" id="product_discount"
													value="${pros.product_discount}" />
												<input type="hidden" id="product_danhmuc"
													value="${pros.product_danhmuc}" />
												<input type="hidden" id="product_image"
													value="${pros.product_image}" />
												<input type="hidden" id="product_view"
													value="${pros.product_view}" />
												<input type="hidden" id="product_purchased"
													value="${pros.product_purchased}" />
												<input type="hidden" id="product_trangthai"
													value="${pros.product_trangthai}" />
												<input type="hidden" id="MaNCC" value="${pros.getMaNCC()}" />
												<input type="hidden" id="product_thuonghieu"
													value="${pros.product_thuonghieu}" />
												<input type="hidden" id="product_sanxuat"
													value="${pros.product_sanxuat}" />
												<input type="hidden" id="product_thanhphan"
													value="${pros.product_thanhphan}" />
												<input type="hidden" id="product_nongdocon"
													value="${pros.product_nongdocon}" />
												<input type="hidden" id="product_luongga"
													value="${pros.product_luongga}" />
												<input type="hidden" id="product_luongduong"
													value="${pros.product_luongduong}" />
												<input type="hidden" id="product_thetich"
													value="${pros.product_thetich}" />
												<input type="hidden" id="product_baoquan"
													value="${pros.product_baoquan}" />
												<input type="hidden" id="product_sudung"
													value="${pros.product_sudung}" />
												<input type="hidden" id="product_soluongtonkho"
													value="${pros.product_soluongtonkho}" />
												<input type="hidden" id="product_nsx"
													value="${pros.product_nsx}" />
												<input type="hidden" id="product_hsd"
													value="${pros.product_hsd}" />
												<input type="hidden" id="product_content"
													value="${pros.product_content}" />
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- NCC -->
	<div class="modal fade" id="addncc">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add NCC</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form action="ncc-add" class="tm-edit-product-form" method="post">
								<div class="form-group mb-3">
									<label for="name">Tên NCC </label>
									<input name="TenNCC" type="text" class="form-control validate"
										required>
								</div>
								<div class="form-group mb-3">
									<label for="name">Địa chỉ NCC </label>
									<input name="DiaChi" type="text" class="form-control validate"
										required>
								</div>
								<div class="form-group mb-3">
									<label for="name">Email NCC </label>
									<input name="Email" type="email" class="form-control validate"
										required>
								</div>
								<div class="form-group mb-3">
									<label for="name">Sdt NCC </label>
									<input name="Sdt" type="number" class="form-control validate"
										required>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Add
										NCC Now</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button"
						style="background-color: #868e96; border-color: #868e96"
						class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END NCC -->
	<!-- PRODUCT OLD -->
	<div class="modal fade" id="product-old">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Product</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form action="add-productOld" method="post">
								<label for="proDuct">Sản phẩm:</label>
								<input list="dsProduct" name="product_id"
									style="border-radius: 13px; width: 271px; height: 37px;">
								<datalist id="dsProduct">
									<%
										ResultSet product = con.selectData("select * from product");
									while (product.next()) {
									%>
									<option value="<%=product.getInt("product_id")%>"><%=product.getString("product_name")%></option>
									<%
										}
									%>
								</datalist>
								<label for="stock">Số lượng:</label>
								<input name="product_soluongtonkho" type="number" min="1"
									class="form-control validate" style="width: 270px;">
								<button
									style="background-color: #ed1c24; border-color: #ed1c24; margin-top: 12px; margin-left: 20px;"
									type="submit" class="btn btn-primary btn-block text-uppercase">Add
									Product Now</button>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button"
						style="background-color: #868e96; border-color: #868e96"
						class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END PRODUCT OLD -->
	<!-- PRODUCT new -->
	<div class="modal fade" id="product-new">
		<div class="modal-dialog">
			<div class="modal-content"
				style="WIDTH: 204%; margin-left: -240px; height: 928px; margin-top: 8px; padding-top: -21px;">
				<!-- Modal Header -->
				<!-- Modal body -->
				<div class="row">
					<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto"
						style="padding-top: 100px;">
						<div class="tm-bg-primary-dark tm-block tm-block-h-auto"
							style="padding-top: 7px; margin-top: -56px;">
							<div class="row">
								<div class="col-12">
									<h2 class="tm-block-title d-inline-block">Add Product</h2>
								</div>
							</div>
							<div class="row tm-edit-product-row">
								<form
									action="${pageContext.request.contextPath}/SanPhamController?chucNang=Them"
									class="tm-edit-product-form" method="post"
									enctype="multipart/form-data">
									<input value="<%=user.getUsers_id()%>" type="hidden"
										name="nhanvien_id">
									<%
										ResultSet productByID = con.selectData("SELECT MAX(product_id) FROM product");
									productByID.next();
									%>
									<div class="col-xl-6 col-lg-6 col-md-12  ">
										<input name="product_id"
											value="<%=productByID.getInt(1) + 1%>" type="hidden"
											data-large-mode="true">
										<input name="product_idByPhieuNhap"
											value="<%=productByID.getInt(1) + 1%>" type="hidden">
										<div class="form-group mb-3">
											<label for="name">Product Name </label>
											<input id="product_name" placeholder="Name..."
												name="product_name" type="text"
												class="form-control validate" required>
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Price </label>
												<input name="product_price" min="1" type="number"
													class="form-control validate hasDatepicker"
													data-large-mode="true">
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Discount </label>
												<input name="product_discount" max="100" min="0"
													type="number" class="form-control validate">
											</div>
										</div>
										<%
											ResultSet rs = con.selectData("select * from category");
										%>
										<div class="form-group mb-3">
											<label for="category">Category</label>
											<select required name="product_danhmuc"
												class="custom-select tm-select-accounts" id="category">
												<option selected>Select category</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<%
											ResultSet ncc = con.selectData("select * from NHACUNGCAP");
										%>
										<div class="form-group mb-3">
											<label for="category">Supplier</label>
											<select required name="MaNCC"
												class="custom-select tm-select-accounts">
												<option selected>Select supplier</option>
												<%
													while (ncc.next()) {
												%>
												<option value="<%=ncc.getInt(1)%>"><%=ncc.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Trademark </label>
												<input name="product_thuonghieu" type="text"
													class="form-control validate hasDatepicker"
													data-large-mode="true">
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Producer </label>
												<input name="product_sanxuat" type="text"
													class="form-control validate">
											</div>
										</div>
										<div class="row-hight"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row" style="margin-right: 0px;">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Ingredient </label>
													<input name="product_thanhphan" type="text"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Alcohol concentration </label>
													<input name="product_nongdocon" type="text"
														class="form-control validate">
												</div>
											</div>
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Gas quantity </label>
													<input name="product_luongga" type="text"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Amount of sugar </label>
													<input name="product_luongduong" type="text"
														class="form-control validate">
												</div>
											</div>
										</div>
										<div class="row-a"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Volume </label>
													<input name="product_thetich" type="text"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Preservation </label>
													<input name="product_baoquan" type="text"
														class="form-control validate">
												</div>
											</div>
											<div class="form-group mb-3" style="margin-left: 18px;">
												<label for="description">Mô tả</label>
												<textarea name="product_content"
													class="form-control validate" rows="3" required
													style="height: 50px; width: 398px;"></textarea>
											</div>
										</div>
										<div class="row-a"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Date </label>
													<input style="width: 174px; margin-left: -80px;"
														min="2020-01-01" max="<%=LocalDate.now()%>" required
														pattern="\d{4}-\d{2}-\d{2}" name="product_nsx" type="date"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
													<span class="validity"></span>
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">To Date </label>
													<input style="width: 174px;" required
														pattern="\d{4}-\d{2}-\d{2}" min="<%=LocalDate.now()%>"
														max="2100-01-01" name="product_hsd" type="date"
														class="form-control validate">
													<span class="validity"></span>
												</div>
											</div>
											<div class="form-group mb-3" style="margin-left: 113px;">
												<label for="description">Use</label>
												<textarea name="product_sudung"
													class="form-control validate" rows="3" required
													style="height: 50px; width: 300px;"></textarea>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Inventory number </label>
												<input name="product_soluongtonkho" min="1" type="number"
													class="form-control validate" style="width: 270px;">
											</div>
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4"
											style="left: 9px; padding-top: 32px; margin-right: -400px !important; TOP: -748px;">
											<div class="tm-product-img-dummy mx-auto">
												<i class="fas fa-cloud-upload-alt tm-upload-icon"
													onclick="document.getElementById('fileInput').click();"></i>
											</div>
											<div class="custom-file mt-3 mb-3"
												style="padding-left: -73px; left: -185px; top: 59px;">
												<input id="fileInput_add" type="file" name="product_image"
													style="display: none;">
												<input style="width: 350px;" type="button"
													name="product_image"
													class="btn btn-primary btn-block mx-auto"
													value="UPLOAD PRODUCT IMAGE"
													onclick="document.getElementById('fileInput_add').click();">
											</div>
										</div>
									</div>
									<div class="col-12">
										<button type="submit"
											style="margin-top: -120px; background-color: #ed1c24; border-color: #ed1c24;"
											class="btn btn-primary btn-block text-uppercase">Add
											Product Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button"
						style="background-color: #868e96; border-color: #868e96"
						class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END PRODUCT new -->
	<!--EDIT PRODUCT  -->
	<div class="modal fade" id="product_update">
		<div class="modal-dialog">
			<div class="modal-content"
				style="WIDTH: 204%; margin-left: -240px; height: 928px; margin-top: 8px; padding-top: -21px;">
				<!-- Modal Header -->
				<!-- Modal body -->
				<div class="row">
					<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto"
						style="padding-top: 100px;">
						<div class="tm-bg-primary-dark tm-block tm-block-h-auto"
							style="padding-top: 7px; margin-top: -56px;">
							<div class="row">
								<div class="col-12">
									<h2 class="tm-block-title d-inline-block">Update Product</h2>
								</div>
							</div>
							<div class="row tm-edit-product-row">
								<form
									action="${pageContext.request.contextPath}/SanPhamController?chucNang=Update"
									class="tm-edit-product-form" method="post"
									enctype="multipart/form-data">
									<input value="<%=user.getUsers_id()%>" type="hidden"
										name="nhanvien_id">
									<div class="col-xl-6 col-lg-6 col-md-12  ">
										<input type="hidden" name="product_view"
											id="product_view_modal" value="${pros.product_view}" />
										<input type="hidden" name="product_purchased"
											id="product_purchased_modal"
											value="${pros.product_purchased}" />
										<input type="hidden" name="product_trangthai"
											id="product_trangthai_modal"
											value="${pros.product_trangthai}" />
										<div class="form-group mb-3">
											<label for="name">Tên Sản Phẩm</label>
											<input id="product_name_modal" placeholder="Name..."
												name="product_name" type="text"
												class="form-control validate" required />
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Giá </label>
												<input id="product_price_modal" name="product_price" min="1"
													type="number" class="form-control validate hasDatepicker"
													data-large-mode="true" />
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Giảm giá </label>
												<input id="product_discount_modal" name="product_discount"
													max="100" min="0" type="number"
													class="form-control validate" />
											</div>
										</div>
										<div class="form-group mb-3">
											<label for="category">Danh Mục</label>
											<select required name="product_danhmuc"
												class="custom-select tm-select-accounts"
												id="product_danhmuc_modal">
												<option selected>Chọn Danh Mục</option>
												<%
													ResultSet cate = con.selectData("select * from category");
												while (cate.next()) {
												%>
												<option value="<%=cate.getInt(1)%>"><%=cate.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="form-group mb-3">
											<label for="category">Nhà cung cấp</label>
											<select required name="MaNCC" id="MaNCC_modal"
												class="custom-select tm-select-accounts">
												<option selected>Chọn Nhà Cung Cấp</option>
												<%
													ResultSet nhacungcap = con.selectData("select * from NHACUNGCAP");
												while (nhacungcap.next()) {
												%>
												<option value="<%=nhacungcap.getInt(1)%>"><%=nhacungcap.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Thương Hiệu</label>
												<input id="product_thuonghieu_modal"
													name="product_thuonghieu" type="text"
													class="form-control validate hasDatepicker"
													data-large-mode="true" />
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Nhà sản xuất</label>
												<input id="product_sanxuat_modal" name="product_sanxuat"
													type="text" class="form-control validate" />
											</div>
										</div>
										<div class="row-hight"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row" style="margin-right: 0px;">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Thành phần </label>
													<input id="product_thanhphan_modal"
														name="product_thanhphan" type="text"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Nồng độ cồn</label>
													<input id="product_nongdocon_modal"
														name="product_nongdocon" type="text"
														class="form-control validate">
												</div>
											</div>
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Nồng độ Gas</label>
													<input id="product_luongga_modal" name="product_luongga"
														type="text" class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Amount of sugar </label>
													<input name="product_luongduong"
														id="product_luongduong_modal" type="text"
														class="form-control validate">
												</div>
											</div>
										</div>
										<div class="row-a"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Thể tích thực </label>
													<input id="product_thetich_modal" name="product_thetich"
														type="text" class="form-control validate hasDatepicker"
														data-large-mode="true">
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Bảo quản </label>
													<input id="product_baoquan_modal" name="product_baoquan"
														type="text" class="form-control validate">
												</div>
											</div>
											<div class="form-group mb-3" style="margin-left: 18px;">
												<label for="description">Mô tả</label>
												<textarea id="product_content_modal" name="product_content"
													class="form-control validate" rows="3" required
													style="height: 50px; width: 398px;"></textarea>
											</div>
										</div>
										<div class="row-a"
											style="display: inline-flex; margin-right: -415px;">
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Ngày Sản Xuất</label>
													<input style="width: 174px; margin-left: -80px;"
														min="2020-01-01" max="<%=LocalDate.now()%>" required
														pattern="\d{4}-\d{2}-\d{2}" id="product_nsx_modal"
														name="product_nsx" type="date"
														class="form-control validate hasDatepicker"
														data-large-mode="true">
													<span class="validity"></span>
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Ngày Hết Hạn</label>
													<input style="width: 174px;" required
														pattern="\d{4}-\d{2}-\d{2}" min="<%=LocalDate.now()%>"
														max="2100-01-01" id="product_hsd_modal" name="product_hsd"
														type="date" class="form-control validate">
													<span class="validity"></span>
												</div>
											</div>
											<!-- CÁCH DÙNG -->
											<div class="form-group mb-3" style="margin-left: 113px;">
												<label for="description">Cách dùng</label>
												<textarea id="product_sudung_modal" name="product_sudung"
													class="form-control validate" rows="3" required
													style="height: 50px; width: 300px;"></textarea>
											</div>
											<!-- TỒN KHO -->
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Số Lượng tồn kho</label>
												<input id="product_soluongtonkho_modal"
													name="product_soluongtonkho" min="1" type="number"
													class="form-control validate" style="width: 270px;">
											</div>
										</div>
										<!-- HÌNH ẢNH -->
										<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4"
											style="left: 9px; padding-top: 32px; margin-right: -400px !important; TOP: -748px;">
											<div class="tm-product-img-dummy mx-auto">
												<i class="fas fa-cloud-upload-alt tm-upload-icon"
													onclick="document.getElementById('fileInput_modal').click();"></i>
											</div>
											<div class="custom-file mt-3 mb-3"
												style="padding-left: -73px; left: -185px; top: 59px;">
												<input id="fileInput_modal" type="file" name="product_image"
													style="display: none;" onclick="upload()">
												<input id="product_image_name_modal" name="product_image_name" type="hidden">
												<input style="width: 350px;" id="product_image_modal"
													type="button" 
													class="btn btn-primary btn-block mx-auto"
													value="UPLOAD PRODUCT IMAGE"
													onclick="document.getElementById('fileInput_modal').click();">
											</div>
										</div>
									</div>
									<div class="col-12">
										<button type="submit"
											style="margin-top: -120px; background-color: #ed1c24; border-color: #ed1c24;"
											class="btn btn-primary btn-block text-uppercase">Cập
											Nhập Sản Phẩm</button>
										<input type="hidden" name="product_id" id="product_id_modal" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button"
						style="background-color: #868e96; border-color: #868e96"
						class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END EDIT PRODUCT  -->
	<!-- The Modal DEL-->
	<div class="modal fade" id="myModaldel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">DELETE</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">Do you want to delete ?</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<form class="tm-edit-product-form" method="post">
						<button style="width: 100%; background-color: red;" type="submit"
							class="btn btn-primary btn-block text-uppercase deleteCate" id="btnDel">OK
							?</button>
						<input type="hidden" name="product_id" id="product_id" />
					</form>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END The Modal DEL -->
	<!-- FOOTER -->
	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
	<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	<!-- END FOOTER -->
	<script type="text/javascript">
		function del(row_id){
			//10, 15, 20, 25, 30,...số lượng hàng trong bảng
			let soluong_hang = document.getElementsByName('dataTable_length')[0].value;
			
	
			row_id = (row_id % soluong_hang > 0)?(row_id % soluong_hang):soluong_hang;
			
			let data = $('#dataTable')[0].rows[row_id];
			
			/* truyền vào modal */
			
			let product_id = data.querySelectorAll('#product_id')[0].value;
			
			$.ajax( {
		        url: "${pageContext.request.contextPath}/del-product/"+ product_id,
		        type: "GET",
		        success: function(data) {
		          $('#myModaldel #product_id').val(id);
		        }
		      });
		}
	</script>

	<!-- EDIT DINH CAO -->
	<script>
		function upload(){
			let product_image_modal = $('#product_image_modal');
			
			document.getElementById('fileInput_modal').addEventListener("change", ()=>{
				let img_name = $('#fileInput_modal').val().replace(/^.*[\\\/]/,'');
				product_image_modal.val(img_name);
				console.log(img_name);
				
			})
			
			
		}
		function edit(row_id){
			//10, 15, 20, 25, 30,...số lượng hàng trong bảng
			let soluong_hang = document.getElementsByName('dataTable_length')[0].value;
			
	
			row_id = (row_id % soluong_hang > 0)?(row_id % soluong_hang):soluong_hang;
			
			let data = $('#dataTable')[0].rows[row_id];
			
			/* truyền vào modal */
			
			let product_id = data.querySelectorAll('#product_id')[0].value;
			let product_name = data.querySelectorAll('#product_name')[0].value;
			let product_price = data.querySelectorAll('#product_price')[0].value;
			let product_discount = data.querySelectorAll('#product_discount')[0].value;
			let product_danhmuc = data.querySelectorAll('#product_danhmuc')[0].value;
			
			let product_image = data.querySelectorAll('#product_image')[0].value;
			
			
			let product_view = data.querySelectorAll('#product_view')[0].value;
			let product_purchased = data.querySelectorAll('#product_purchased')[0].value;
			let product_trangthai= data.querySelectorAll('#product_trangthai')[0].value;
			let MaNCC = data.querySelectorAll('#MaNCC')[0].value;
			let product_thuonghieu = data.querySelectorAll('#product_thuonghieu')[0].value;
			
			let product_sanxuat = data.querySelectorAll('#product_sanxuat')[0].value;
			let product_thanhphan = data.querySelectorAll('#product_thanhphan')[0].value;
			let product_luongga = data.querySelectorAll('#product_luongga')[0].value;
			let product_luongduong = data.querySelectorAll('#product_luongduong')[0].value;
			let product_thetich = data.querySelectorAll('#product_thetich')[0].value;
			
			let product_baoquan = data.querySelectorAll('#product_baoquan')[0].value;
			let product_sudung = data.querySelectorAll('#product_sudung')[0].value;
			let product_soluongtonkho = data.querySelectorAll('#product_soluongtonkho')[0].value;
			let product_nsx = data.querySelectorAll('#product_nsx')[0].value;
			let product_hsd = data.querySelectorAll('#product_hsd')[0].value;
			let product_content = data.querySelectorAll('#product_content')[0].value;
			/* .
			. Tự xử tiếp
			. */
			
			
			//MODAL
			let product_id_modal = $('#product_id_modal');
			let product_name_modal = $('#product_name_modal');
			let product_price_modal = $('#product_price_modal');
			let product_discount_modal = $('#product_discount_modal');
			let product_danhmuc_modal = $('#product_danhmuc_modal');
			
			let product_image_modal = $('#product_image_modal');
			let product_image_name_modal = $('#product_image_name_modal');
			
			let product_view_modal = $('#product_view_modal');
			let product_purchased_modal = $('#product_purchased_modal');
			let product_trangthai_modal = $('#product_trangthai_modal');
			let MaNCC_modal = $('#MaNCC_modal');
			let product_thuonghieu_modal = $('#product_thuonghieu_modal');
			
			let product_sanxuat_modal = $('#product_sanxuat_modal');
			let product_thanhphan_modal = $('#product_thanhphan_modal');
			let product_luongga_modal = $('#product_luongga_modal');
			let product_luongduong_modal = $('#product_luongduong_modal');
			let product_thetich_modal = $('#product_thetich_modal');
			
			let product_baoquan_modal = $('#product_baoquan_modal');
			let product_sudung_modal = $('#product_sudung_modal');
			let product_soluongtonkho_modal = $('#product_soluongtonkho_modal');
			let product_nsx_modal = $('#product_nsx_modal');
			let product_hsd_modal = $('#product_hsd_modal');
			let product_content_modal = $('#product_content_modal');
			/* .
			. Tự xử tiếp
			. */
			
			product_id_modal.val(product_id);
			product_name_modal.val(product_name);
			product_price_modal.val(product_price);
			product_discount_modal.val(product_discount);
			product_danhmuc_modal.val(product_danhmuc);
			
			product_image_modal.val(product_image);
			product_image_name_modal.val(product_image);
			product_view_modal.val(product_view);
			product_purchased_modal.val(product_purchased);
			product_trangthai_modal.val(product_trangthai);
			MaNCC_modal.val(MaNCC);
			product_thuonghieu_modal.val(product_thuonghieu);
			
			product_sanxuat_modal.val(product_sanxuat);
			product_thanhphan_modal.val(product_thanhphan);
			product_luongga_modal.val(product_luongga);
			product_luongduong_modal.val(product_luongduong);
			product_thetich_modal.val(product_thetich);
			
			product_baoquan_modal.val(product_baoquan);
			product_sudung_modal.val(product_sudung);
			product_soluongtonkho_modal.val(product_soluongtonkho);
			product_nsx_modal.val(product_nsx);
			product_hsd_modal.val(product_hsd);
			product_content_modal.val(product_content);
			
			/* .
			. Tự xử tiếp
			. */
		
		}
	</script>
	<!-- END EDIT DINH CAO -->
</body>
</html>
<%
	}
%>