<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
<html>
  <head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  									<%
                    				ConnectionToDB con = new ConnectionToDB();
		                 			ResultSet rs = null;
		                 			int tongtien = 0;
		                 			
									String ngaybatdau=null;
		                 			String ngayketthuc=null;
		                 			
									String type = request.getParameter("type");
									if (request.getParameter("ngaybatdau")!=null){
										ngaybatdau =  request.getParameter("ngaybatdau");
		                                ngayketthuc = request.getParameter("ngayketthuc");
		                                
									}
									
									%> 
									<%if (ngaybatdau != null && ngayketthuc != null && type != null) {%>
									<%if (type.equals("donhang")) {
			ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau 
            	+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
									
									%>      
									 
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <%while(donhang.next()){
        	  rs = con.selectData("select top (1) * from ct_donhang where donhang_id = "+donhang.getInt("donhang_id"));
				rs.next();
				int thanhtien= rs.getInt("thanhtien");
				%> 
          ['<%=donhang.getString("donhang_id")%>,<%=donhang.getString("donhang_ngaydat")%>',     <%=thanhtien%>],
         <%}%>
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <%}else{  ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau 
                       	+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");%>
     
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <%while(donhang.next()){
        	  ResultSet ct_dh = con.selectData("select * from ct_donhang where donhang_id =" + donhang.getInt("donhang_id"));
        	  while(ct_dh.next()){ 
        	  ResultSet sanpham = con.selectData("select * from product where product_id =" + ct_dh.getInt("product_id"));
					int soluong =  ct_dh.getInt("soLuong");
           
	 		%>  
          <%while(sanpham.next()){ %>
          ['<%=sanpham.getString("product_name") %>',     <%=(sanpham.getInt(3)-sanpham.getInt(3)*sanpham.getInt(4)/100)*soluong%>],
         <%}%><%}} %>
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    
    
     <% }}%>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 300px;"></div>
  </body>
</html>
