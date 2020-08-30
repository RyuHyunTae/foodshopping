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
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
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
			<td>합계 : <%=order_total %></td>
			<td>배송비 : 2500</td>
			<td>총가격 : <%=order_total+2500 %></td>
		</tr>
	</table>
	<table>
		<tr><td></td>
			<td>우편번호</td>
			<td>주소</td>
			<td>상세주소</td>
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
				<td><input type="text" name="post" placeholder="우편번호"></td>
				<td><input type="text" name="order_address" placeholder="주소"></td>
				<td><input type="text" name="order_address_detail" placeholder="주소상세"></td>
			</tr>
	</table>
	<table>
		<tr>
			<td>카드번호</td>
			<td>유효기간</td>
			<td>카드종류</td>
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
				<td><input type="text" name="card_number" placeholder="카드번호"></td>
				<td><input type="text" name="card_date" placeholder="유효기간"></td>
				<td><input type="text" name="card_kind" placeholder="카드종류"></td>
			</tr>
	</table>
	<input type="hidden" name="member_email" value="<%=member_email%>">
	<input type="hidden" name="order_date" value="<%=today%>">
	<input type="hidden" name="sell_month" value="<%=today2%>">
	<input type="hidden" name="order_state" value="준비중">
	<input type="hidden" name="order_total" value="<%=order_total%>">
	<input type="hidden" name="member_grade_code" value="<%=member_grade_code%>">
	<input type="submit" value="구매하기">
	<input type="button" value="취소하기">
	</form>
</body>
</html>