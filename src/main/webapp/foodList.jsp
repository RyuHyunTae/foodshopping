<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierFoodVO"%>
    <%
    List<SupplierFoodVO> supplierFoodList = (List) request.getAttribute("supplierFoodList");
	String member_email = (String) session.getAttribute("member_email");
	String member_name = (String) session.getAttribute("member_name");
	Integer member_grade_code = (Integer) session.getAttribute("member_grade_code");
	Integer admin = (Integer) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="supplierFoodSearch.do" method="get">
<input type="text" name="supplier_food_name"><input type="submit" value="검색">
</form>
	<table>
	<tr>
		<td>식자재이미지</td>
		<td>식자재이름</td>
		<td>식자재가격</td>
	</tr>
	<%for(SupplierFoodVO supplierFood : supplierFoodList){ %>
	<tr>
		<td><img
				src="http://localhost:8080\biz\img\<%=supplierFood.getSupplier_food_image()%>"
				width="50" height="50"
				onclick="location.href='supplierFoodDetail.do?supplier_food_code=<%=supplierFood.getSupplier_food_code()%>'">
		</td>
		<td><%=supplierFood.getSupplier_food_name() %></td>
		<td><%=supplierFood.getSupplier_food_price() %></td>
	</tr>
	<%} %>
	</table>
</body>
</html>