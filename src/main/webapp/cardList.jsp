<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.member.CardListVO" %>
    <%
    List<CardListVO> cardList = (List) request.getAttribute("cardList");
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
			<td>카드번호</td>
			<td>유효기간</td>
			<td>카드종류</td>
		</tr>
		<%for(CardListVO card : cardList){ %>
		<tr>
			<td><%=card.getCard_number() %></td>
			<td><%=card.getCard_date() %></td>
			<td><%=card.getCard_kind() %></td>
			<td><form action="deleteCard.do" method="post"><input type="hidden" name="card_code" value="<%=card.getCard_code()%>"><input type="hidden" name="member_email" value="<%=member_email%>"><input type="submit" value="삭제"></form></td>
		</tr>
		<%} %>
	</table>
	<button onclick="location.href='cardInsert.jsp'">카드 등록</button>
</body>
</html>