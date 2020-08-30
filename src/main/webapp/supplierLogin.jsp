<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="supplierLogin.do" method="post">
		<table>
			<tr>
				<td>supplier_business_number</td>
				<td><input type="text" name="supplier_business_number"></td>
			</tr>
			<tr>
				<td>supplier_pw</td>
				<td><input type="text" name="supplier_pw"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="button" value="회원가입" onclick="location.href='supplierJoin.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>