<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%String url = (String) request.getAttribute("url"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
		<table>
		<form action="upload2.do" method="post" enctype="multipart/form-data">
		<tr>
			<td>����</td>
			<td><input type="file" name="file1"></td>
			<td><input type="submit" value="�������" class="btn btn-outline-secondary"></td>
		</tr>
		</form>
		<form action="insertRecipe.do" method="post">
			<tr>
				<td>������ �̸�</td>
				<td><input type="text" name="recipe_name"></td>
			</tr>
			<tr>
				<td>������ ����</td>
				<td><input type="text" name="recipe_comment"></td>
			</tr>
			<tr>
				<td>������ ���</td>
				<td><input type="text" name="food_name" placeholder="����"></td>
				<td><input type="text" name="recipe_food_amount" placeholder="����"></td>
				<td><input type="text" name="food_unit" placeholder="����"></td>
			</tr>
			<tr>
				<td>������ ����</td>
				<td><input type="hidden" name="recipe_image" value="<%=url %>"><%=url %></td>
			</tr>
			<tr>
				<td><input type="hidden" name="recipe_grade" value="���50���̻���� ��޺ο�"></<input type="submit" value="���">td>
			</tr>
		</table>
	</form>
</body>
</html>