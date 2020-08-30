<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.order.OrderVO" %>
    <%
    List<OrderVO> returnList = (List) request.getAttribute("returnList");
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
	<td></td>
			<td>식자재명</td>
			<td>수량</td>
			<td>주문자</td>
			<td>주문날짜</td>
			<td>주소</td>
		</tr>
		<%for(int i = 0 ; i<returnList.size();i++){ %>
		<tr>
		<td><%=returnList.get(i).getOrder_code() %></td>
			<td><%=returnList.get(i).getSupplier_food_name()%></td>
			<td><%=returnList.get(i).getOrder_detail_amount() %></td>
			<td><%=returnList.get(i).getMember_email() %></td>
			<td><%=returnList.get(i).getOrder_date() %></td>
			<td><%=returnList.get(i).getOrder_address() + " " + returnList.get(i).getOrder_address_detail() %></td>
			<%if(i==0){%>
			<td>
			<%if(returnList.get(i).getOrder_state().equals("환불 신청")){ %>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 신청 승인">
				<input type="submit" value="승인">
			</form>
			</td>
			
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="배송 완료">
				<input type="submit" value="거절">
			</form>
			<%} else if(returnList.get(i).getOrder_state().equals("환불 신청 승인")) {%>
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 완료">
				<input type="submit" value="환불 완료">
			</form>
			</td>
			<%} %>
			<%}else{ %>
			<td>
			<%if(returnList.get(i).getOrder_code()!=returnList.get(i-1).getOrder_code()){ %>
			<%if(returnList.get(i).getOrder_state().equals("환불 신청")){ %>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 신청 승인">
				<input type="submit" value="승인">
			</form>
			</td>
			
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="배송 완료">
				<input type="submit" value="거절">
			</form>
			<%} else if(returnList.get(i).getOrder_state().equals("환불 신청 승인")) {%>
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 완료">
				<input type="submit" value="환불 완료">
			</form>
			</td>
			<%} %>
			<%} %>
			<%} %>
		</tr>
		<%} %>
	</table>
</body>
</html>