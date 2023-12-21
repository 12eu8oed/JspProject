<%@page import="db.CreateCode"%>
<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>예약 완료</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		int price = Integer.parseInt(request.getParameter("price"));
		String account = new String(request.getParameter("account").getBytes("Cp1252"), "EUC-KR");
		String phone = new String(request.getParameter("phone").getBytes("Cp1252"), "EUC-KR");

		CreateCode cde = new CreateCode();
		String code = cde.generateCode();

		PensionDAO pdao = new PensionDAO();
		pdao.changeStatus(id);
		pdao.inputCode(code, id);
		pdao.inputPhone(phone, id);
	%>

	<center>
		<h2>예약이 완료되었습니다.</h2>
		<h2>아래의 계좌번호로 입금해주세요</h2>

		<table>
			<tr>
				<td colspan="3"><font size="7" color="gray">예약한 전화번호 <%=phone%></font></td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">가격 <%=price%>원 </font></td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">입금 계좌번호 <%=account%></font></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size: 24px; color: red;">예약 코드를 꼭 기억하세요</td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">예약코드 <%=code%></font></td>
			</tr>
		</table>

		<button onclick="location.href='Main.jsp'">돌아가기</button>
	</center>
</body>
</html>