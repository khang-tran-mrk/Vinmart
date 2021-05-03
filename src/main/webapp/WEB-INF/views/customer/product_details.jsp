<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>  
<%@page import="java.text.SimpleDateFormat" %>  
<%@page import="java.text.DateFormat" %>  
<%@page import="java.util.concurrent.TimeUnit" %> 
<!DOCTYPE html>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
    	<%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/head.jsp" %>
     	<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
     	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
     	     	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
     	
     	<style>
     	.cate .product .xemchitiet{
     	 color: aliceblue !important;
    background:#ed1c24;
    display: block;
    overflow: hidden;
    font-size: 13px;
    font-weight: bold;
   
    text-align: center;
    text-transform: uppercase;
    padding: 10px 0;
    position: absolute;
    left: 20px;
    right: 20px;
    bottom: 10px;
    cursor: pointer;
    border-radius: 4px;
    border: 1px solid #ed1c24;
     	</style>
     		
</head>

<body class=" new2019"  id="asb">
		<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v10.0&appId=1093801017730832&autoLogAppEvents=1" nonce="w5f0nEUX"></script>
		 <!-- HEADER -->
			<%@include file="/WEB-INF/views/layouts/customer/header/header.jsp" %>
		 <!-- End HEADER -->
		 
		 <!-- BODY  -->
		   <div id="toast">

    </div> 
		<section >
        <aside class="colcontent" >
        <ul class="breadcrumb">
        
        	<li><a href="${pageContext.request.contextPath}" title="Trang chủ">Trang chủ</a></li>
        	<li><a href="${pageContext.request.contextPath}/san-pham/${Byid}">${ByName } </a></li>
        	<li><a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pro.product_id}">${pro.product_name} </a></li>
        </ul>
      
        <!-- THong Tin san pham theo id -->
      <div class="rowdetail">
        <aside class="slide" >
        	<div id="bhxgallery">
	        	<div class="gallery-main">
		        	<div class="owl-carousel owl-theme pgallery owl-loaded owl-drag" id="gallery">
			        	<div class="owl-stage-outer owl-height" style="height: 405px;">
				        	<div class="owl-stage" style="transition: all 1.25s ease 0s; width: 3240px; transform: translate3d(0px, 0px, 0px);">
					        	<div class="owl-item active center" style="width: 540px;">
						        	<div>
							        	<img class="owl-lazy" width="540" height="304" 
							        	data-src="${pageContext.request.contextPath}/assets/images/${pro.product_image}" 
							       alt="${pro.product_name}" data-type="1" data-index="1" src="${pageContext.request.contextPath}/assets/images/${pro.product_image}" style="opacity: 1;">
						        	</div>
					        	</div>
					        	
				        	</div>
			        	</div>
			        	<div class="owl-dots disabled"></div>
		        	</div>
		        	<div class="number-ga"></div>
	        	</div>
	        	<div class="listthums owl-carousel owl-theme">
		        	<div class="thumbpro choosed" data-index="0">
		        		<img width="90" height="60" src="${pageContext.request.contextPath}/assets/images/${pro.product_image}" alt="${pro.product_name}"> 
		        		
		        	</div>
	        	</div>
        	</div>
        </aside>
        <aside class="infosell" >
        	<h1 class="nameproduct">${pro.product_name}</h1>
        				
        	<div class="expireddate"><span>HSD còn ${day } ngày</span></div>
        	 <c:if test="${day<=0}">
        		<div class="expireddate"><span>Tồn kho: SOLD</span></div>
        	</c:if>
        	<c:if test="${day >0 }">
        		<div class="expireddate"><span>Tồn kho: ${pro.product_soluongtonkho}</span></div>
        	</c:if>
        	
        	
	        	<div class="ratinglist-price">
	        	<div class="boxprice"><strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pro.product_price-pro.product_price*pro.product_discount/100}" />₫</strong> 
			        	<span class="strike"><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pro.product_price}" />₫</span> 
			        	<label>-${pro.product_discount}%</label>
	        	</div>
        	</div>
        	<c:if test="${day<=0}">
        		<a class="choosebuy" style="background-color: #d6d1d1;"   title='sold' style=" cursor: pointer;">SOLD</a>
        	</c:if>
        	<c:if test="${day >0 }">
        		<a class="choosebuy"  id="mua"  onclick="themSPthanhcong();" title='Mua ngay' style=" cursor: pointer;">Chọn mua</a>
        	</c:if>
        	
        	
        	<div class="updown hide" data-id="84394" data-maxqtyonbill="0" data-price="30.000₫">
	        	<div class="down"><span></span></div>
	        	<input class="number" value="0" pattern="[0-9]*" type="number" maxlength="50">
	        	<div class="up"><span></span><span></span></div>
        	</div>
        	<div class="shipping">
	        	<div><i class="bhx-sship"></i> 
	        		<span> Đặt online giao tận nhà ĐÚNG GIỜ (nếu trễ tặng PMH 20.000₫)</span>
	        	</div>
	        	<div><i class="bhx-swap"></i> 
	        		<span> Đổi, trả sản phẩm trong 7 ngày </span> 
	        	</div>
        	</div>
        	<div class="boxbanner">
        	<a href="https://www.bachhoaxanh.com/rau-an-toan-4kfarm" class="item" title="RAU AN TOÀN 4K FARM TẶNG">
        	 <img src="https://cdn.tgdd.vn/bachhoaxanh/banners/2516/rau-an-toan-4k-farm-tang-03032021143649.jpg" width="450" height="80"> 
        	</a>
        	</div>
        </aside>
     </div>    
       <!-- END Thong Tin san pham theo id -->
       
        <!--Thong Tin san pham lien quan -->
  <div class="relative">
                <h3 class="titledt">Sản phẩm liên quan </h3>
          <div class="boxscroll">


    <div class="cate boxrelative owl-carousel owl-theme owl-loaded owl-drag" id="boxrelative">
    <div class="owl-stage-outer">
    <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 1s ease 0s; width: 2160px;">
    
    <c:forEach var="item" items="${AllProductsById}" >
    <div class="owl-item active" style="width: 240px;">
    <div class=" product " >
        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${item.product_id}" title="${item.product_name}">
            <div class="boximg" title="${item.product_name}">
               <img class="lazy initial loaded" width="160" height="160" data-src="${pageContext.request.contextPath}/assets/images/${item.product_image}" 
               alt="${item.product_name}" src="${pageContext.request.contextPath}/assets/images/${item.product_image}" data-was-processed="true">
            </div>
            <div class="product-name">${item.product_name}</div>
                    <div class="removepoint">
                <span>HSD còn 40 ngày</span>
                    </div>
            <div class="price">
                <strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${item.product_price-item.product_price*item.product_discount/100}" />₫</strong>
             </div>
          
        </a>
        <a  class="xemchitiet" href="${pageContext.request.contextPath}/chi-tiet-san-pham/${item.product_id}" title='Xem chi tiết'>Xem chi tiết</a>
                

    </div>    
    </div>
    </c:forEach>
    </div></div>
   <div class="owl-dots disabled"></div></div>

        </div>
   </div>
    <!--END Thong Tin san pham lien quan -->
    
    <!--Thong Tin san pham  -->
      <div class="rowinfo">
           <aside class="leftcolrelate">   
            <div class="details">
                <h2 class="textinfpro" id="specification">Thông tin sản phẩm</h2>
                    <div class="short-description"></div>
                            <ul class="infoproduct nospeci">
                                <li>
                                    <span>Thương hiệu</span>
                                    <div>${pro.product_thuonghieu}</div>
                                </li>
                                <li>
                                    <span> Sản xuất tại</span>
                                     <div>${pro.product_sanxuat}</div>
                                </li>
                                <li>
                                    <span> sản phẩm</span>
                                     <div>${ByName }</div>
                                </li>
                                <c:if test="${pro.product_danhmuc == 1 }">
                                 <li>                           
                                    <span>Nồng độ cồn</span>
                                    <div>${pro.product_nongdocon}</div>                                   
                                </li>
                                </c:if>
                                
                                <c:if test="${pro.product_danhmuc == 2 }">
                                <li>
                                    <span> Lượng ga</span>
                                     <div>${pro.product_luongga}</div>
                                </li>
                               
                                <li>
                                    <span> Lượng đường</span>
                                     <div>${pro.product_luongduong}</div>
                                </li>
                                 </c:if>
                                <li>
                                    <span> Thể tích</span>
                                    <div>${pro.product_thetich}</div>
                                </li>
                                
                                
                    		</ul>
		                     <div class="description  ">
		                          <h3>Thành phần</h3>
						        
						        <p>${pro.product_thanhphan}.</p>
						        
						        <h3>Hướng dẫn sử dụng</h3>
						        
						        <p>${pro.product_sudung}</p>
						        
						        <h3>Bảo quản</h3>
						        
						        <p>${pro.product_baoquan}</p>
				          </div>
				              
				            </div>
				                				        
				     <div class="comment" id="boxcomment">
				        <div class="comment-rating wrapcomrat">			            
				            <div class="boxrating">
					            <div class="title">
					           	 <h4>Đánh giá sản phẩm</h4>
					            </div>
					            <div class="ratingbox">
						            <input type="number" value="6" class="hide" disabled="" id="totalRating">
						            <div class="lrb">
							            <div class="average-rating orange">
								            <div><b>4.3</b></div>
								            <div><i class="bhx-p-star-large grayscale4"></i></div>
								            <div><span>6 đánh giá</span></div>
							            </div>
						            </div>
						            <div class="rrb">
							            <ul class="totalrating">
							            	<li>
								            	<span>5★</span>
								            	<div class="ratingbar">
								            		<div class="ratingbar-in" style="width:33.33334%"></div>
								            	</div>
								            	<label>2 <span>đánh giá</span></label>
							            	</li>
							            	<li>
								            	<span>3★</span>
								            	<div class="ratingbar">
								            		<div class="ratingbar-in" style="width:0"></div>
								            	</div>
								            	<label>0 <span>đánh giá</span></label>
								            </li>
								          </ul>
							         </div>
							        <div class="sendrating">
								        <div class="chooserate rating-chosebhx" style="display:block">
									        <span class="s">Gửi đánh giá của bạn</span> 
									        <span class="star">
										        <a href="javascript:void(0)" data-index="1"><i class="bhx-starblack medium"></i></a> 
										        <a href="javascript:void(0)" data-index="2"><i class="bhx-starblack medium"></i></a> 
										        <a href="javascript:void(0)" data-index="3"><i class="bhx-starblack medium"></i></a> 
										        <a href="javascript:void(0)" data-index="4"><i class="bhx-starblack medium"></i></a> 
										        <a href="javascript:void(0)" data-index="5"><i class="bhx-starblack medium"></i></a> 
									        </span> 
									        <span class="rstar"></span>
								        </div>
							        </div>
						        </div>
					        </div>
				            <div class="clr"></div>
				   		</div>
				   		<!-- COMMENT -->
				       <div class="fb-comments" <c:url value="http://localhost:8088/VinMart/chi-tiet-san-pham/${pro.product_id}"/>  data-width="" data-numposts="5"></div>
				        <!-- END COMMENT -->
				      </div>
				   </aside>
				   <aside class="rightcolrelate">	
				   <!-- NHOM HANG THUONG MUA -->		                        
				        <div class="groupcate">
				        	<div class="namegroup">Nhóm hàng thường mua</div>
				        	
				        	<div class="listgroup">
				        	<c:forEach var="item" items="${Spbanchay}" >
								 <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${item.product_id}"> 
								 	<img width="45" class="lazy initial loaded" height="45" data-src="${pageContext.request.contextPath}/assets/images/${item.product_image}"
								 	 alt="${item.product_name}" src="${pageContext.request.contextPath}/assets/images/${item.product_image}" data-was-processed="true"> 
								 	<span>${item.product_name}</span> 
								 </a>
							 </c:forEach>
	 						</div>
	 					</div>
	 				 <!-- END NHOM HANG THUONG MUA -->
	 				 
	 				 <!-- TIN TUC -->
	 					<div class="homehews">
		 					<div class="bartitle">
			 					<h4 class="hometitle">Mẹo hay trong gia đình</h4>
			 					<a href="https://www.facebook.com/phuongnenenha/" class="viewother">Xem các tin bài khác »</a>
			 				</div>
			 				    <%ResultSet tintuc = con.selectData("select * from tintuc "); %>
			 				   <%while(tintuc.next()){ %> 
			 				 <a href="<%=tintuc.getString("tintuc_link") %>" title="<%=tintuc.getString("tintuc_name") %>"> 
				 				 <img width="65" height="40" data-src="" alt="" class="lazy initial loaded" 
									src="${pageContext.request.contextPath}/assets/images/<%=tintuc.getString("tintuc_img") %>" data-was-processed="true">
				 				 <p><%=tintuc.getString("tintuc_name") %>
				 				 	
				 				 </p>
			 				 </a>
			 				 <%} %>
		 				 </div>
		 			<!-- END TIN TUC -->
					</aside>
     </div>
     <!--END Thong Tin san pham  -->
            </aside>
        
                <div class="clr"></div>
            </section>
         <!-- End BODY -->
	 
  	<!--  FOOTER -->
  	
  	
  	<script type="text/javascript">
    $(document).ready(function() {
        $("#mua").on("click", function() {
           
        	 var product_id = $("#product_id").val();
            	$.ajax({
            		type: "POST",  
            		url: "${pageContext.request.contextPath}/XuLyMuaHang?product_id=${pro.product_id}&action=mua",
            		data: {product_id: product_id},
         			success: function (data)
            		{	
         				
         				$("#asb").html(data);
         				
            		}	
            	});
            	return false;
        });
    }); 
    
    </script>
    
    
	<!-- CHAT -->
	<div class="container">
        <div class="chatbox">
            <div  style="position: fixed;top: 100; bottom: 39px;right: 69px;" class="chatbox__support">
                <div class="chatbox__header" style="position: unset;">
                    <div class="chatbox__image--header">
                        <img src="${pageContext.request.contextPath}/assets/images/chat.png" style="width:50px;" alt="image">
                    </div>
                    <div class="chatbox__content--header">
                        <h4 class="chatbox__heading--header">Chat support</h4>
                        <p class="chatbox__description--header">online                                                     </p>
                    </div>
                </div>
                <div class="chatbox__messages">
                    <div>
                        <div class="messages__item messages__item--visitor">
                            Can you let me talk to the support?
                        </div>
                        <div class="messages__item messages__item--operator">
                            Sure!
                        </div>
                        <div class="messages__item messages__item--visitor">
                            Need your help, I need a developer in my site.
                        </div>
                        <div class="messages__item messages__item--operator">
                            Hi... What is it? I'm a front-end developer, yay!
                        </div>
                        <div class="messages__item messages__item--typing">
                            <span class="messages__dot"></span>
                            <span class="messages__dot"></span>
                            <span class="messages__dot"></span>
                        </div>
                    </div>
                </div>
                <div class="chatbox__footer" style="position: unset;">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/emojis.svg" alt="">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/microphone.svg" alt="">
                    <input type="text" placeholder="Write a message...">
                    <p class="chatbox__send--footer">Send</p>
                    <img src="${pageContext.request.contextPath}/assets/images/icons/attachment.svg" alt="">
                </div>
            </div>
            <div style=" position: fixed;right: 66px;bottom: 4px;" class="chatbox__button">
                <button >button</button>
            </div>
        </div>
    </div>
    
    <!-- END CHAT -->
  	 <footer>
        <div class=boxfooter>
            <div class=benefits>
                <div><i class=bhx-sship></i>
                    <p>Đặt online <b>giao tận nhà ĐÚNG GIỜ</b><br>(nếu trễ tặng PMH 20.000₫)
                </div><a href=""><i
                        class=bhx-swap></i>
                    <p>Đổi, trả sản phẩm <b>trong 7 ngày</b></p>
                </a>
            </div>
            <div class=detail>
                <aside>
                    <div class=callcenter><i class=bhx-call></i> Tổng đài: <a href=tel:19001908>1900.1908</a> - <a
                            href=tel:02836229900>028.3622.9900</a> (7:00 - 21:30)</div>
                    <div class=linkstatic><a href="">Chính sách giao hàng</a> <a
                            href="">Chính sách đổi trả</a> <a
                            href="">Liên hệ</a> <a href="" target=_blank
                            rel=noopener>Hóa đơn điện tử</a> <a href="">Hướng dẫn mua hàng</a> <a
                            href="">Quy chế hoạt động</a> <a href=""
                            class=recruitment target=_blank rel=noopener>Tuyển dụng </a> <a
                            href="" class=hot-Job target=_blank
                            rel=noreferrer><strong>6.378</strong> công việc đang chờ bạn</a></div>
                    <div class=webmember>
                        <div class=logo-member><span>Website thành viên</span>
                            <div class=link-member><a href="https://www.thegioididong.com/" target=_blank
                                    aria-hidden=true rel=noopener><i class=bhx-tgdd></i></a> <a
                                    href="https://www.dienmayxanh.com/" target=_blank aria-hidden=true rel=noopener><i
                                        class=bhx-dmx></i></a> <a href="https://www.maiamtgdd.vn/" target=_blank
                                    aria-hidden=true rel=noopener><i class=bhx-maiam></i></a></div>
                        </div>
                    </div>
                </aside>
                <aside>
                    <div class=stores>
                        <div><i class=bhx-footer-purchase></i><a href="" class=purchaselink>Đăng ký chào
                                hàng vào Vinmart</a></div>
                        <div><i class=bhx-stores></i><a href="">Hệ thống <span>1.755</span> cửa hàng
                                Vinmart</a></div>
                    </div>
                    <div class=socail>
                        <div class=social-left><a
                                href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=43376" target=_blank
                                class=bhx-bct aria-hidden=true rel=noopener></a> <a
                                href="https://www.dmca.com/Protection/Status.aspx?ID=ef7c58db-1070-4726-9941-843b4ef9a243&amp;refurl=https://www.bachhoaxanh.com/"
                                title="DMCA.com Protection Status" class=dmca-badge> <img width=100 height=20 class=lazy
                                    data-src="https://images.dmca.com/Badges/dmca-badge-w100-5x1-11.png?ID=ef7c58db-1070-4726-9941-843b4ef9a243"
                                    alt="DMCA.com Protection Status"> </a></div>
                        <div class=social-right>
                            <div class=fb-like data-href="https://www.facebook.com/sieuthibachhoaxanh/" data-width=90px
                                data-layout=button_count data-action=like data-size=small data-show-faces=false
                                data-share=false></div><a href=https://www.youtube.com/channel/UCF7OPnbn3u8OivdD4cqBkRQ
                                target=_blank aria-hidden=true rel=noopener>
                                <div class=g-ytsubscribe data-channelid=UCF7OPnbn3u8OivdD4cqBkRQ data-layout=default
                                    data-count=hidden></div>
                            </a>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
        <div class=copyright>© 2018. Công Ty Cổ Phần Dịch Vụ Thương Mại Tổng Hợp VinCommerce
            MSDN: 0104918404 do Sở Kế hoạch và Đầu tư TP. Hà Nội cấp lần đầu ngày 20/09/2010
            Đăng ký thay đổi lần thứ 42 do Sở Kế hoạch Đầu tư TP. Hồ Chí Minh ngày 13/02/2020. <a href="">Xem chính
                sách sử dụng web</a></div>
    </footer>
    
    <div id="back-top" style="display: block;">↑<span>Lên đầu trang</span></div>
    <div style="position: relative">
        <div id="mp-notification-DwGe8YX487" class="mp-notification-element-wrapper">
        <div class="mp-notification-element-button-wrapper">
            <div class="mp-notification-element ">
                <a href="javascript:void(0)"   id="mp-notification-button-open">
                    <img src="https://static.mepuzz.com/images/bell-icon.png" class="mp-notification-element-button-img">
                </a>
               
            </div>
        </div>
     
    </div>
    </div>
  	
	<%@ include file="/WEB-INF/views/layouts/customer/decorators/footer.jsp" %>
   <!-- END FOOTER -->
     	    <script defer async src="//cdn.tgdd.vn/bachhoaxanh/www/Scripts/min/product.min.v202103051029.js"></script>
  
<script>
    <%@include file="/WEB-INF/views/layouts/customer/js/Chat.js" %>
    </script>
     <script>
    <%@include file="/WEB-INF/views/layouts/customer/js/app.js" %>
    </script>
    </body>
	<!-- END BODY  -->
</html>