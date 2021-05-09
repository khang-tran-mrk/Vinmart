<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="VinMart.entities.Users"%>
 <%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check != null){
	 response.sendRedirect("trang-chu");
 }
 %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1"><title>Cổng Truy Cập Định Danh</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600&amp;display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"><link rel="icon" href="https://identity.teko.vn/favicon.png">

		<%@include file="/WEB-INF/views/layouts/customer/decorators/headlogin.jsp" %>
		<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
</head>
<body>
	<div id="toast"></div>
	<div id="root">
      <div class="app">
        <div class="background">
          <div class="form-container">
            <div class="form-content">
              <div class="MuiPaper-root form-layout MuiPaper-elevation1 MuiPaper-rounded">
                <img src="https://i.imgur.com/4p090Et.png" alt="Vinmart Web Desktop" class="app-logo mb-12">
                <h6 class="MuiTypography-root color-gray mb-12 MuiTypography-subtitle2"></h6>
                <h5 class="MuiTypography-root mb-36 MuiTypography-h5">Đăng nhập</h5>
               

                <!--INPUT-->
                <form:form action="login" method="POST" modelAttribute="user">
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input aria-invalid="false" type="email" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" path="users_email" placeholder="Email "/>
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Email </span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>

                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                    
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input id="users_password" name="users_password" aria-invalid="false" type="password" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense pass-key" path="users_password" placeholder="Mật khẩu" />
                      <i class="fas fa-eye show" style="cursor: pointer;"></i>
                      
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Mật khẩu</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>

                <div class="MuiFormControl-root MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-end MuiTypography-body2">
                    <a href="${pageContext.request.contextPath}/forgot-password" class="MuiTypography-root MuiLink-root jss8 MuiLink-underlineNone MuiTypography-colorPrimary">Quên mật khẩu?                   
                    </a>
                    
                  </p>
                </div>

                <div class="mb-24"></div>
                <div class="MuiFormControl-root mb-24 MuiFormControl-fullWidth">
                  <button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" tabindex="0" type="submit">
                    <span class="MuiButton-label"> Đăng nhập</span>
                    <span class="MuiTouchRipple-root"></span>
                  </button>
                </div>
				</form:form>
				
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-center MuiTypography-body1"><a class="MuiTypography-root MuiLink-root jss8 MuiLink-underlineNone MuiTypography-colorPrimary"
                  type="submit" href="<c:url value="register"/>">Tạo tài khoản</a></p>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <script>
    const pass = document.querySelector('.pass-key');
    const showpass = document.querySelector('.show');
    showpass.addEventListener('click', function(){
      if(pass.type === "password"){
        pass.type = "text";
       
        showpass.style.color = "#3498db";
      }else{
        pass.type = "password";
       
        showpass.style.color = "#222";
      }
    });
  </script>
  <%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
   <c:if test="${ not empty loginFail }">
	<script type="text/javascript">
	loginFail();	    
	 </script>
	 <%session.removeAttribute("loginFail");    %> 
	</c:if>
	
	<c:if test="${ not empty xacthuc }">
	<script type="text/javascript">
	xacthuc();	    
	 </script>
	 <%session.removeAttribute("xacthuc");    %> 
	</c:if>
</body>
</html>