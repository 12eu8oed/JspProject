<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.PensionDAO"%>
<%@ page import="db.PensionBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<body>

<%
	String str = request.getParameter("month");
	int month=Integer.parseInt(str);
%>
<center>
	<table width="1000">
		<tr height="100">
			<td align="center"colspan="3">
					<font size="7" color="gray"><%=month %>��</font>
			</td>
		</tr>
	<% 
		PensionDAO pdao = new PensionDAO();
		Vector<PensionBean> v = pdao.getPensionByMonth(month);
		//tr�� 3���� �����ְ� �ٽ� tr�� ���� �Ҽ� �ֵ��� �ϴ� ���� ���� 
		int j = 0;
		for(int i = 0; i < v.size();i++){
			//���Ϳ� ����Ǿ� �ִ� ��Ŭ������ ����
			PensionBean bean = v.get(i);
			if(j%3==0){
	%>		
			<tr height="220">
	<% 
			}
	%>
			<td width="333" align="center">
				<a href ="Main.jsp?center=PensionReserveInfo.jsp?id=<%=bean.getId()%>">
				<img alt ="" src="img/<%=bean.getImage()%>" width="300" height="200"> 
				</a><p>
				<font size ="3" color="gray"><b> ����̸� : <%=bean.getName()%></b></font></p>
			</td>

	<% 		
			j = j+1;
		}
 	%>
	</table>
</center>

<button onclick="location.href='Main.jsp?center=PensionMonthList.jsp'">�� �������� ���ư���</button>


</body>
</html>