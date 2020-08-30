<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="supplierJoin.do" method="post">
<table>
	<tr>
		<td>사업자 번호</td>
		<td><input type="text" name="supplier_business_number"></td>
	</tr>
	<tr>
		<td>공급자 비밀번호</td>
		<td><input type="text" name="supplier_pw"></td>
	</tr>
	<tr>
		<td>공급자 이름</td>
		<td><input type="text" name="supplier_name"></td>
	</tr>
	<tr>
		<td>공급자 전화번호</td>
		<td><input type="text" name="supplier_tel"></td>
	</tr>
</table>
<input type="submit" value="회원가입">
</form>
</body>
</html>