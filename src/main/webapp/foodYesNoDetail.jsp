<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.supplier.SupplierFoodVO" %>
    <%@page import="com.food.biz.food.FoodVO" %>
    <%
    List<FoodVO> foodList = (List) request.getAttribute("foodList");
    SupplierFoodVO food = (SupplierFoodVO) request.getAttribute("food");
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
<form action="foodYes.do" method="post">
	<table>
		<tr>
		<td>������ ����</td>
		<td><%=food.getSupplier_food_image() %></td>
		</tr>
		<tr>
			<td>�������</td>
			<td><%=food.getSupplier_food_name() %></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><%=food.getSupplier_food_comment() %></td>
		</tr>
		<tr>
			<td>������ ���</td>
			<td><%=food.getSupplier_food_stock() %></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><%=food.getSupplier_food_price() %></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><%=food.getSupplier_food_unit() %></td>
		</tr>
		<tr>
            <td>������ ���</td>
            <td>
            <select style="width:100%" class="recipe_food" name="food_code">
               <% for(FoodVO vo:foodList){ %>
                  <option value=<%=vo.getFood_code()%>>��ǥ��:<%=vo.getFood_name()%>  ����:<%=vo.getFood_unit() %></option>
               <%} %>
            </select>
            </td>
         </tr>
	</table>
	<input type="hidden" name="supplier_food_code" value="<%=food.getSupplier_food_code()%>">
	<input type="submit" value="����">
	</form>
<button onclick="location.href='foodNo.do?supplier_food_code=<%=food.getSupplier_food_code()%>'">����</button>
</body>
</html>