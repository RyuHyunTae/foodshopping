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
  <a href="http://localhost:8080/biz/recipeList.do">Ȩ</a>
  <%if(member_email==null){ %>
  <a href="supplierLogin.jsp">�����ڷα���</a>
	<a href="memberLogin.jsp">ȸ���α���</a>
	<%}else{ %>
	<a href="logout.do">�α׾ƿ�</a>
	<%} %>
	<a href="supplierFoodList.do">������ �˻�ȭ��</a>
	<%if(admin!=null && admin==0){ %>
	<a href="basketList.do?member_email=<%=member_email%>">��ٱ���</a>
	<a href="getOrderList.do?member_email=<%=member_email%>">����������</a>
	<%}else if(admin!=null&&admin==1){ %>
	<a href="test.do">�����ǵ��</a>
	<a href="foodIn.jsp">��������</a>
	<a href="orderList.do">�ֹ�Ȯ��</a>
	<a href="foodYesNo.do">������ ��û���</a>
	<%} %>
</nav>


   
</body>
</html>