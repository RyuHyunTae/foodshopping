<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.food.biz.supplier.SupplierFoodVO"%>
<%
	SupplierFoodVO supplierFood = (SupplierFoodVO) request.getAttribute("supplierFood");
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
	<table>
		<tr>
			<td rowspan="4"><img
				src="http://localhost:8080\biz\img\<%=supplierFood.getSupplier_food_image()%>"
				width="50" height="50"
				onclick="location.href='supplierFoodDetail.do?supplier_food_code=<%=supplierFood.getSupplier_food_code()%>'">
			</td>
			<td>식자재명</td>
			<td><%=supplierFood.getSupplier_food_name()%></td>
		</tr>
		<tr>
			<td>식자재가격</td>
			<td><%=supplierFood.getSupplier_food_price()%></td>
		</tr>
		<tr>
			<td>식자재설명</td>
			<td><%=supplierFood.getSupplier_food_comment()%></td>
		</tr>
		<tr>
			<td>식자재단위</td>
			<td><%=supplierFood.getSupplier_food_unit()%></td>
		</tr>
		
	</table>
	<%
		if (member_email != null) {
	%>
	<form action="insertBasket.do" method="post">
		<input type="hidden" name="member_email" value="<%=member_email%>">
		<input type="hidden" name="supplier_food_code"
			value="<%=supplierFood.getSupplier_food_code()%>"> <input
			type="submit" value="장바구니">
	</form>
	<form action="singleOrderPage.do" method="post">
		<input type="hidden" name="member_email" value="<%=member_email%>">
		<input type="hidden" name="supplier_food_code"
			value="<%=supplierFood.getSupplier_food_code()%>"> <input
			type="submit" value="구매">
	</form>
	<%
		}
	%>
</body>
</html>