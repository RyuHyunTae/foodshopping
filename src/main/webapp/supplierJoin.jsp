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
		<td>����� ��ȣ</td>
		<td><input type="text" name="supplier_business_number"></td>
	</tr>
	<tr>
		<td>������ ��й�ȣ</td>
		<td><input type="text" name="supplier_pw"></td>
	</tr>
	<tr>
		<td>������ �̸�</td>
		<td><input type="text" name="supplier_name"></td>
	</tr>
	<tr>
		<td>������ ��ȭ��ȣ</td>
		<td><input type="text" name="supplier_tel"></td>
	</tr>
</table>
<input type="submit" value="ȸ������">
</form>
</body>
</html>