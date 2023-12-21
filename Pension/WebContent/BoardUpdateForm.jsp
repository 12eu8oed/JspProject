<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
    font-weight: bold;
  }

  .button-link:hover {
    background-color: #FF8800;
  }
</style>
</head>
<body>
<center>
<h2> 게시글 수정</h2>
<% 
    int num = Integer.parseInt(request.getParameter("num").trim());

    BoardDAO bdao = new BoardDAO();
    BoardBean bean = bdao.getOneUpdateBoard(num);
%>
<form name="writeForm" action="BoardUpdateProc.jsp" method ="post" onsubmit="return validateForm()">
    <table width = "600" border = "1" bgcolor="skyblue">
        <tr height= "40">
            <td width="120" align="center">작성자</td>
            <td width="180" align="center"><%=bean.getWrite()%></td>
            <td width="120" align="center">작성자</td>
            <td width="180" align="center"><%=bean.getReg_date()%></td>
        </tr>
        
        <tr height= "40">
            <td width="120" align="center">제목</td>
            <td width="480" colspan="3">&nbsp;<input type="text" name="subject" value="<%=bean.getSubject()%>" size="60"></td>
        </tr>
        
        <tr height= "40">
            <td width="120" align="center">패스워드</td>
            <td width="480" colspan="3">&nbsp;<input type="password" name="password" size="60"></td>
        </tr>
        
        <tr height= "40">
            <td width="120" align="center">글내용</td>
            <td width="480" colspan="3"><textarea rows="10" cols="60" name="content" align="left"><%=bean.getContent()%></textarea></td>
        </tr>
        
        <tr height= "40">
            <td colspan="4" align="center">
                <input type="hidden" name="num" value="<%=bean.getNum() %>">
                <input type="hidden" name="storedPassword" value="<%=bean.getPassword() %>">
                <input type="submit" value="글수정" class="button-link" onclick="return checkPassword()">&nbsp;&nbsp;
                <input type="button" onclick="location.href='Main.jsp?center=BoardList.jsp'" value="전체 글 보기" class="button-link">
            </td>
        </tr>
    </table>
</form>
</center>
<script>
function validateForm() {
    var subject = document.forms["writeForm"]["subject"].value;
    var content = document.forms["writeForm"]["content"].value;

    if (subject == null || subject == "" || content == null || content == "") {
        alert("제목과 글 내용은 필수 입력 사항입니다.");
        return false;
    }
}
function checkPassword() {
    var inputPassword = document.forms["writeForm"]["password"].value;
    var storedPassword = document.forms["writeForm"]["storedPassword"].value;
    
    if (inputPassword !== storedPassword) {
        alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        return false;
    }
    
    return true;
}
</script>
</body>
</html>
