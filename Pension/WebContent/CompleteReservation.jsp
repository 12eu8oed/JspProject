<%@page import="db.CreateCode"%>
<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>���� �Ϸ�</title>
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
		<h2>������ �Ϸ�Ǿ����ϴ�.</h2>
		<h2>�Ʒ��� ���¹�ȣ�� �Ա����ּ���</h2>

		<table>
			<tr>
				<td colspan="3"><font size="7" color="gray">������ ��ȭ��ȣ <%=phone%></font></td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">���� <%=price%>�� </font></td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">�Ա� ���¹�ȣ <%=account%></font></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size: 24px; color: red;">���� �ڵ带 �� ����ϼ���</td>
			</tr>
			<tr>
				<td colspan="3"><font size="7" color="gray">�����ڵ� <%=code%></font></td>
			</tr>
		</table>

		<button onclick="location.href='Main.jsp'">���ư���</button>
	</center>
</body>
</html>