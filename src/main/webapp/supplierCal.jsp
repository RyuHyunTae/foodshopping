<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.food.biz.supplier.CalVO"%>
<%
	List<CalVO> calList = (List) request.getAttribute("calList");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today3 = formatter.format(new java.util.Date());
	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("dd");
	String today2 = formatter2.format(new java.util.Date());
	String lastDate2 = (String) request.getAttribute("lastDate");
	int frequency = (Integer) request.getAttribute("frequency");
	int today = (Integer.parseInt(today2));
	int lastDate = (Integer.parseInt(lastDate2));
	String supplier_business_number = (String) session.getAttribute("supplier_business_number");
	String supplier_name = (String) session.getAttribute("supplier_name");
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
			<td>
				<%
					if ((today - lastDate) >= frequency) {
				%><form action="supplierCal.do" method="post">
					<input type="hidden" name="supplier_business_number" value="<%=supplier_business_number%>">
					<input type="hidden" name="cal_date" value="<%=today3 %>">
					<input type="hidden" name="lastDate" value="<%=lastDate%>">
					<input type="submit" value="정산">
				</form>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td>정산날짜</td>
			<td>정산가격</td>
		</tr>
		<%
			for (CalVO cal : calList) {
		%>
		<tr>
			<td><%=cal.getCal_date()%></td>
			<td><%=cal.getCal_price()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>