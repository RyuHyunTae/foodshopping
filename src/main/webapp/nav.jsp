<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
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
<nav>
  <a href="http://localhost:8080/biz/recipeList.do">홈</a>
  <%if(member_email==null){ %>
  <a href="supplierLogin.jsp">공급자로그인</a>
	<a href="memberLogin.jsp">회원로그인</a>
	<%}else{ %>
	<a href="logout.do">로그아웃</a>
	<%} %>
	<a href="supplierFoodList.do">식자재 검색화면</a>
	<%if(admin!=null && admin==0){ %>
	<a href="basketList.do?member_email=<%=member_email%>">장바구니</a>
	<a href="getOrderList.do?member_email=<%=member_email%>">마이페이지</a>
	<%}else if(admin!=null&&admin==1){ %>
	<a href="test.do">레시피등록</a>
	<a href="foodIn.jsp">식자재등록</a>
	<a href="orderList.do">주문확인</a>
	<a href="foodYesNo.do">식자재 신청목록</a>
	<%} %>
</nav>


   
</body>
</html>