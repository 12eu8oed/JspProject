<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<h2> ��¥ ������ ����Ͻðڽ��ϱ�? </h2>
<%
	String str = request.getParameter("id");
	
%>
<button onclick="location.href='Main.jsp?center=ReservationCancleComplete.jsp?id=<%=str%>'"style="background-color: red;">������ ��������ϱ�</button>

</body>
</html>