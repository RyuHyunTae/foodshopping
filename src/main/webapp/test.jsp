<%@page import="com.food.biz.food.FoodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%
   List<FoodVO> food=(List) request.getAttribute("data");
   FoodVO selectVO=new FoodVO();
   System.out.println(food.toString());
   String url=(String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.4.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(document).ready(function() {
      $('#a').click(function() {
         var $table = $("#food");
         var tr=$("<tr></tr>");
         var td1=$('<td>���������</td><td><select style="width:100%" name="food_name" class="recipe_food"><% for(FoodVO vo:food){ %><option value=<%=vo.getFood_code()%>>��ǥ��:<%=vo.getFood_name()%>  ����:<%=vo.getFood_unit()%></option><%}%></select></td>')
         var td2=$('<td><input class="food_amount" type="text" name="recipe_food_amount" placeholder="����"></td>');
         tr.append(td1);
         tr.append(td2);
         $table.append(tr);
         })
      $('#b').click(function(){
         var size=$('select[name="food_name"]').length;
         var data={};
         var recipe_food=[];
         data.recipe_name=$("input[name='recipe_name']")[0].value;
         data.recipe_comment=$("input[name='recipe_food_amount']")[0].value;
         data.recipe_grade=$("input[name='recipe_grade']")[0].value;
         data.recipe_image=$("input[name='recipe_image']")[0].value;
         for(i=0;i<size;i++){
            var recipe={};
            recipe.food_code=$('select[name="food_name"]').eq(i)[0].value;
            recipe.food_amount=$('input[name="recipe_food_amount"]').eq(i)[0].value;
            recipe_food.push(recipe);
         }
         data.recipe_food=recipe_food;
         $.ajax({
            url:"http://localhost:8080/biz/test.do",
            type:"post",
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(data),
            crossDomain:true,
            contentType : 'application/json; charset=UTF-8',
            success:function(data){
               alert("��ϿϷ�");
               window.location.href = "http://localhost:8080/biz/recipeList.do";

            }
         })
      })
   })
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   
      <table id="food">
         <tr>
         <form action="upload2.do" method="post" enctype="multipart/form-data">
         <td>����</td>
         <td><input type="file" name="file1"></td>
         <td><input type="submit" value="�������" class="btn btn-outline-secondary"></td>
      
      </form>
         </tr>
         <tr>
         	<td>������ ������</td>
         	<td><%=url %></td>
         </tr>
         <tr>
            <td>������ �̸�</td>
            <td ><input id="recipe_name" type="text" name="recipe_name" value=""></td>
         </tr>
         <tr>
            <td>������ ����</td>
            <td><input type="recipe_comment" name="recipe_comment"></td>
         </tr>
         <tr>
            <td>������ ���</td>
            <td>
            <select style="width:100%" class="recipe_food" name="food_name">
               <% for(FoodVO vo:food){ %>
                  <option value=<%=vo.getFood_code()%>>��ǥ��:<%=vo.getFood_name()%>  ����:<%=vo.getFood_unit() %></option>
               <%} %>
            </select>
            </td>
            <td><input class="food_amount" type="text" name="recipe_food_amount"
               placeholder="����"></td>
         </tr>
         <tr>
            <td>
            <input  type="hidden" name="recipe_grade" value="���50���̻���� ��޺ο�"></td>
            <input  type="hidden" name="recipe_image" value=<%=url %>></td>
         </tr>
      </table>
      
   <button id="b">���</button>
   <button id="a">�ڼ�</button>
</body>
</html>
</body>
</html>