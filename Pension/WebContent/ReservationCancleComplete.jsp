<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<h2>������ ��ҵǾ����ϴ�.</h2>
<%
	String str = request.getParameter("id");
	int id=Integer.parseInt(str);
	
	PensionDAO pdao = new PensionDAO();
	pdao.changeStatus0(id);
	pdao.inputCode0(id);
	//��ȭ��ȣ�� �־����
	pdao.inputPhone0(id);
%>

	<button onclick="location.href='Main.jsp'">����ȭ������ ���ư���</button>

</body>
</html>