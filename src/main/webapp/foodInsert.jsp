<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String url = (String) request.getAttribute("url");
	String supplier_business_number = (String) session.getAttribute("supplier_business_number");
	String supplier_name = (String) session.getAttribute("supplier_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav>
	<a href="logout.do">�α׾ƿ�</a>
	<a href="foodInsert.jsp">������ ���</a>
</nav>
	<table>
		<form action="upload.do" method="post" enctype="multipart/form-data">
			<tr>
				<td>����</td>
				<td><input type="file" name="file1"></td>
				<td><input type="submit" value="�������"
					class="btn btn-outline-secondary"></td>
			</tr>
		</form>
		<form action="insertSupplierFood.do" method="post">
		<tr>
			<td>�������</td>
			<td><input type="text" name="supplier_food_name"></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><input type="text" name="supplier_food_comment"></td>
		</tr>
		<tr>
			<td>������ ���</td>
			<td><input type="text" name="supplier_food_stock"></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><input type="text" name="supplier_food_price"></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><input type="text" name="supplier_food_unit"></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><input type="hidden" name="supplier_food_image" value="<%=url%>"><%=url%></td>
		</tr>
	<tr>
	<td><input type="hidden" name="supplier_business_number" value="<%=supplier_business_number%>">
	<input type="hidden" name="supplier_food_yesno" value="���δ����">
	<input type="submit" value="���">
	</td>
	</tr>
	</form>
	</table>

</body>
</html>