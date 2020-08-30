<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
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
<form action="insertCard.do" method="post">
	<table>
		<tr>
			<td>카드번호</td>
			<td><input type="text" name="card_number"></td>
		</tr>
		<tr>
			<td>유효기간</td>
			<td><input type="text" name="card_date"></td>
		</tr>
		<tr>
			<td>카드종류</td>
			<td><input type="text" name="card_kind"></td>
		</tr>
	</table>
	<input type="hidden" name="member_email" value="<%=member_email%>">
	<input type="submit" value="카드등록">
	</form>
</body>
</html>