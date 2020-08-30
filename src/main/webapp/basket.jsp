<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.food.biz.supplier.SupplierFoodVO"%>
<%
	List<SupplierFoodVO> basketList = (List) request.getAttribute("basketList");
	String member_email = (String) session.getAttribute("member_email");
	String member_name = (String) session.getAttribute("member_name");
	Integer member_grade_code = (Integer) session.getAttribute("member_grade_code");
	Integer admin = (Integer) session.getAttribute("admin");
	int total = 0;
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
			<td>��ǰ�̹���</td>
			<td>��ǰ��</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
		</tr>
		<%
			for (SupplierFoodVO basket : basketList) {
		%>
		<tr>
			<td><%=basket.getSupplier_food_image()%></td>
			<td><%=basket.getSupplier_food_name()%></td>
			<td><%=basket.getSupplier_food_price()%></td>
			<td><form action="basketIncrease.do" method="post">
					<input type="hidden" name="member_email" value="<%=member_email%>"><input
						type="hidden" name="supplier_food_code"
						value="<%=basket.getSupplier_food_code()%>"><input
						type="submit" value="��">
				</form><%=basket.getBasket_detail_amount()%>
				<form action="basketDecrease.do" method="post">
					<input type="hidden" name="member_email" value="<%=member_email%>"><input
						type="hidden" name="supplier_food_code"
						value="<%=basket.getSupplier_food_code()%>"><input
						type="submit" value="�ٿ�"></form></td>
						<td><button onclick="location.href='deleteBasket.do?basket_detail_code=<%=basket.getBasket_detail_code()%>&member_email=<%=member_email%>'">����</button></td>
		</tr>
		<%
			total += basket.getSupplier_food_price()*basket.getBasket_detail_amount();
			}
		%>
		<tr>
			<td></td>
			<td>�հ� : <%=total%></td>
			<td>��ۺ� : 2500</td>
			<td>�Ѱ��� : <%=total + 2500%></td>
		</tr>
	</table>

	<form action="basketOrderPage.do" method="post">
		<input type="hidden" name="member_email" value="<%=member_email%>">
		<input type="submit" value="����">
	</form>
</body>
</html>