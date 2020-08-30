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
			<td>식자재명</td>
			<td>수량</td>
			<td>주문자</td>
			<td>주문날짜</td>
			<td>주소</td>
			<td>주문상태</td>
		</tr>
		<%for(int i = 0 ; i<orderList.size();i++){ %>
		<tr>
			<td><%=orderList.get(i).getSupplier_food_name()%></td>
			<td><%=orderList.get(i).getOrder_detail_amount() %></td>
			<td><%=orderList.get(i).getMember_email() %></td>
			<td><%=orderList.get(i).getOrder_date() %></td>
			<td><%=orderList.get(i).getOrder_address() + " " + orderList.get(i).getOrder_address_detail() %></td>
			<%if(i==0){%>
			<td>
			<%if(orderList.get(i).getOrder_state().equals("준비중")){ %>
			준비중
			</td>
			<td>
			<button onclick="location.href='deleteOrder.do?order_code=<%=orderList.get(i).getOrder_code()%>&member_email=<%=orderList.get(i).getMember_email()%>'">취소</button>
			<%} else if(orderList.get(i).getOrder_state().equals("배송중")) {%>
			배송중
			<%} else if(orderList.get(i).getOrder_state().equals("배송 완료")){ %>
			배송 완료
			</td>
			<td>
			<form action="changeOrderState2.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 신청">
				<input type="hidden" name="member_email" value="<%=orderList.get(i).getMember_email()%>">
				<input type="submit" value="환불 신청">
			</form>
			<%} else if(orderList.get(i).getOrder_state().equals("환불 신청")){ %>
			환불 신청 대기
			<%} else if(orderList.get(i).getOrder_state().equals("환불 신청 승인")){%>
			환불 신청 승인
			<%} else if(orderList.get(i).getOrder_state().equals("환불 완료")){%>
			환불 완료
			<%} %>
			</td>
			<%}else{ %>
			<%if(orderList.get(i).getOrder_code()!=orderList.get(i-1).getOrder_code()){ %>
			<td>
			<%if(orderList.get(i).getOrder_state().equals("준비중")){ %>
			준비중
			</td>
			<td>
			<button onclick="location.href='deleteOrder.do?order_code=<%=orderList.get(i).getOrder_code()%>&member_email=<%=orderList.get(i).getMember_email()%>'">취소</button>
			<%} else if(orderList.get(i).getOrder_state().equals("배송중")) {%>
			배송중
			<%} else if(orderList.get(i).getOrder_state().equals("배송 완료")){ %>
			배송 완료
			</td><td>
			<form action="changeOrderState2.do" method="post">
				<input type="hidden" name="order_code" value="<%=orderList.get(i).getOrder_code()%>">
				<input type="hidden" name="order_state" value="환불 신청">
				<input type="hidden" name="member_email" value="<%=orderList.get(i).getMember_email()%>">
				<input type="submit" value="환불 신청">
			</form>
			<%} else if(orderList.get(i).getOrder_state().equals("환불 신청")){ %>
			환불 신청 대기
			<%} else if(orderList.get(i).getOrder_state().equals("환불 신청 승인")){%>
			환불 신청 승인
			<%} else if(orderList.get(i).getOrder_state().equals("환불 완료")){%>
			환불 완료
			<%} %>
			</td>
			<%} %>
			<%} %>
		</tr>
		<%} %>
		<tr>
			<td><form action="cardList.do" method="post"><input type="hidden" name="member_email" value="<%=member_email%>"><input type="submit" value="카드관리"></form></td>
			<td></td>
		</tr>
		<tr>
			<td><form action="addressList.do" method="post"><input type="hidden" name="member_email" value="<%=member_email%>"><input type="submit" value="배송지관리"></form></td>
			<td></td>
		</tr>
		<tr>
			<td><form action="memberInfoUpdatePage.do" method="post"><input type="hidden" name="member_email" value="<%=member_email%>"><input type="submit" value="회원정보수정"></form></td>
			<td></td>
		</tr>
	</table>
</body>
</html>