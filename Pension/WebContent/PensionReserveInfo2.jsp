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
		
		//��Ʈī �ϳ��� ���� ������ ���� 
		PensionBean bean = pdao.getOnePension(id);

		
		
	%>
	
<center>
	<form action = "Main.jsp?center=CheckReservation2.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName()%> ��� </font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="8" width="500">
					<img alt = "" src="img/<%=bean.getImage()%>" width="450">	
					
				</td>
						
			</tr>	
				<tr>
					<td width="250" align="center">�̸�</td>
				<td width="250" align="center"><%=bean.getName()%></td>	
				</tr>
				
			<tr>	
				
			</tr>	
				<tr>
					<td width="250" align="center">��ȭ��ȣ</td>
					<td width="250" align="center"><%=bean.getCall()%></td>
				</tr>
				
			<tr>
				<td width="250" align="center">�ο���</td>
				<td width="250" align="center"><%=bean.getPeople()%></td>
				
			</tr>	
			
			
			<tr>
				<td width="250" align="center">����</td>
				<td width="250" align="center"><%=bean.getPrice()%></td>
				</td>
			</tr>
			
			
						
				
		</table>
			<br><br><br>
			<font size="5" color="gray"> ��� ����</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
</body>
</html>