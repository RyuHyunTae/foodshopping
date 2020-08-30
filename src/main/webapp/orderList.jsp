<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.order.OrderVO" %>
    <%
    List<OrderVO> orderList = (List) request.getAttribute("orderList");
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
			<td>�������</td>
			<td>����</td>
			<td>�ֹ���</td>
			<td>�ֹ���¥</td>
			<td>�ּ�</td>
			<td>�ֹ�����</td>
		</tr>
		<%for(int i = 0 ; i<orderList.size();i++){ %>
		<tr>
		<td><%=orderList.get(i).getOrder_code()%></td>
			<td><%=orderList.get(i).getSupplier_food_name()%></td>
			<td><%=orderList.get(i).getOrder_detail_amount() %></td>
			<td><%=orderList.get(i).getMember_email() %></td>
			<td><%=orderList.get(i).getOrder_date() %></td>
			<td><%=orderList.get(i).getOrder_address() + " " + orderList.get(i).getOrder_address_detail() %></td>
			<%if(i==0){%>
			<td>
			<%if(orderList.get(i).getOrder_state().equals("�غ���")){ %>
			<form action="changeOrderState.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="�����">
				<input type="submit" value="<%=orderList.get(i).getOrder_state()%>">
			</form>
			<%} else if(orderList.get(i).getOrder_state().equals("�����")) {%>
			<form action="changeOrderState.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="��� �Ϸ�">
				<input type="submit" value="<%=orderList.get(i).getOrder_state()%>">
			</form>
			<%} %></td>
			<%}else{ %>
			<%if(orderList.get(i).getOrder_code()!=orderList.get(i-1).getOrder_code()){ %>
			<td>
			<%if(orderList.get(i).getOrder_state().equals("�غ���")){ %>
			<form action="changeOrderState.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="�����">
				<input type="submit" value="<%=orderList.get(i).getOrder_state()%>">
			</form>
			<%} else if(orderList.get(i).getOrder_state().equals("�����")) {%>
			<form action="changeOrderState.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="��� �Ϸ�">
				<input type="submit" value="<%=orderList.get(i).getOrder_state()%>">
			</form>
			<%} %></td>
			<%} %>
			<%} %>
		</tr>
		<%} %>
	</table>
	<button onclick="location.href='returnList.do'">��ǰȮ�ν�û���</button>
</body>
</html>