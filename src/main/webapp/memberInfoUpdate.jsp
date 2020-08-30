<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.member.MemberVO" %>
    <%
    MemberVO memberInfo = (MemberVO) request.getAttribute("memberInfo");
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
<form action="memberInfoUpdate.do" method="post">
<table>
	<tr>
		<td>회원 이메일</td>
		<td><%=memberInfo.getMember_email() %><input type="hidden" name="member_email" value="<%=memberInfo.getMember_email()%>"></td>
	</tr>
	<tr>
		<td>회원 비밀번호</td>
		<td><input type="text" name="member_pw" value="<%=memberInfo.getMember_pw()%>"></td>
	</tr>
	<tr>
		<td>회원 이름</td>
		<td><input type="text" name="member_name" value="<%=memberInfo.getMember_name()%>"></td>
	</tr>
	<tr>
		<td>회원 전화번호</td>
		<td><input type="text" name="member_tel" value="<%=memberInfo.getMember_tel()%>"></td>
	</tr>
</table>
<input type="submit" value="수정">
</form>
</body>
</html>