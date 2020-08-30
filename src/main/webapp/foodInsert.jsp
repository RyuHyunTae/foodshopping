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
	<a href="logout.do">로그아웃</a>
	<a href="foodInsert.jsp">식자재 등록</a>
</nav>
	<table>
		<form action="upload.do" method="post" enctype="multipart/form-data">
			<tr>
				<td>사진</td>
				<td><input type="file" name="file1"></td>
				<td><input type="submit" value="사진등록"
					class="btn btn-outline-secondary"></td>
			</tr>
		</form>
		<form action="insertSupplierFood.do" method="post">
		<tr>
			<td>식자재명</td>
			<td><input type="text" name="supplier_food_name"></td>
		</tr>
		<tr>
			<td>식자재 설명</td>
			<td><input type="text" name="supplier_food_comment"></td>
		</tr>
		<tr>
			<td>식자재 재고</td>
			<td><input type="text" name="supplier_food_stock"></td>
		</tr>
		<tr>
			<td>식자재 가격</td>
			<td><input type="text" name="supplier_food_price"></td>
		</tr>
		<tr>
			<td>식자재 단위</td>
			<td><input type="text" name="supplier_food_unit"></td>
		</tr>
		<tr>
			<td>식자재 사진</td>
			<td><input type="hidden" name="supplier_food_image" value="<%=url%>"><%=url%></td>
		</tr>
	<tr>
	<td><input type="hidden" name="supplier_business_number" value="<%=supplier_business_number%>">
	<input type="hidden" name="supplier_food_yesno" value="승인대기중">
	<input type="submit" value="등록">
	</td>
	</tr>
	</form>
	</table>

</body>
</html>