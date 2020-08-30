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
			<td>사진</td>
			<td><input type="file" name="file1"></td>
			<td><input type="submit" value="사진등록" class="btn btn-outline-secondary"></td>
		</tr>
		</form>
		<form action="insertRecipe.do" method="post">
			<tr>
				<td>레시피 이름</td>
				<td><input type="text" name="recipe_name"></td>
			</tr>
			<tr>
				<td>레시피 설명</td>
				<td><input type="text" name="recipe_comment"></td>
			</tr>
			<tr>
				<td>레시피 재료</td>
				<td><input type="text" name="food_name" placeholder="재료명"></td>
				<td><input type="text" name="recipe_food_amount" placeholder="수량"></td>
				<td><input type="text" name="food_unit" placeholder="단위"></td>
			</tr>
			<tr>
				<td>레시피 사진</td>
				<td><input type="hidden" name="recipe_image" value="<%=url %>"><%=url %></td>
			</tr>
			<tr>
				<td><input type="hidden" name="recipe_grade" value="댓글50개이상부터 등급부여"></<input type="submit" value="등록">td>
			</tr>
		</table>
	</form>
</body>
</html>