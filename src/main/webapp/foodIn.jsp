<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="insertFood.do" method="post">
	<table>
		<tr>
			<td>�������</td>
			<td><input type="text" name="food_name"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="food_unit"></td>
		</tr>
	</table>
	<input type="submit" value="���">
	</form>
</body>
</html>