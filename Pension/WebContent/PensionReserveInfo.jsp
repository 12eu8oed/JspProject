<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<%@ page import="db.PensionDAO"%>
<%@ page import="db.PensionBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		int id = Integer.parseInt(request.getParameter("id"));
	
		//������ ���̽��� ����
		PensionDAO pdao  = new PensionDAO();
		
		
		PensionBean bean = pdao.getOnePension(id);
	%>
<center>
	<form action="Main.jsp?center=CheckReservation.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="3">
					<font size="7" color="#333333"><%= bean.getName() %></font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="8" width="500">
					<img alt="" src="img/<%= bean.getImage() %>" width="500">	
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center" style="font-size: 20px;">�̸�</td>
				<td width="250" align="center" style="font-size: 20px;"><%= bean.getName() %></td>
			</tr>
			
			<tr>
				<td width="250" align="center" style="font-size: 20px;">�뿩 ��</td>
				<td width="250" align="center" style="font-size: 20px;"><%= bean.getMonth() %>��</td>
			</tr>
			
			<tr>
				<td width="250" align="center" style="font-size: 20px;">��ȭ��ȣ</td>
				<td width="250" align="center" style="font-size: 20px;"><%= bean.getCall() %></td>
			</tr>
			
			<tr>
				<td width="250" align="center" style="font-size: 20px;">�ο� ��</td>
				<td width="250" align="center" style="font-size: 20px;"><%= bean.getPeople() %></td>
			</tr>
			
			<tr>
				<td width="250" align="center" style="font-size: 20px;">����</td>
				<td width="250" align="center" style="font-size: 20px;"><%= bean.getPrice() %> ��</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="id" value="<%= bean.getId() %>">
					<input type="hidden" name="price" value="<%= bean.getPrice() %>">
					<input type="hidden" name="account" value="<%= bean.getAccount() %>">
					<input type="hidden" name="month" value="<%= bean.getMonth() %>">
					<input type="hidden" name="name" value="<%= bean.getName() %>">
					<input type="submit" value="�Ѵ޻��!" style="font-size: 20px;">
				</td>
			</tr>
		</table>
		<br><br><br>
		<font size="5" color="#333333">��� ����</font>
		<p>
		<font size="5"><%= bean.getInfo() %></font>
	</form>
</center>
</body>
</html>