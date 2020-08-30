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
<form action="insertAddress.do" method="post">
	<table>
		<tr>
			<td>우편번호</td>
			<td><input type="text" name="post_number"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><input type="text" name="address_detail"></td>
		</tr>
	</table>
	<input type="hidden" name="member_email" value="<%=member_email%>">
	<input type="submit" value="주소등록">
	</form>
</body>
</html>