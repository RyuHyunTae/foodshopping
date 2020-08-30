<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="memberLogin.do" method="post">
		<table>
			<tr>
				<td>member_email</td>
				<td><input type="text" name="member_email"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input type="text" name="member_pw"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="button" onclick="location.href='memberJoin.jsp'" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>