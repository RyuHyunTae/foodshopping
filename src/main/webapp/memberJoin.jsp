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
		<td>ȸ�� �̸���</td>
		<td><input type="text" name="member_email"></td>
	</tr>
	<tr>
		<td>ȸ�� ��й�ȣ</td>
		<td><input type="text" name="member_pw"></td>
	</tr>
	<tr>
		<td>ȸ�� �̸�</td>
		<td><input type="text" name="member_name"></td>
	</tr>
	<tr>
		<td>ȸ�� ��ȭ��ȣ</td>
		<td><input type="text" name="member_tel"></td>
	</tr>
</table>
<input type="submit" value="ȸ������">
</form>
</body>
</html>