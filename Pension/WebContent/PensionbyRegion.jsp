<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.PensionDAO"%>
<%@ page import="db.PensionBean"%>
<%@ page import="db.LocationInfoDAO"%>
<%@ page import="db.LocationInfoBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<body>

<%
	String str = request.getParameter("region");
	int region=Integer.parseInt(str);
%>
<center>

<% 
		//데이터 베이스에 접근
		LocationInfoDAO ldao  = new LocationInfoDAO();
		
		
		LocationInfoBean bean0 = ldao.getLocation(region);

%>
	
	<table width="1000">
		<tr height="100">
			<td align="center"colspan="3">
					<font size="7" color="gray"> <%=bean0.getLocationName() %></font>
			</td>
		</tr>
	<% 
		PensionDAO pdao = new PensionDAO();
		Vector<PensionBean> v = pdao.getPensionByRegion(region);
		//tr를 3개씩 보여주고 다시 tr을 실행 할수 있도록 하는 변수 선언 
		int j = 0;
		for(int i = 0; i < v.size();i++){
			//벡터에 저장되어 있는 빈클래스를 추출
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
				<font size ="3" color="gray"><b> 펜션이름 : <%=bean.getName()%></b></font></p>
			</td>

	<% 		
			j = j+1;
		}
 	%>
	</table>
</center>


</body>
</html>