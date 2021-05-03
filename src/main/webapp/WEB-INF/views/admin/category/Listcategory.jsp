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
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<!-- Head -->
	 	 <%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp" %>
	 	<!-- End Head -->
	 	<style>
	 		.svg-container {
 
  max-width: 400px;
  margin: 0 auto;
}

.clouds {
  display: block;
  -webkit-animation: verticalScroll 3s infinite ease-in;
  -moz-animation: verticalScroll 3s infinite ease-in;
  animation: verticalScroll 3s infinite ease-in;
}

#rocket {
  -webkit-transform-origin: 50% 0;
  transform-origin: 50% 0;
  -webkit-animation: takeOff 3s infinite ease-in;
  animation: takeOff 3s infinite ease-in;
}

.flame-outer {
  -webkit-animation: outerFlame .5s infinite linear;
  -moz-animation: outerFlame .5s infinite linear;
  animation: outerFlame .5s infinite linear;
}

.flame-inner {
  -webkit-animation: innerFlame .5s infinite linear;
  -moz-animation: innerFlame .5s infinite linear;
  -ms-animation: innerFlame .5s infinite linear;
  animation: innerFlame .5s infinite linear;
}
@-webkit-keyframes verticalScroll {
  0% { -webkit-transform: translateY(0) }
  100% { -webkit-transform: translateY(500px) }
}
@-moz-keyframes verticalScroll {
  0% { -moz-transform: translateY(0) }
  100% { -moz-transform: translateY(500px) }
}
@keyframes verticalScroll {
  0% { transform: translateY(0) }
  100% { transform: translateY(500px) }
}

@-webkit-keyframes takeOff {
  0% { -webkit-transform: scale(1) translateY(0); }
  100% { -webkit-transform: scale(0) translateY(-500px); }
}
@-moz-keyframes takeOff {
  0% {
    -moz-transform: scale(1) translateY(0); }
  100% {-moz-transform: scale(0) translateY(-500px); }
}
@keyframes takeOff {
  0% {
    transform: scale(1) translateY(0);
  }
  100% {
    transform: scale(0) translateY(-500px); }
}

@-webkit-keyframes outerFlame {
  0% { fill: red}
  33% { fill: orange  }
  66% {fill: yellow }
  75% { fill: orange}
  100% {fill: red  }
}
@-moz-keyframes outerFlame {
  0% { fill: red}
  33% { fill: orange  }
  66% {fill: yellow }
  75% { fill: orange}
  100% {fill: red  }
}
@keyframes outerFlame {
  0% { fill: red}
  33% { fill: orange  }
  66% {fill: yellow }
  75% { fill: orange}
  100% {fill: red  }
}

@-webkit-keyframes innerFlame {
  0% { fill: orange}
  33% { fill: yellow  }
  66% {fill: orange }  
  100% {fill: red  }
}

@-moz-keyframes innerFlame {
  0% { fill: orange}
  33% { fill: yellow  }
  66% {fill: orange }  
  100% {fill: red  }
}

@keyframes innerFlame {
  0% { fill: orange}
  33% { fill: yellow  }
  66% {fill: orange }  
  100% {fill: red  }
}

	 		
	 	</style>
	 	<style>
	 	#toast {
    visibility: hidden;
    max-width: 50px;
    height: 50px;
    /*margin-left: -125px;*/
    margin: auto;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;

    position: fixed;
    z-index: 1;
    left: 0;right:0;
    bottom: 30px;
    font-size: 17px;
    white-space: nowrap;
}
#toast #img{
	width: 50px;
	height: 50px;
    
    float: left;
    
    padding-top: 16px;
    padding-bottom: 16px;
    
    box-sizing: border-box;

    
    background-color: #111;
    color: #fff;
}
#toast #desc{

    
    color: #fff;
   
    padding: 16px;
    
    overflow: hidden;
	white-space: nowrap;
}

#toast.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, expand 0.5s 0.5s,stay 3s 1s, shrink 0.5s 2s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, expand 0.5s 0.5s,stay 3s 1s, shrink 0.5s 4s, fadeout 0.5s 4.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes expand {
    from {min-width: 50px} 
    to {min-width: 350px}
}

@keyframes expand {
    from {min-width: 50px}
    to {min-width: 350px}
}
@-webkit-keyframes stay {
    from {min-width: 350px} 
    to {min-width: 350px}
}

@keyframes stay {
    from {min-width: 350px}
    to {min-width: 350px}
}
@-webkit-keyframes shrink {
    from {min-width: 350px;} 
    to {min-width: 50px;}
}

@keyframes shrink {
    from {min-width: 350px;} 
    to {min-width: 50px;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 60px; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 60px; opacity: 0;}
}
	 	</style>
</head>
<body class="app">
<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 4) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 response.sendRedirect("admin-page");
 }
 %>
<!-- Header -->
<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp" %>
<!-- END Header -->


<!-- ### $App Screen Content ### -->
	<main class='main-content bgc-grey-100'
		style="background-color: #000000 !important">
		<div id='mainContent'>
			<div class="container-fluid">
				<h4 class="c-grey-900 mT-10 mB-30" style="color: white !important;">Data
					Tables</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="bgc-white bd bdrs-3 p-20 mB-20">
							<a title="Chỉnh sửa sản phẩm" class="tipS" href=""
								data-toggle="modal" data-target="#myModal"> <img
								src="${pageContext.request.contextPath}/assets/images/add.png"
								height="50" style="max-width: 50px">
							</a>


							<table class="table table-striped table-bordered" cellspacing="0"
								width="100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>Category Name</th>
										<th>Parent_id</th>
										<th>Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>Category Name</th>
										<th>Parent_id</th>
										<th>Action</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${cate}" var="item">
										<tr>
											<td>${item.category_id}</td>
											<td><a
												href="${pageContext.request.contextPath}/san-pham/${item.category_id}"
												class="link-hover" data-search="${item.category_name}"
												data-keyword=""> ${item.category_name} </a></td>
											<td>${item.p_id}</td>
											<th>
												<!-- EDIT THEO ID --> <a title="Chỉnh sửa category"
												class="tipS edit" href="#myModalEdit" data-toggle="modal">
													<img
													src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
													height="50" style="max-width: 50px">
											</a> <!-- DEL THEO ID --> <a title="Xóa  category"
												class="tipS delete " href="#myModaldel" data-toggle="modal">
													<img
													src="${pageContext.request.contextPath}/assets/images/xoa.png"
													height="40" style="max-width: 40px">
											</a> <input type="hidden" id="category_id"
												value="${item.category_id}"> <input type="hidden"
												id="p_id" value="${item.p_id}"> <input
												type="hidden" id="category_name"
												value="${item.category_name}">
											</th>
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

	<!-- The Modal ADD -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Category</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form action="category-add" class="tm-edit-product-form"
								method="post">
								<div class="form-group mb-3">
									<label for="name">Category Name </label> <input
										name="category_name" type="text" class="form-control validate"
										required>
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label> <select
										class="custom-select tm-select-accounts" name="p_id"
										id="category">
										<option value="0">Là danh mục cha</option>
										<c:forEach items="${cate}" var="item">
											<c:if test="${item.p_id == 0 }">
												<option value="${item.category_id }">${item.category_name }</option>
											</c:if>
										</c:forEach>

									</select>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Add
										Category Now</button>

								</div>

							</form>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- END The Modal ADD -->

	<!-- The Modal EDIT -->
	<div class="modal fade" id="myModalEdit">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Edit Category</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form action="category-edit" class="tm-edit-product-form"
								method="post">
								<div class="form-group mb-3">
									<label for="name">Category Name </label> <input
										name="category_name" id="category_name" type="text"
										class="form-control validate" required>
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label> <select
										class="custom-select tm-select-accounts" name="p_id" id="p_id">
										<option value="0">Là danh mục cha</option>
										<c:forEach items="${cate}" var="item">
											<c:if test="${item.p_id == 0 }">
												<option value="${item.category_id }">${item.category_name }</option>
											</c:if>
										</c:forEach>

									</select>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Update
										Category Now</button>
									<input type="hidden" name="category_id" id="category_id" />
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
	<!-- END The Modal EDIT -->


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

					<form class="tm-edit-product-form"
						action="${pageContext.request.contextPath}/del-category"
						method="post">
						<button style="width: 100%; background-color: red;" type="submit"
							class="btn btn-primary btn-block text-uppercase deleteCate">OK
							?</button>
						<input type="hidden" name="category_id" id="category_id" />
					</form>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- END The Modal DEL -->
	<button onclick="launch_toast()">Show Toast</button>
	<div  id="toast" ><div id="img">Icon</div><div id="desc">A notification message..</div></div>
	<script type="text/javascript">
		function launch_toast() {
			var x = document.getElementById("toast")
			x.className = "show";
			setTimeout(function() {
				x.className = x.className.replace("show", "");
			}, 5000);
		}
	</script>
		 <!-- FOOTER -->
	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp" %>
	<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp" %>
     	<!-- END FOOTER -->
     	
    <!-- Xoa du lieu -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('.delete').on('click',function(){
				var id= $(this).parent().find('#category_id').val();
		
	         			$('#myModaldel #category_id').val(id);
	         
			});
		 			
		});
	
	</script>
	<!-- END Xoa du lieu -->
   
    <!-- UPDATE du lieu -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('.edit').on('click',function(){
				var id= $(this).parent().find('#category_id').val();
				var category_name= $(this).parent().find('#category_name').val();
				var p_id= $(this).parent().find('#p_id').val();
				$('#myModalEdit #category_id').val(id);
	 			$('#myModalEdit #category_name').val(category_name);
	 			$('#myModalEdit #p_id').val(p_id);
				 $.ajax({
	         		url: "${pageContext.request.contextPath}/edit-category/" +id,
	         		
	         		type: "GET",
	         		success: function (data)
	         		{ 
	         			$('#myModalEdit #category_id').val(id);
	         			$('#myModalEdit #category_name').val(category_name);
	         			$('#myModalEdit #p_id').val(p_id);
	         			
	         		}
	         		
	         	});
				 
			});
		 			
		});
	
	</script>
   <!-- END UPDATE du lieu -->
	
</body>
</html>
<%}%>