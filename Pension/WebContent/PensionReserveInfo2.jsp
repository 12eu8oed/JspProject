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
	
		//데이터 베이스에 접근
		PensionDAO pdao  = new PensionDAO();
		
		//렌트카 하나에 대한 정보를 얻어옴 
		PensionBean bean = pdao.getOnePension(id);

		
		
	%>
	
<center>
	<form action = "Main.jsp?center=CheckReservation2.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName()%> 펜션 </font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="8" width="500">
					<img alt = "" src="img/<%=bean.getImage()%>" width="450">	
					
				</td>
						
			</tr>	
				<tr>
					<td width="250" align="center">이름</td>
				<td width="250" align="center"><%=bean.getName()%></td>	
				</tr>
				
			<tr>	
				
			</tr>	
				<tr>
					<td width="250" align="center">전화번호</td>
					<td width="250" align="center"><%=bean.getCall()%></td>
				</tr>
				
			<tr>
				<td width="250" align="center">인원수</td>
				<td width="250" align="center"><%=bean.getPeople()%></td>
				
			</tr>	
			
			
			<tr>
				<td width="250" align="center">가격</td>
				<td width="250" align="center"><%=bean.getPrice()%></td>
				</td>
			</tr>
			
			
						
				
		</table>
			<br><br><br>
			<font size="5" color="gray"> 펜션 정보</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
</body>
</html>