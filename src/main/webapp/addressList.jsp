<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.food.biz.member.AddressListVO" %>
    <%
    List<AddressListVO> addressList = (List) request.getAttribute("addressList");
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
	<table>
		<tr>
			<td>�����ȣ</td>
			<td>�ּ�</td>
			<td>���ּ�</td>
		</tr>
		<%for(AddressListVO address : addressList){ %>
		<tr>
			<td><%=address.getPost_number() %></td>
			<td><%=address.getAddress() %></td>
			<td><%=address.getAddress_detail() %></td>
			<td><form action="deleteAddress.do" method="post"><input type="hidden" name="address_code" value="<%=address.getAddress_code()%>"><input type="hidden" name="member_email" value="<%=member_email%>"><input type="submit" value="����"></form></td>
		</tr>
		<%} %>
	</table>
	<button onclick="location.href='addressInsert.jsp'">����� ���</button>
</body>
</html>