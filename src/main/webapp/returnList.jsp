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
			<td>�������</td>
			<td>����</td>
			<td>�ֹ���</td>
			<td>�ֹ���¥</td>
			<td>�ּ�</td>
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
			<%if(returnList.get(i).getOrder_state().equals("ȯ�� ��û")){ %>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="ȯ�� ��û ����">
				<input type="submit" value="����">
			</form>
			</td>
			
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="��� �Ϸ�">
				<input type="submit" value="����">
			</form>
			<%} else if(returnList.get(i).getOrder_state().equals("ȯ�� ��û ����")) {%>
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="ȯ�� �Ϸ�">
				<input type="submit" value="ȯ�� �Ϸ�">
			</form>
			</td>
			<%} %>
			<%}else{ %>
			<td>
			<%if(returnList.get(i).getOrder_code()!=returnList.get(i-1).getOrder_code()){ %>
			<%if(returnList.get(i).getOrder_state().equals("ȯ�� ��û")){ %>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="ȯ�� ��û ����">
				<input type="submit" value="����">
			</form>
			</td>
			
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="��� �Ϸ�">
				<input type="submit" value="����">
			</form>
			<%} else if(returnList.get(i).getOrder_state().equals("ȯ�� ��û ����")) {%>
			<td>
			<form action="changeOrderState3.do" method="post">
				<input type="hidden" name="order_code" value="<%=returnList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="ȯ�� �Ϸ�">
				<input type="submit" value="ȯ�� �Ϸ�">
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