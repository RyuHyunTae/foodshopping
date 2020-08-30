<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierFoodVO" %>
    <%
    List<SupplierFoodVO> foodList = (List) request.getAttribute("foodList");
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
			<td>사업자번호</td>
			<td>식자재명</td>
			<td>식자재가격</td>
			<td>식자재단위</td>
		</tr>
		<%for(SupplierFoodVO food : foodList){ %>
		<tr>
			<td><%=food.getSupplier_business_number() %></td>
			<td><a href="foodYesNoDetail.do?supplier_food_code=<%=food.getSupplier_food_code()%>"><%=food.getSupplier_food_name() %></a></td>
			<td><%=food.getSupplier_food_price() %></td>
			<td><%=food.getSupplier_food_unit() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>