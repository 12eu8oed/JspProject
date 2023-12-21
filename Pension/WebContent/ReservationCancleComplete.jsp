<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<h2>예약이 취소되었습니다.</h2>
<%
	String str = request.getParameter("id");
	int id=Integer.parseInt(str);
	
	PensionDAO pdao = new PensionDAO();
	pdao.changeStatus0(id);
	pdao.inputCode0(id);
	//전화번호도 넣어야함
	pdao.inputPhone0(id);
%>

	<button onclick="location.href='Main.jsp'">메인화면으로 돌아가기</button>

</body>
</html>