<%@page import="com.food.biz.recipe.EvaluationVO"%>
<%@page import="com.food.biz.recipe.RecipeDetailDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.food.biz.recipe.RecipeVO"%>
<%
	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("MM");
	String today2 = formatter2.format(new java.util.Date());

	List<RecipeDetailDTO> recipeFood = (List<RecipeDetailDTO>) request.getAttribute("recipeFood");
	RecipeVO recipe = (RecipeVO) request.getAttribute("recipe");
	String member_email = (String) session.getAttribute("member_email");
	String member_name = (String) session.getAttribute("member_name");
	Integer member_grade_code = (Integer) session.getAttribute("member_grade_code");
	Integer admin = (Integer) session.getAttribute("admin");
	List<EvaluationVO> comment = (List<EvaluationVO>) request.getAttribute("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
	<div style="width: 100%">
		<h1 style="width: 50%;"><%=recipe.getRecipe_name()%></h1>
		<h7 style="width:50%;">등급:<%=recipe.getRecipe_grade()%></h7>
	</div>
	<div style="display: grid; grid-template-columns: 500px 500px;">
		<div style="grid-column: 1/2; grid-row: 1">
			<img
				src="http://localhost:8080/biz/img/<%=recipe.getRecipe_image()%>">
		</div>
		<div style="grid-column: 3/4; grid-row: 1">
			<jsp:include page="./foodList.jsp" />
		</div>
	</div>

	<table>
		<tr>
			<th>만드는법</th>
		</tr>
		<tr>
			<td><%=recipe.getRecipe_comment()%></td>

		</tr>
		<tr>
			<th>재료명</th>
			<th>양</th>
		</tr>
		<%
			for (int a = 0; a < recipeFood.size(); a++) {
		%>
		<tr>
			<td><%=recipeFood.get(a).getFood_name()%></td>
			<td><%=recipeFood.get(a).getRecipe_food_amount()%> <%=recipeFood.get(a).getFood_unit()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<button name="allOrder">자동 주문 하기</button>
	<table>
		<tr>
			<th>아이디</th>
			<th>평가글</th>
			<th>평가점수</th>
			<th>등록</th>
		</tr>
		<%
			if (member_email != null) {
		%>
		<tr>
			<form action="evaluation.do" method="post">
				<td><%=member_email%><input type="hidden" name="member_eamil"
					value=<%=member_email%> /></td>
				<td><input type="text" name="evaluation_comment" /></td>
				<td><input type="text" name="evaluation_point" /></td> <input
					type="hidden" name="recipe_code" value=<%=recipe.getRecipe_code()%> />
				<input type="hidden" name="member_email" value="<%=member_email%>">
				<input type="hidden" name="evaluation_month" value="<%=today2%>">
				<td><input type="submit" value="등록"></td>
			</form>
		</tr>
		<%
			}
		%>
		<%
			for (EvaluationVO evaluation : comment) {
		%>
		<tr>
			<td><%=evaluation.getMember_email()%></td>
			<td><%=evaluation.getEvaluation_comment()%></td>
			<td><%=evaluation.getEvaluation_point()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>