<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierVO" %>
    <%
    SupplierVO supplierInfo = (SupplierVO) request.getAttribute("supplierInfo");
    String supplier_business_number = (String) session.getAttribute("supplier_business_number");
	String supplier_name = (String) session.getAttribute("supplier_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="supplierInfoUpdate.do" method="post">
<table>
	<tr>
		<td>사업자 번호</td>
		<td><input type="hidden" name="supplier_business_number" value="<%=supplierInfo.getSupplier_business_number() %>"><%=supplierInfo.getSupplier_business_number() %></td>
	</tr>
	<tr>
		<td>공급자 비밀번호</td>
		<td><input type="text" name="supplier_pw" value="<%=supplierInfo.getSupplier_pw()%>"></td>
	</tr>
	<tr>
		<td>공급자 이름</td>
		<td><input type="text" name="supplier_name" value="<%=supplierInfo.getSupplier_name()%>"></td>
	</tr>
	<tr>
		<td>공급자 전화번호</td>
		<td><input type="text" name="supplier_tel" value="<%=supplierInfo.getSupplier_tel()%>"></td>
	</tr>
</table>
<input type="submit" value="수정">
</form>
</body>
</html>