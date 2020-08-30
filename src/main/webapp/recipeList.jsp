<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.recipe.RecipeVO" %>
    <%
    List<RecipeVO> recipeList = (List) request.getAttribute("recipeList");
    List<RecipeVO> popularRecipe = (List) request.getAttribute("popularRecipe");
	String member_email = (String) session.getAttribute("member_email");
	String member_name = (String) session.getAttribute("member_name");
	Integer member_grade_code = (Integer) session.getAttribute("member_grade_code");
	Integer admin = (Integer) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="recipeSearch.do" method="get">
<input type="text" name="recipe_name"><input type="submit" value="검색">
</form>
<%if(popularRecipe!=null){ %>
등급별
<table>
	<%for(RecipeVO recipe : popularRecipe){ %>
	<tr>
		<td><img
				src="http://localhost:8080\biz\img\<%=recipe.getRecipe_image()%>"
				width="50" height="50"
				onclick="location.href='recipeDetail.do?recipe_code=<%=recipe.getRecipe_code()%>'">
		</td>
		<td><%=recipe.getRecipe_name() %></td>
		<td><%=recipe.getRecipe_grade() %></td>
		
	</tr>
	<%} %>
</table>
전체
<%}else{ %>
검색
	<%} %>
	<table>
	<%for(RecipeVO recipe : recipeList){ %>
	<tr>
		<td><img
				src="http://localhost:8080\biz\img\<%=recipe.getRecipe_image()%>"
				width="50" height="50"
				onclick="location.href='recipeDetail.do?recipe_code=<%=recipe.getRecipe_code()%>'">
		</td>
		<td><%=recipe.getRecipe_name() %></td>
		<td><%=recipe.getRecipe_grade() %></td>
		
	</tr>
	<%} %>
	</table>
</body>
</html>