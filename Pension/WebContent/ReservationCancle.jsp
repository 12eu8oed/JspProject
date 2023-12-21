<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<h2> 진짜 예약을 취소하시겠습니까? </h2>
<%
	String str = request.getParameter("id");
	
%>
<button onclick="location.href='Main.jsp?center=ReservationCancleComplete.jsp?id=<%=str%>'"style="background-color: red;">정말로 예약취소하기</button>

</body>
</html>