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
	<a href="logout.do">�α׾ƿ�</a>
	<a href="foodInsert.jsp">������ ���</a>
	<a href="supplierInfoUpdatePage.do?supplier_business_number=<%=supplier_business_number%>">������ ���� ����</a>
	<a href="supplierCalPage.do?supplier_business_number=<%=supplier_business_number%>">����</a>
</nav>
<table>
	<tr>
		<td>���������</td>
		<td>�������</td>
		<td>�����簡��</td>
		<td>��������ο���</td>
	</tr>
	<%for(SupplierFoodVO food : foodList){ %>
	<tr>
		<td><%=food.getSupplier_food_image() %></td>
		<td><%=food.getSupplier_food_name() %></td>
		<td><%=food.getSupplier_food_price() %></td>
		<td><%if(food.getSupplier_food_yesno().equals("���δ����")){ %>
		���δ����
		<%}else if(food.getSupplier_food_yesno().equals("����")){ %>
		����
		<%}else if(food.getSupplier_food_yesno().equals("����")){ %>
		����
		<%} %>
		</td>
		
	</tr>
	<%} %>
</table>
</body>
</html>