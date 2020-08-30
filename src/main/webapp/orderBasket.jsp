<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierFoodVO"%>
    <%@page import="com.food.biz.member.AddressListVO" %>
    <%@page import="com.food.biz.member.CardListVO" %>
    <%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = formatter.format(new java.util.Date());
	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("MM");
	String today2 = formatter2.format(new java.util.Date());
    
    List<CardListVO> cardList = (List) request.getAttribute("cardList");
    List<AddressListVO> addressList = (List) request.getAttribute("addressList");
    List<SupplierFoodVO> supplierFoodList = (List) request.getAttribute("supplierFoodList");
	String member_email = (String) session.getAttribute("member_email");
	String member_name = (String) session.getAttribute("member_name");
	Integer member_grade_code = (Integer) session.getAttribute("member_grade_code");
	Integer admin = (Integer) session.getAttribute("admin");
	
	int order_total = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="basketInsertOrder.do" method="post">
	<table>
		<tr>
			<td>��ǰ��</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<%for(SupplierFoodVO supplierFood : supplierFoodList){ %>
		<tr>
			<td><%=supplierFood.getSupplier_food_name() %></td>
			<td><%=supplierFood.getBasket_detail_amount() %></td>
			<td><%=supplierFood.getSupplier_food_price() * supplierFood.getBasket_detail_amount()%></td>
			<%order_total+=supplierFood.getSupplier_food_price() * supplierFood.getBasket_detail_amount(); %>
		</tr>
		<%} %>
		<tr>
			
		</tr>
		<tr>
			<td>�հ� : <%=order_total %></td>
			<td>��ۺ� : 2500</td>
			<td>�Ѱ��� : <%=order_total+2500 %></td>
		</tr>
	</table>
	<table>
		<tr><td></td>
			<td>�����ȣ</td>
			<td>�ּ�</td>
			<td>���ּ�</td>
		</tr>
		
		<%for(AddressListVO address : addressList){ %>
		<tr>
			<td><input type="radio" name="address_code" value="<%=address.getAddress_code()%>"></td>
			<td><%=address.getPost_number() %></td>
			<td><%=address.getAddress() %></td>
			<td><%=address.getAddress_detail() %></td>
		</tr>
		<%} %>
		<tr>
				<td><input type="radio" name="address_code" value="0"></td>
				<td><input type="text" name="post" placeholder="�����ȣ"></td>
				<td><input type="text" name="order_address" placeholder="�ּ�"></td>
				<td><input type="text" name="order_address_detail" placeholder="�ּһ�"></td>
			</tr>
	</table>
	<table>
		<tr>
			<td>ī���ȣ</td>
			<td>��ȿ�Ⱓ</td>
			<td>ī������</td>
		</tr>
		<%for(CardListVO card : cardList){ %>
		<tr>
		<td><input type="radio" name="card_code" value="<%=card.getCard_code()%>"></td>
			<td><%=card.getCard_number() %></td>
			<td><%=card.getCard_date() %></td>
			<td><%=card.getCard_kind() %></td>
		</tr>
		<%} %>
		<tr>
				<td><input type="radio" name="card_code" value="0"></td>
				<td><input type="text" name="card_number" placeholder="ī���ȣ"></td>
				<td><input type="text" name="card_date" placeholder="��ȿ�Ⱓ"></td>
				<td><input type="text" name="card_kind" placeholder="ī������"></td>
			</tr>
	</table>
	<input type="hidden" name="member_email" value="<%=member_email%>">
	<input type="hidden" name="order_date" value="<%=today%>">
	<input type="hidden" name="sell_month" value="<%=today2%>">
	<input type="hidden" name="order_state" value="�غ���">
	<input type="hidden" name="order_total" value="<%=order_total%>">
	<input type="hidden" name="member_grade_code" value="<%=member_grade_code%>">
	<input type="submit" value="�����ϱ�">
	<input type="button" value="����ϱ�">
	</form>
</body>
</html>