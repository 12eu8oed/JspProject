<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .button-link {
    display: inline-block;
    padding: 8px 12px;
    background-color: #ffbc7a;
    color: #005fbd;
    text-decoration: none;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold; /* 글씨체 굵게 설정 */
  }

  .button-link:hover {
    background-color: #FF8800;
  }
</style>
</head>
<body>
	<% 
		BoardDAO bdao = new BoardDAO();
	
		int num = Integer.parseInt(request.getParameter("num"));
		//하나의 게시글로 리턴 
		BoardBean bean =  bdao.getOneUpdateBoard(num);
	%>
<center>
	<form action = "BoardDeleteProc.jsp" method="post">
		<table width="600" border ="1" bgcolor="skyblue">
			<tr height="40">
				<td width="120" align ="center">작성자</td>
				<td width="180" align ="center"><%=bean.getWrite() %></td>
				<td width="120" align ="center">작성일</td>
				<td width="180" align ="center"><%=bean.getReg_date() %></td>
			</tr>
			
			<tr height="40">
				<td width="120" align ="center">제목</td>
				<td align ="left" colspan="3"><%=bean.getSubject() %></td>
			</tr>
			
			<tr height="40">
				<td width="120" align ="center">패스워드</td>
				<td align ="left" colspan="3"><input type ="password" name="password"></td>
			</tr>
			
			<tr height="40">
				<td align ="center" colspan="4">
					<input type ="hidden" name ="num" value="<%=num %>">
					<input type ="submit" value="글삭제" class="button-link">&nbsp;&nbsp;
					<button type="button" class="button-link" onclick="location.href='Main.jsp?center=BoardList.jsp';">전체 게시글 보기</button>
				</td>
			</tr>
		</table>
	</form>
</center>

</body>
</html>