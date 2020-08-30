<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierFoodVO" %>
    <%
    List<SupplierFoodVO> foodList = (List) request.getAttribute("foodList");
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
<nav>
	<a href="logout.do">로그아웃</a>
	<a href="foodInsert.jsp">식자재 등록</a>
	<a href="supplierInfoUpdatePage.do?supplier_business_number=<%=supplier_business_number%>">공급자 정보 수정</a>
	<a href="supplierCalPage.do?supplier_business_number=<%=supplier_business_number%>">정산</a>
</nav>
<table>
	<tr>
		<td>식자재사진</td>
		<td>식자재명</td>
		<td>식자재가격</td>
		<td>식자재승인여부</td>
	</tr>
	<%for(SupplierFoodVO food : foodList){ %>
	<tr>
		<td><%=food.getSupplier_food_image() %></td>
		<td><%=food.getSupplier_food_name() %></td>
		<td><%=food.getSupplier_food_price() %></td>
		<td><%if(food.getSupplier_food_yesno().equals("승인대기중")){ %>
		승인대기중
		<%}else if(food.getSupplier_food_yesno().equals("승인")){ %>
		승인
		<%}else if(food.getSupplier_food_yesno().equals("거절")){ %>
		거절
		<%} %>
		</td>
		
	</tr>
	<%} %>
</table>
</body>
</html>