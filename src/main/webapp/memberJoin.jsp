<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="memberJoin.do" method="post">
<table>
	<tr>
		<td>회원 이메일</td>
		<td><input type="text" name="member_email"></td>
	</tr>
	<tr>
		<td>회원 비밀번호</td>
		<td><input type="text" name="member_pw"></td>
	</tr>
	<tr>
		<td>회원 이름</td>
		<td><input type="text" name="member_name"></td>
	</tr>
	<tr>
		<td>회원 전화번호</td>
		<td><input type="text" name="member_tel"></td>
	</tr>
</table>
<input type="submit" value="회원가입">
</form>
</body>
</html>